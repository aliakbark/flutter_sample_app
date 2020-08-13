import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sample_app/src/app.dart';
import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';
import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: FlutterSampleApp.primaryAppColor,
        statusBarBrightness: Brightness.dark),
  );

  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  ///setting pref
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  ObjectFactory().setPrefs(sharedPreferences);

  runApp(App());
}
