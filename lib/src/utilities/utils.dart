import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';
import 'package:flutter_sample_app/src/ui/screens/auth/login.dart';
import 'package:flutter_sample_app/src/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static final dateTimeFormat = DateFormat("d MMM yyyy, HH:mm:a");

  static void loginAction(BuildContext context, String username, String token) {
    ObjectFactory().prefs.isLoggedIn = true;
    ObjectFactory().prefs.setUsername = username;
    ObjectFactory().prefs.setAuthToken = token;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (Route<dynamic> route) => false);
  }

  static void logoutAction(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Do you really want to logout?"),
            actions: <Widget>[
              FlatButton(
                  textColor: FlutterSampleApp.primaryAppColor,
                  child: Text(
                    "CANCEL",
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              FlatButton(
                  textColor: FlutterSampleApp.primaryAppColor,
                  child: Text(
                    "LOGOUT",
                  ),
                  onPressed: () {
                    ObjectFactory().prefs.clearPrefs();
                    ObjectFactory().prefs.isLoggedIn = false;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false);
                  }),
            ],
          );
        });
  }

  static Future<void> launchInBrowser({String url}) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  static String getFormattedDateTime(int timestamp) {
    if (timestamp != null) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

      return dateTimeFormat.format(dateTime).toString();
    } else {
      return "";
    }
  }

  static String capitalize(String s) {
    if (s != null && s.isNotEmpty) {
      return s[0].toUpperCase() + s.substring(1);
    } else {
      return "";
    }
  }

  static String formatAmount(double amount) {
    if (amount == null) return '';

    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(amount);
  }

  static void showConnectionLostMessage(ConnectivityResult connectivity) {
    ObjectFactory().prefs.setNetworkConnectionStatus =
        (connectivity != ConnectivityResult.none);

    if (connectivity == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: Constants.NO_INTERNET_TEXT,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    }
  }
}
