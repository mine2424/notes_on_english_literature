import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notes_on_english_literature/di_container.dart';
import 'package:notes_on_english_literature/pages/initial_page.dart';

import 'package:provider/provider.dart';

import 'package:notes_on_english_literature/pages/app/app_notifier.dart';
import 'package:notes_on_english_literature/pages/app/states/app_state.dart';
import 'package:notes_on_english_literature/pages/common/theme.dart';
import 'package:notes_on_english_literature/pages/home/home_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...notifierProviders],
      child: Config(),
    );
  }
}

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: context.watch<AppNotifier>().navigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: context.select((AppState state) => state.themeMode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      home: InitialPage(),
    );
  }
}
