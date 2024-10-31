// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logger/logger.dart';

import 'application/app.dart';
import 'core/constants/app_values.dart';
import 'core/di/app_binding.dart';

Future<void> main() async {
  await dotenv.load();
  await Firebase.initializeApp();
  await AppBinding().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('en');
  initializeDateFormatting('vi');
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: <SystemUiOverlay>[SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: true,
  ));
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
  flavor = (await const MethodChannel('flavor').invokeMethod<String>('getFlavor'))!;
  // await AppPrefs.initListener();
  Logger().d('RUNNING IN $flavor ENVIRONMENT'.toUpperCase());
  runApp(const App());
}
