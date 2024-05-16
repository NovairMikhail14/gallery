import 'package:gallery/data/network/requests.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../model/auth_models.dart';


abstract class Repository {
  // Auth
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);

  Future<Either<Failure, AllDAta>> getAllData(
      GetAllDataRequest getAllJobRequest);
  Future<Either<Failure, AllDAta>> sendAllImage(
      SendAllDataRequest sendAllDataRequest);

}
