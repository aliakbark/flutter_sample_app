import 'package:flutter_sample_app/src/managers/api/api_client.dart';
import 'package:flutter_sample_app/src/models/auth/password_login_req.dart';

class ApiService {
  ApiClient _client;

  ApiService() {
    _client = ApiClient();
  }

  /// Password login
  Future<dynamic> passwordLogin(PasswordLoginReq passwordLoginReq) {
    return _client.dio.post(_client.apiUserLogin, data: passwordLoginReq);
  }

  /// Logout
  Future<dynamic> logout() {
    return _client.authorizedDio.post('', data: '');
  }

  /// Jobs list
  Future<dynamic> flatsList() {
    return _client.authorizedDio.get(_client.apiFlatsList);
  }
}
