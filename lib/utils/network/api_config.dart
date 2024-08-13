import 'package:dio/dio.dart';
import 'package:equran_app/utils/env/env.dart';
import 'package:equran_app/utils/network/api_interceptor.dart';
import 'package:get/get.dart';

class DioClient extends GetxService {
  static String authBaseURL = EnvConfig.baseUrl;

  late Dio _dio;
  static Dio get find => Get.find<DioClient>()._dio;

  @override
  void onInit() {
    _dio = Dio();
    _dio.options.baseUrl = authBaseURL;
    _dio.options.connectTimeout = const Duration(seconds: 30); //60s
    _dio.options.receiveTimeout = const Duration(seconds: 30); //60s
    super.onInit();
  }

  static void setInterceptor() {
    DioClient.find.interceptors.clear();
    DioClient.find.interceptors.add(ApiInterceptors(DioClient.find));
  }
}