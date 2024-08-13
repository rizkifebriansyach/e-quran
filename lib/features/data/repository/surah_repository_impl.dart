import 'package:dartz/dartz.dart';
import 'package:equran_app/features/data/datasource/surah_datasource.dart';
import 'package:equran_app/features/data/model/detail_surah.dart';
import 'package:equran_app/features/data/model/surah.dart';
import 'package:equran_app/features/domain/repository/surah_repository.dart';
import 'package:equran_app/utils/error/failure.dart';

class SurahRepositoryImpl implements SurahRepository {
  final SurahRemoteDatasource surahRemoteDatasource;

  SurahRepositoryImpl({required this.surahRemoteDatasource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> getDetailSurah(
      {required int nomor}) async {
    try {
      final result = await surahRemoteDatasource.getDetailSurah(nomor: nomor);
      return (Right(result));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SurahModel>>> getSurahList() async {
    try {
      final result = await surahRemoteDatasource.getSurahList();
      return (Right(result));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getTafsir(
      {required int nomor}) async {
    try {
      final result = await surahRemoteDatasource.getDetailTafsir(nomor: nomor);
      return (Right(result));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
