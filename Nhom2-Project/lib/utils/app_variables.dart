import 'package:doan/api/api.dart';
import 'package:doan/api/api_interceptor.dart';
import 'package:doan/model/login_info.dart';
import 'package:dio/dio.dart';


class AppVariables {
  static LoginInfo? userInfo;
  static late ApiClient api;

  static void init() {
    final dio = Dio();
    dio.options.contentType = 'application/json;charset=utf-8';
    dio.interceptors.add(ApiInterceptor());
    api = ApiClient(dio);
  }
}
