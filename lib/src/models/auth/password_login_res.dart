// To parse this JSON data, do
//
//     final passwordLoginRes = passwordLoginResFromJson(jsonString);

import 'dart:convert';

PasswordLoginRes passwordLoginResFromJson(String str) =>
    PasswordLoginRes.fromJson(json.decode(str));

String passwordLoginResToJson(PasswordLoginRes data) =>
    json.encode(data.toJson());

class PasswordLoginRes {
  PasswordLoginRes({
    this.message,
    this.token,
    this.user,
  });

  String message;
  String token;
  User user;

  factory PasswordLoginRes.fromJson(Map<String, dynamic> json) =>
      PasswordLoginRes(
        message: json["message"] == null ? null : json["message"],
        token: json["token"] == null ? null : json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "token": token == null ? null : token,
        "user": user == null ? null : user.toJson(),
      };
}

class User {
  User({
    this.userId,
    this.email,
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.bio,
    this.gender,
    this.birthDate,
    this.profession,
    this.userPhoto,
    this.isSeeker,
    this.createdAt,
  });

  String userId;
  String email;
  String firstName;
  String lastName;
  String mobileNo;
  String bio;
  String gender;
  DateTime birthDate;
  String profession;
  String userPhoto;
  bool isSeeker;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"] == null ? null : json["user_id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        bio: json["bio"] == null ? null : json["bio"],
        gender: json["gender"] == null ? null : json["gender"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        profession: json["profession"] == null ? null : json["profession"],
        userPhoto: json["user_photo"] == null ? null : json["user_photo"],
        isSeeker: json["is_seeker"] == null ? null : json["is_seeker"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "bio": bio == null ? null : bio,
        "gender": gender == null ? null : gender,
        "birth_date": birthDate == null
            ? null
            : "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "profession": profession == null ? null : profession,
        "user_photo": userPhoto == null ? null : userPhoto,
        "is_seeker": isSeeker == null ? null : isSeeker,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
