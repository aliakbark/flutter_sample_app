import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';

// ignore: must_be_immutable
class SlideDots extends StatelessWidget {
  bool isActive;

  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: const EdgeInsets.all(4.0),
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: isActive ? FlutterSampleApp.primaryAppColor : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}
