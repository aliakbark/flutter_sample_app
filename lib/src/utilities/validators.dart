import 'dart:async';

import 'constants.dart';

///validators  for stream
///if the validation satisfy then data will be added in stream else add error in stream
class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError(Constants.EMAIL_NOT_VALID);
    }
  });

  final usernameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.length > 3) {
      sink.add(username);
    } else {
      sink.addError(Constants.USERNAME_NOT_VALID);
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError(Constants.PASSWORD_LENGTH);
    }
  });

  final validatePhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (RegExp(r"^(?:[+0]+)?[0-9]{10}$").hasMatch(phone)) {
      sink.add(phone);
    } else {
      sink.addError(Constants.INVALID_MOBILE_NUM);
    }
  });

  final validateIsEmpty =
      StreamTransformer<String, String>.fromHandlers(handleData: (text, sink) {
    if (text.trim().isNotEmpty) {
      sink.add(text);
    } else {
      sink.addError(Constants.INVALID_INPUT);
    }
  });
}
