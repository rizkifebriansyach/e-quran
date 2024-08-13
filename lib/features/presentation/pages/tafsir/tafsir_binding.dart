import 'package:equran_app/features/data/datasource/surah_datasource.dart';
import 'package:equran_app/features/data/repository/surah_repository_impl.dart';
import 'package:equran_app/features/domain/usecase/gettafsir_usecase.dart';
import 'package:equran_app/features/presentation/pages/tafsir/tafsir_controller.dart';
import 'package:get/get.dart';

class TafsirBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> TafsirController(Get.find<TafsirSurahUsecase>()));
    Get.lazyPut(()=> TafsirSurahUsecase(repository: SurahRepositoryImpl(surahRemoteDatasource: SurahRemoteDatasourceImpl())));
  }
  
}