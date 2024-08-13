import 'package:dartz/dartz.dart';
import 'package:equran_app/utils/error/failure.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure,Type>> execute();
}