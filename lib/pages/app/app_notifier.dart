import 'package:flutter/material.dart';

import 'package:state_notifier/state_notifier.dart';

import 'package:notes_on_english_literature/pages/app/states/app_state.dart';

class AppNotifier extends StateNotifier<AppState> {
  AppNotifier() : super(const AppState());

  void switchTheme(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
  }
}
