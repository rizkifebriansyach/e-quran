import 'package:equran_app/features/domain/usecase/getdetail_usecase.dart';
import 'package:equran_app/features/presentation/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final DetailSurahUsecase detailSurahUsecase;

  DetailController(this.detailSurahUsecase);

  Rxn<Map<String, dynamic>> detailData = Rxn<Map<String, dynamic>>();
  var listAyat = [].obs;

  late int nomor;

  getDetail() async {
    LoadingDialog.show();
    final result = await detailSurahUsecase.execute(DetailParam(nomor: nomor));
    result.fold(
      (error) {
        LoadingDialog.dismiss();
        debugPrint(error.toString());
      },
      (response) {
        detailData.value = response;
        LoadingDialog.dismiss();
        // listAyat.value = response["ayat"];
        debugPrint("detail Data ${detailData.value?["ayat"].toString()}");
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
    getDetail();
    super.onReady();
  }
}
