import 'package:flutter/material.dart';
import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';

class LoadingWidget extends StatelessWidget {
  final String message;

  LoadingWidget({Key key, this.message = 'Please wait..'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(FlutterSampleApp.primaryAppColor)),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }
}
