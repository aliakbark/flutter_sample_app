import 'package:flutter_sample_app/src/ui/screens/auth/login.dart';
import 'package:flutter_sample_app/src/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';

class App extends StatelessWidget {
  App();

  Widget get _checkAuthNavigate {
    if (ObjectFactory().prefs.isLoggedIn &&
        (ObjectFactory().prefs.getAuthToken != '')) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: FlutterSampleApp.primaryAppColor,
        accentColor: FlutterSampleApp.secondaryAppColor,
        accentColorBrightness: Brightness.light,
        buttonTheme: ButtonThemeData(
            buttonColor: FlutterSampleApp.primaryAppColor,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            textTheme: ButtonTextTheme.accent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0))),
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
          headline1: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
          subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
          caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w100,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
          button: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            color: Colors.black54,
          ),
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _checkAuthNavigate,
    );
  }
}
