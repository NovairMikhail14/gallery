import 'package:dartz/dartz.dart';
import 'package:gallery/data/network/failure.dart';

abstract class BaseUsecase<Input, Output> {
  Future<Either<Failure, Output>> execute(Input input);
}
