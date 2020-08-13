import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:flutter_sample_app/src/models/auth/password_login_req.dart';
import 'package:flutter_sample_app/src/models/auth/password_login_res.dart';
import 'package:flutter_sample_app/src/models/base_response.dart';
import 'package:flutter_sample_app/src/models/response_state.dart';

/// api response status code is  checking here, ie  request is  successful or not
/// if the  api response is successful, then return data else return null
class AuthApiProvider {
  Future<ResponseState> passwordLogin(PasswordLoginReq passwordLoginReq) async {
    print(passwordLoginReq.toString());
    final response =
        await ObjectFactory().apiService.passwordLogin(passwordLoginReq);
    print(response.toString());

    if (response.statusCode == 200) {
      return ResponseState<PasswordLoginRes>.success(
          PasswordLoginRes.fromJson(response.data));
    } else {
      return ResponseState<dynamic>.error(
          PasswordLoginRes.fromJson(response.data).message);
    }
  }
}
