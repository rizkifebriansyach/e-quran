import 'package:equran_app/utils/network/api_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceLocator {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Get.lazyPut(() => DioClient());
  }
}
