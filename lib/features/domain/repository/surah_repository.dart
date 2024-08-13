import 'package:dartz/dartz.dart';
import 'package:equran_app/features/data/model/detail_surah.dart';
import 'package:equran_app/features/data/model/surah.dart';
import 'package:equran_app/utils/error/failure.dart';

abstract class SurahRepository {
  Future<Either<Failure,List<SurahModel>>> getSurahList();
  Future<Either<Failure,Map<String, dynamic>>> getDetailSurah({required int nomor});
  Future<Either<Failure, Map<String,dynamic>>> getTafsir({required int nomor});
}