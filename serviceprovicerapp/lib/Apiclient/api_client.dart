import 'package:dio/dio.dart';


import 'package:flutter/material.dart';
class ApiClient {
  static final ApiClient _instance = ApiClient.internal();
  ApiClient.internal();
  factory ApiClient() => _instance;
  late Dio dio;
  int retry = 0;
  Future<Dio> getApiClient() async {
    dio = Dio(_getBaseOptions());
    dio.interceptors.clear();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      return handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
      debugPrint('apiresponse');
      debugPrint(response.data.toString());
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      debugPrint("ERROR MESSAGE:${error.message}");
    }));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    return dio;
  }
  BaseOptions _getBaseOptions() {
    return BaseOptions(
      baseUrl:"https://dummyjson.com/",
      connectTimeout:const Duration(seconds: 6),
      receiveTimeout:const Duration(seconds: 6),
      sendTimeout:const Duration(seconds: 6),
    );
  }
}