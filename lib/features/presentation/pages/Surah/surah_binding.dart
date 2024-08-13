import 'package:equran_app/features/data/datasource/surah_datasource.dart';
import 'package:equran_app/features/data/repository/surah_repository_impl.dart';
import 'package:equran_app/features/domain/usecase/getlist_usecase.dart';
import 'package:equran_app/features/presentation/pages/Surah/surah_controller.dart';
import 'package:get/get.dart';

class SurahBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SurahController(Get.find<SurahListUsecase>()));
    Get.lazyPut(
      () => SurahListUsecase(
        repository: SurahRepositoryImpl(
          surahRemoteDatasource: SurahRemoteDatasourceImpl(),
        ),
      ),
    );
  }
}
