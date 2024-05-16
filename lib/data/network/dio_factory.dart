import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gallery/app/app_pref.dart';
import 'package:gallery/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICTION_JSON = "application/json";
const String CONTENT_TYPE = "multipart/form-data; boundary=<calculated when request is sent>";
const String ACCEPT = "*/*";
const String AUTHORIZATION = "authorization";
const String DEFULT_LANGUAGE = "language";

class DioFactory {
  final AppPreferences _appPreferances;
  DioFactory(this._appPreferances);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> header = {
      APPLICTION_JSON: APPLICTION_JSON,
      CONTENT_TYPE: CONTENT_TYPE,
      ACCEPT: ACCEPT,
      // AUTHORIZATION: Constants.token,
  
    };
    dio.options = BaseOptions(
        baseUrl: Constants.baseURL,
        // headers: header,
        receiveTimeout: Constants.API_TIME_OUT,
        sendTimeout: Constants.API_TIME_OUT
        );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ));
    }
    return dio;
  }
}
