import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/common/types/status.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/initial_page.dart';
import 'package:notes_on_english_literature/common/theme.dart';
import 'package:notes_on_english_literature/pages/onBoarding/on_boarding_page.dart';
import 'package:notes_on_english_literature/widgets/custom_indicator.dart';

class App extends HookWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: useProvider(appNotifierProvider.notifier).navigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: useProvider(appNotifierProvider).themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      home: const Config(),
    );
  }
}

class Config extends HookWidget {
  const Config();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await context.read(userNotifierProvider.notifier).listenAuthStatus();
    });

    final authStatus = useProvider(userNotifierProvider).authStatus;

    return (authStatus == AuthStatus.waiting)
        ? const CustomIndicator()
        : (authStatus == AuthStatus.none)
            ? const OnBoardingPage()
            : const InitialPage();
  }
}
