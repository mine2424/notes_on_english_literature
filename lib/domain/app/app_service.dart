import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

enum AppUpdateAvailability {
  none,
  available,
  required,
}

enum AppUnderMaintenance {
  none,
  error,
  underMaintenance,
  available,
}

class AppService {
  final remoteConfig = RemoteConfig.instance;

  var _targetVersion = '0.0.0';
  var _status = AppUpdateAvailability.none;
  var _maintenanceStatus = AppUnderMaintenance.none;

  AppUnderMaintenance get maintenanceStatus => _maintenanceStatus;

  static String canUpdateIfBefore = 'can_update_if_before';
  static String isUpdateRequired = 'is_update_required';
  static String isUnderMaintenance = 'is_Mentenance';

  /// firebase remote configの初期化
  static Future<void> prepare() async {
    RemoteConfig.instance.setDefaults(<String, dynamic>{
      canUpdateIfBefore: '0.0.0',
      isUpdateRequired: false,
      isUnderMaintenance: false,
    });
  }

  /// 強制アップデートの必要があるかどうか
  Future<AppUpdateAvailability> check() async {
    _reset();
    await _fetchUpdateInfo();

    return await _isAvailable() ? _status : AppUpdateAvailability.none;
  }

  void _reset() {
    _targetVersion = '0.0.0';
    _status = AppUpdateAvailability.none;
    _maintenanceStatus = AppUnderMaintenance.none;
  }

  Future<void> _fetchUpdateInfo() async {
    final remoteConfig = RemoteConfig.instance;

    try {
      await remoteConfig.fetchAndActivate();
    } on Exception catch (e) {
      print(e);
      return;
    }

    _targetVersion = remoteConfig.getString(canUpdateIfBefore);

    _status = remoteConfig.getBool(isUpdateRequired)
        ? AppUpdateAvailability.required
        : AppUpdateAvailability.available;

    _maintenanceStatus = remoteConfig.getBool(isUnderMaintenance)
        ? AppUnderMaintenance.underMaintenance
        : AppUnderMaintenance.available;
  }

  Future<String?> appVersion() async {
    // 例外は発生しないはず（発生するとしてもErrorのみ）だが念のために捕捉
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return packageInfo.version;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  /// 現在より新しいアプリバージョンがあるかどうか
  ///
  /// 現在のアプリバージョンがRemote Configで設定されているバージョンより低いかどうか。
  ///
  /// 「1.0.0-pre」のようにマイナスが付いているバージョンは「1.0.0」より低く、
  /// 「1.0.0+1」のようにプラスが付いていれば高いとみなされる。
  /// 「1.0.0.0」のような四つに区切った形式には対応していない。
  Future<bool> _isAvailable() async {
    final currentAppVersion = await appVersion() ?? '0.0.0';

    try {
      final currentVersion = Version.parse(currentAppVersion);
      final targetVersion = Version.parse(_targetVersion);
      return currentVersion.compareTo(targetVersion).isNegative;
    } on Exception catch (e) {
      // バージョンの比較に失敗した場合はアップデート不要扱いにする
      print(e);
      return false;
    }
  }
}
