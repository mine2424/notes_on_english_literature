import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:notes_on_english_literature/di_container.dart';

import 'package:notes_on_english_literature/pages/initial_page.dart';
import 'package:notes_on_english_literature/pages/common/theme.dart';
import 'package:notes_on_english_literature/pages/onBoarding/onBoarding_page.dart';
import 'package:notes_on_english_literature/pages/app/states/user_state.dart';

class App extends HookWidget {
  App();

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    final userState = UserState();

    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: useProvider(appNotifierProvider).themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      home: (AuthStatus.none != userState.authStatus)
          ? InitialPage()
          : OnBoardingPage(),
    );
  }
}
