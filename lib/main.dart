import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:notes_on_english_literature/app.dart';
import 'package:notes_on_english_literature/domain/app/app_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Firebase
  await _initFirebase();

  runApp(ProviderScope(child: App()));
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();

  final remoteConfig = RemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 20),
    minimumFetchInterval: const Duration(minutes: 1),
  ));

  await AppService.prepare();
}
