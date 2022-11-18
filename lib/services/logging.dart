// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:dio/dio.dart';

class Loggining extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("${options.method} => ${options.path} ");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "RESPONSE ${response.statusCode} => ${response.requestOptions.path} ");
    super.onResponse(response, handler);
  }
}
