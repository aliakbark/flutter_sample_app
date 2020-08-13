// To parse this JSON data, do
//
//     final passwordLoginReq = passwordLoginReqFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PasswordLoginReq passwordLoginReqFromJson(String str) =>
    PasswordLoginReq.fromJson(json.decode(str));

String passwordLoginReqToJson(PasswordLoginReq data) =>
    json.encode(data.toJson());

class PasswordLoginReq {
  PasswordLoginReq({
    @required this.username,
    @required this.password,
  });

  String username;
  String password;

  factory PasswordLoginReq.fromJson(Map<String, dynamic> json) =>
      PasswordLoginReq(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
