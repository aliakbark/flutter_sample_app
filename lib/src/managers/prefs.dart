import 'package:shared_preferences/shared_preferences.dart';

/// shared preference storage
class Prefs {
  SharedPreferences _sharedPreferences;

  static const String _IS_LOGGED_IN = "is_logged_in";
  static const String _PHONE = "phone";
  static const String _USERNAME = "username";
  static const String _NETWORK_CONNECTION = "has_network_connection";
  static const String _AUTH_TOKEN = "auth_token";

  static const String _APP_LANGUAGE_CODE = "app_language_code";
  static const String _APP_COUNTRY_CODE = "app_country_code";

  Prefs();

  set sharedPreferences(SharedPreferences value) {
    _sharedPreferences = value;
  }

  /// for clearing the data in preference
  void clearPrefs() {
    _sharedPreferences.clear();
  }

  bool get isLoggedIn => _sharedPreferences.getBool(_IS_LOGGED_IN) ?? false;

  set isLoggedIn(bool loggedInStatus) {
    _sharedPreferences.setBool(_IS_LOGGED_IN, loggedInStatus);
  }

  bool get hasNetworkConnection =>
      _sharedPreferences.getBool(_NETWORK_CONNECTION) ?? false;

  set setNetworkConnectionStatus(bool hasNetworkConnection) {
    _sharedPreferences.setBool(_NETWORK_CONNECTION, hasNetworkConnection);
  }

  String get getPhone => _sharedPreferences.getString(_PHONE) ?? '';

  set setPhone(String phone) {
    _sharedPreferences.setString(_PHONE, phone);
  }

  String get getUsername => _sharedPreferences.getString(_USERNAME) ?? '';

  set setUsername(String username) {
    _sharedPreferences.setString(_USERNAME, username);
  }

  String get getLanguageCode =>
      _sharedPreferences.getString(_APP_LANGUAGE_CODE) ?? 'en';

  set setLanguageCode(String languageCode) {
    _sharedPreferences.setString(_APP_LANGUAGE_CODE, languageCode);
  }

  String get getCountryCode =>
      _sharedPreferences.getString(_APP_COUNTRY_CODE) ?? 'IN';

  set setCountryCode(String countryCode) {
    _sharedPreferences.setString(_APP_COUNTRY_CODE, countryCode);
  }

  String get getAuthToken => _sharedPreferences.getString(_AUTH_TOKEN) ?? '';

  set setAuthToken(String token) {
    _sharedPreferences.setString(_AUTH_TOKEN, 'Token $token');
  }
}
