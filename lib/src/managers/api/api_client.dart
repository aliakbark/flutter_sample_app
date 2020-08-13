import 'dart:io';

import 'package:flutter_sample_app/src/managers/flutter_sample_app.dart';
import 'package:flutter_sample_app/src/managers/object_factory.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class ApiClient {
  Dio _dio;
  String test;

  ApiClient() {
    initClient();
  }

  initClient() async {
    _dio = new Dio(new BaseOptions(
        baseUrl: FlutterSampleApp.baseUrl,
        connectTimeout: 30000,
        receiveTimeout: 1000000,
        followRedirects: true,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json,
          HttpHeaders.acceptHeader: ContentType.json,
        },
        responseType: ResponseType.json,
        receiveDataWhenStatusError: true));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions reqOptions) {
        return reqOptions;
      },
      onError: (DioError dioError) {
        return dioError.response;
      },
    ));
    _dio.interceptors.add(CookieManager(CookieJar()));
  }

  Dio get dio => _dio;

  Dio get authorizedDio {
    _dio.options.headers
        .addAll({"Authorization": ObjectFactory().prefs.getAuthToken});
    return _dio;
  }


  ///API URLs
  String apiUserLogin = 'api/login/'; // Method: POST
  String apiFlatsList = 'api/flats/'; // Method: GET

}
