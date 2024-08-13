import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final class ApiInterceptors extends InterceptorsWrapper {
  ApiInterceptors(this._dio);
  final Dio _dio;

  @override
  Future<dynamic> onRequest(options, handler) async {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# REQUEST');
      debugPrint('--> ${options.method.toUpperCase()} - ${options.uri}');
      debugPrint('Headers: ${options.headers}');
      debugPrint('Query Params: ${options.queryParameters}');
      debugPrint('Body: ${options.data}');
      if (options.contentType == 'multipart/form-data') {
        debugPrint('Data: ${options.data.fields}');
      }
      debugPrint('--> END ${options.method.toUpperCase()}');
    }
    return handler.next(options);
  }

  @override
  Future<dynamic> onResponse(response, handler) async {
    if (kDebugMode) {
      debugPrint('');
      debugPrint('# RESPONSE');
      debugPrint('<-- ${(response.requestOptions.uri)}');
      debugPrint('Status Code : ${response.statusCode} ');
      debugPrint('Headers: ${response.headers}');
      debugPrint('Response: ${response.data}');
      debugPrint('<-- END HTTP');
    }
    return super.onResponse(response, handler);
  }

  @override
  Future<dynamic> onError(DioException err, handler) async {
    // if (kDebugMode) {
    debugPrint('');
    debugPrint('# ERROR');
    debugPrint('<-- ${err.response?.requestOptions.baseUrl}');
    debugPrint('Status Code : ${err.response?.statusCode} ');
    debugPrint('Error Message : ${err.response?.data} ');
    debugPrint('Error Message Data : ${err.response?.data} ');
    debugPrint('Error Message : ${err.message} ');
    debugPrint('Error Response Message : ${err.response?.statusMessage} ');
    debugPrint('Response Path : ${err.response?.requestOptions.uri}');
    debugPrint('<-- End HTTP');
    return super.onError(err, handler);
  }
}
