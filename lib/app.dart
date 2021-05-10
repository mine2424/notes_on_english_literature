import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:notes_on_english_literature/pages/common/theme.dart';
import 'package:notes_on_english_literature/pages/home/home_page.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: context.watch<AppNotifier>().navigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      // themeMode: context.select((AppState state) => state.themeMode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [],
      initialRoute: '/',
      home: HomePage(),
    );
  }
}
