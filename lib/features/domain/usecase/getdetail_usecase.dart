import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:equran_app/features/data/model/detail_surah.dart';
import 'package:equran_app/utils/usecase/params_usecase.dart';

import '../../../utils/error/failure.dart';
import '../repository/surah_repository.dart';

class DetailSurahUsecase extends ParamUseCase<Map<String, dynamic>, DetailParam> {
  final SurahRepository repository;
  DetailSurahUsecase({required this.repository});

  @override
  Future<Either<Failure,Map<String, dynamic>>> execute(DetailParam params) async {
    return await repository.getDetailSurah(nomor: params.nomor);
  }
}

class DetailParam extends Equatable {
  final int nomor;

  const DetailParam({required this.nomor});
  @override
  List<Object?> get props => [nomor];
}
