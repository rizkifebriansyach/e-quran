import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:equran_app/features/domain/repository/surah_repository.dart';
import 'package:equran_app/utils/error/failure.dart';
import 'package:equran_app/utils/usecase/params_usecase.dart';

class TafsirSurahUsecase extends ParamUseCase<Map<String, dynamic>, TafsirParam> {
  final SurahRepository repository;
  TafsirSurahUsecase({required this.repository});

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      TafsirParam params) async {
    return await repository.getTafsir(nomor: params.nomor);
  }
}

class TafsirParam extends Equatable {
  final int nomor;

  const TafsirParam({required this.nomor});
  @override
  List<Object?> get props => [nomor];
}
