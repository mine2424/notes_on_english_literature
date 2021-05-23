import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:notes_on_english_literature/widgets/button/radius_button.dart';
import 'package:notes_on_english_literature/widgets/dialog/unclose_dialog.dart';

import 'package:state_notifier/state_notifier.dart';

import 'package:notes_on_english_literature/domain/app/app_service.dart';
import 'package:notes_on_english_literature/pages/app/states/app_state.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier({required this.appService}) : super(const AppState());

  final AppService appService;

  final navigatorKey = GlobalKey<NavigatorState>();

  void switchTheme(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }

  Future<T?>? push<T extends Object?>(Widget newRoute) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) {
          return newRoute;
        },
      ),
    );
  }

  Future<void> checkForcedUpdate() async {
    final status = await appService.check();
    final context = navigatorKey.currentState!.context;

    switch (status) {
      case AppUpdateAvailability.available:
        // TODO: enum付け加えるかも
        break;
      case AppUpdateAvailability.required:
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
        break;
      case AppUpdateAvailability.none:
        // 基本的にネットワークエラーが生じた場合の例外
        break;
    }
  }
}
