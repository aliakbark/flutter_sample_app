import 'package:flutter_sample_app/src/managers/api/api_service.dart';
import 'package:flutter_sample_app/src/managers/api/api_client.dart';
import 'package:flutter_sample_app/src/resources/repository/repository.dart';
import 'package:flutter_sample_app/src/managers/prefs.dart';
import 'package:flutter_sample_app/src/resources/repository/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  ///Initialisation of Objects
  Prefs _prefs = Prefs();
  ApiService _apiService = ApiService();
  Repository _repository = Repository();

  ///
  /// Getter of Objects
  ///

  Prefs get prefs => _prefs;

  ApiService get apiService => _apiService;

  Repository get repository => _repository;

  ///
  /// Setter of Objects
  ///

  void setPrefs(SharedPreferences value) {
    _prefs.sharedPreferences = value;
  }
}
