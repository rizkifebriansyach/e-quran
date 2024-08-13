import 'package:equran_app/features/data/model/surah.dart';
import 'package:equran_app/features/domain/usecase/getlist_usecase.dart';
import 'package:equran_app/features/presentation/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahController extends GetxController {
  final SurahListUsecase surahListUsecase;

  SurahController(this.surahListUsecase);

  RxList<SurahModel> responseListSurah = <SurahModel>[].obs;

  getSurahList() async {
    LoadingDialog.show();
    final result = await surahListUsecase.execute();
    result.fold(
      (error) {
        LoadingDialog.dismiss();
        debugPrint(error.toString());
      },
      (response) {
        LoadingDialog.dismiss();
        responseListSurah.value = response;
        debugPrint("response List: ${responseListSurah[0].nama}");
      },
    );
  }

  @override
  void onReady() {
    getSurahList();
    super.onReady();
  }
}
