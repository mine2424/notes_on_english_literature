import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/single_child_widget.dart';

import 'package:notes_on_english_literature/pages/app/app_notifier.dart';
import 'package:notes_on_english_literature/pages/app/states/app_state.dart';

List<SingleChildWidget> get domainProviders {
  return <SingleChildWidget>[];
}

List<SingleChildWidget> get notifierProviders {
  return <SingleChildWidget>[
    StateNotifierProvider<AppNotifier, AppState>(
      create: (_) => AppNotifier(),
    ),
  ];
}
