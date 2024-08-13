import 'package:equran_app/features/domain/usecase/gettafsir_usecase.dart';
import 'package:equran_app/features/presentation/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TafsirController extends GetxController {
  final TafsirSurahUsecase tafsirSurahUsecase;
  TafsirController(this.tafsirSurahUsecase);

  Rxn<Map<String, dynamic>> tafsirData = Rxn<Map<String, dynamic>>();
  late int nomor;

  getTafsir() async {
    LoadingDialog.show();
    final result =
        await tafsirSurahUsecase.execute(TafsirParam(nomor: nomor));

    result.fold(
      (error) {
        LoadingDialog.dismiss();
        debugPrint(error.toString());
      },
      (response) {
        LoadingDialog.dismiss();
        tafsirData.value = response;
      },
    );
  }

  @override
  void onInit() {
    nomor = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    getTafsir();
    super.onReady();
  }
}
