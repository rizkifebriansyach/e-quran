import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class LoadingDialog {
  static show({bool? dismissible}) {
    return showGeneralDialog(
      context: Get.context!,
      barrierLabel: 'Barrier',
      barrierDismissible: dismissible ?? false,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: const PlatformLoadingIndicator(color: Colors.green),
          ),
        );
      },
    );
  }

  static dismiss() => Get.back();
}

class PlatformLoadingIndicator extends StatelessWidget {
  const PlatformLoadingIndicator({Key? key, this.color}) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Center(
        child: CircularProgressIndicator(
          color: color,
        ),
      );
    } else {
      return Center(
        child: CupertinoActivityIndicator(
          radius: 16,
          color: color,
        ),
      );
    }
  }
}

Widget loadingIndicator =
    const SpinKitThreeBounce(size: 45, color: Colors.blue);