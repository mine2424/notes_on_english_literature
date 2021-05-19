import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase
  _initFirebase();

  runApp(ProviderScope(child: App()));
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();
}
