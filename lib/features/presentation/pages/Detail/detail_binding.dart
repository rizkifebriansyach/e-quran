import 'package:equran_app/features/data/datasource/surah_datasource.dart';
import 'package:equran_app/features/data/repository/surah_repository_impl.dart';
import 'package:equran_app/features/domain/usecase/getdetail_usecase.dart';
import 'package:equran_app/features/presentation/pages/Detail/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController(Get.find<DetailSurahUsecase>()));
    Get.lazyPut(() => DetailSurahUsecase(
        repository: SurahRepositoryImpl(
            surahRemoteDatasource: SurahRemoteDatasourceImpl())));
  }
}
