import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_on_english_literature/domain/app/app_service.dart';
import 'package:notes_on_english_literature/pages/app/states/app_state.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';
import 'package:notes_on_english_literature/widgets/dialog/unclose_dialog.dart';
import 'package:state_notifier/state_notifier.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier({required this.appService}) : super(AppState());

  final AppService appService;

  final navigatorKey = GlobalKey<NavigatorState>();

  void switchTheme(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  Future<T?>? push<T extends Object?>(Widget newRoute, [bool? isfullDialog]) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(
        fullscreenDialog: isfullDialog ?? false,
        builder: (context) {
          return newRoute;
        },
      ),
    );
  }

  Future<void> checkForcedUpdate() async {
    final context = navigatorKey.currentState!.context;

    final status = await appService.check();
    final maintenance = appService.maintenanceStatus;

    if (maintenance == AppUnderMaintenance.underMaintenance) {
      return UncloseDialog(
        closeAppOnBack: true,
        content: 'アプリメンテナンス中です。ご不便をおかけしますが、一時的にご利用を停止させていただいております。',
        actions: [
          RadiusButton(
            text: '閉じる',
            textStyle: Theme.of(context).textTheme.bodyText2!,
            onTapLogic: () async {
              await SystemNavigator.pop();
            },
          ).show(context),
        ],
      ).show(context);
    }

    if (status == AppUpdateAvailability.required) {
      UncloseDialog(
        closeAppOnBack: true,
        title: '「重要」アップデート',
        content: '最新版がリリースされましたアップデートをお願いします。',
        actions: [
          RadiusButton(
            text: 'update for android',
            textStyle: Theme.of(context).textTheme.bodyText2!,
            onTapLogic: () {},
          ).show(context),
          RadiusButton(
            text: 'update for ios',
            textStyle: Theme.of(context).textTheme.bodyText2!,
            onTapLogic: () {},
          ).show(context),
        ],
      ).show(context);
    }
  }
}
