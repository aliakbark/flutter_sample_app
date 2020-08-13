import 'dart:async';

import 'package:flutter_sample_app/src/blocs/base_bloc.dart';
import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/models/auth/password_login_req.dart';
import 'package:flutter_sample_app/src/models/auth/password_login_res.dart';
import 'package:flutter_sample_app/src/models/base_response.dart';
import 'package:flutter_sample_app/src/models/response_state.dart';
import 'package:flutter_sample_app/src/utilities/utils.dart';
import 'package:flutter_sample_app/src/utilities/validators.dart';
import 'package:rxdart/rxdart.dart';

/// api response of login is managed by AuthBloc
/// stream data is handled by StreamControllers
class AuthBloc extends Object with Validators implements BaseBloc {
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _screenStatus = BehaviorSubject<ScreenStatus>();
  final _passwordLogin = BehaviorSubject<PasswordLoginRes>();

  // Add data to stream, validate inputs

  Stream<String> get username => _username.stream.transform(usernameValidator);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get submitCheckLogin {
    return Rx.combineLatest2(username, password, (e, p) => true);
  }

  Stream<PasswordLoginRes> get passwordLogin => _passwordLogin.stream;

  // get value

  String get getUsername => _username.value;

  String get getPassword => _password.value;

  // change data

  Function(String) get changeUsername => _username.sink.add;

  Function(String) get changePassword => _password.sink.add;

  void loginUsingPassword({String username, String password}) async {
    changeScreenStatus(ScreenStatus.loading);
    ResponseState state = await ObjectFactory().repository.passwordLogin(
        PasswordLoginReq(username: username, password: password));
    changeScreenStatus(ScreenStatus.ready);
    if (state is SuccessResponseState) {
      _passwordLogin.sink.add(state.value);
    } else if (state is ErrorResponseState) {
      _passwordLogin.sink.addError('${state.msg}');
    }
  }

  @override
  Function(ScreenStatus) get changeScreenStatus => _screenStatus.sink.add;

  @override
  ScreenStatus get getScreenStatus => _screenStatus.value;

  @override
  Stream<ScreenStatus> get screenStatus => _screenStatus.stream;

  @override
  void dispose() async {
    await _screenStatus.drain();
    _screenStatus.close();
    await _username.drain();
    _username.close();
    await _password.drain();
    _password.close();
    await _passwordLogin.drain();
    _passwordLogin.close();
  }
}
