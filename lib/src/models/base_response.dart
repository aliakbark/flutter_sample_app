// To parse this JSON data, do
//
//     final baseResponse = baseResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BaseResponse baseResponseFromJson(String str) =>
    BaseResponse.fromJson(json.decode(str));

String baseResponseToJson(BaseResponse data) => json.encode(data.toJson());

class BaseResponse {
  BaseResponse({
    @required this.success,
    @required this.statusCode,
    @required this.message,
    @required this.error,
  });

  bool success;
  int statusCode;
  String message;
  String error;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        success: json["success"] == null ? false : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        message: json["message"] == null ? "" : json["message"],
        error: json["error"] == null ? "" : json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "status_code": statusCode == null ? null : statusCode,
        "message": message == null ? null : message,
        "error": error == null ? null : error,
      };
}
