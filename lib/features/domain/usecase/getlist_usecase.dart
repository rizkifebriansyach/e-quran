import 'package:dartz/dartz.dart';
import 'package:equran_app/features/data/model/surah.dart';
import 'package:equran_app/features/domain/repository/surah_repository.dart';
import 'package:equran_app/utils/error/failure.dart';
import 'package:equran_app/utils/usecase/no_params_usecase.dart';

class SurahListUsecase extends NoParamUseCase<List<SurahModel>> {
  final SurahRepository repository;

  SurahListUsecase({required this.repository});
  @override
  Future<Either<Failure, List<SurahModel>>> execute() async {
    return await repository.getSurahList();
  }
}
