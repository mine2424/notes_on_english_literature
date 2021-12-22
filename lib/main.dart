import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  runApp(const ProviderScope(child: App()));
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp();

  const fbEmuHost = String.fromEnvironment('FB_EMU_HOST');
  if (fbEmuHost.isNotEmpty) {
    await _useFirebaseEmulator();
  }

  final remoteConfig = RemoteConfig.instance;

  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 20),
    minimumFetchInterval: const Duration(minutes: 1),
  ));

  await AppService.prepare();
}

Future<void> _useFirebaseEmulator() async {
  final localHostString = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  await FirebaseAuth.instance.useAuthEmulator(localHostString, 9099);
  FirebaseFirestore.instance.settings = Settings(
    host: '$localHostString:8080',
    sslEnabled: false,
    persistenceEnabled: false,
  );
}
