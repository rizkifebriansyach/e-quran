// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:equran_app/utils/error/exception.dart';
import 'package:equran_app/utils/network/api_config.dart';
import 'package:equran_app/utils/network/api_exceptions.dart';
import 'package:flutter/material.dart';


Map<String, String> headers = {
  HttpHeaders.authorizationHeader: '',
};

/// Base Request for calling API.
/// * Can be modify as needed.
class ApiRequest {
  static final _networkUtils = NetworkUtilsRequest();
  static Future<Response> post({
    required String url,
    bool useToken = false,
    bool? rocketChatRequest = false,
    // bool? quotaRequest = false,
    // bool? stampRequest = false,
    Map<String, dynamic> headers = const {
      HttpHeaders.authorizationHeader: '',
    },
    String? contentType = Headers.jsonContentType,
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _networkUtils.safeFetch(() {
      try {
        return DioClient.find.post(
          url,
          data: _networkUtils.setBody(
            contentType: contentType,
            body: body,
          ),
          options: Options(
            headers: headers,
            contentType: contentType,
          ),
          queryParameters: queryParameters,
          cancelToken: CancelToken(),
        );
      } catch (e) {
        debugPrint(e.toString());
      }
      // return Response(requestOptions: RequestOptions()) ;
      return Future.error("");
    });
  }

  static Future<Response> get({
    required String url,
    bool useToken = true,
    bool? quotaRequest = false,
    bool? stampRequest = false,
    Object? body,
    String? contentType = Headers.jsonContentType,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await _networkUtils.safeFetch(
      () => DioClient.find.get(
        url,
        data: _networkUtils.setBody(contentType: contentType, body: body),
        options: Options(headers: headers, contentType: contentType),
        queryParameters: queryParameters,
        cancelToken: CancelToken(),
      ),
    );
  }
}

final class NetworkUtilsRequest with NetworkException {
  Object? setBody({
    required String? contentType,
    required Object? body,
  }) {
    if (contentType == Headers.jsonContentType) {
      return body = jsonEncode(body);
    } else if (contentType == Headers.formUrlEncodedContentType) {
      return body;
    } else if (contentType == Headers.multipartFormDataContentType) {
      (body as Map<String, dynamic>).removeWhere((k, v) => v == null);
      return FormData.fromMap(body);
    } else {
      return null;
    }
  }

  Future<Response> safeFetch(Future<Response> Function() tryFetch) async {
    DioClient.setInterceptor();
    try {
      final response = await tryFetch();
      // Check if response indicates an error
      if (response.statusCode != 200) {
        throw Exception(
            'Request failed with status code ${response.statusCode}');
      }
      return response;
    } on ServerException catch (e) {
      // Handle socket exceptions separately (e.g., network issues)
      throw getErrorException('SocketException: $e');
    } on DioException catch (e) {
      // Handle Dio errors (e.g., HTTP errors)
      throw getErrorException(e);
    } on Exception catch (e) {
      // Handle other generic exceptions
      throw getErrorException('An error occurred: $e');
    }
  }
}
