import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/models/auth/password_login_req.dart';
import 'package:flutter_sample_app/src/models/response_state.dart';
import 'package:flutter_sample_app/src/resources/remote/auth_api_provider.dart';
import 'package:flutter_sample_app/src/resources/remote/flats_api_provider.dart';

/// Repository is an intermediary class between network and data
class Repository {
  final authApiProvider = AuthApiProvider();
  final flatsApiProvider = FlatsApiProvider();

  ///Password Login
  Future<ResponseState> passwordLogin(PasswordLoginReq passwordLoginReq) =>
      authApiProvider.passwordLogin(passwordLoginReq);

  ///Fetch flats
  Future<ResponseState> flatsList() => flatsApiProvider.flatsList();
}
