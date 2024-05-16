import 'package:dartz/dartz.dart';
import 'package:gallery/data/mapper/auth_mapper.dart';
import 'package:gallery/data/network/failure.dart';
import 'package:gallery/data/network/network_info.dart';
import 'package:gallery/data/network/requests.dart';
import '../../domain/model/auth_models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.login(loginRequest);

        if (response.status == null) {
          // Success
          return Right(response.toDomain());
        } else {
          return left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
      // safe to call api
    } else {
      // return internet connection failure
      return left(Failure(ResponseCode.NO_INTERNET_CONNECTON,
          ResponseMessage.NO_INTERNET_CONNECTON));
    }
  }

  @override
  Future<Either<Failure, AllDAta>> getAllData(GetAllDataRequest getAllJobRequest) async{

    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getAllData(getAllJobRequest);

        if (response.status == "success") {
          // Success
          return Right(response.toDomain() as AllDAta);
    } else {
    return left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
    }
    } catch (error) {
    return Left(ErrorHandler.handle(error).failure);
    }
    // safe to call api
    } else {
    // return internet connection failure
    return left(Failure(ResponseCode.NO_INTERNET_CONNECTON,
    ResponseMessage.NO_INTERNET_CONNECTON));
    }
  }

  @override
  Future<Either<Failure, AllDAta>> sendAllImage(SendAllDataRequest sendAllDataRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.sendAllData(sendAllDataRequest);

        if (response.status == "success") {
          // Success
          return Right(response.toDomain() as AllDAta);
        } else {
          return left(Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
      // safe to call api
    } else {
      // return internet connection failure
      return left(Failure(ResponseCode.NO_INTERNET_CONNECTON,
          ResponseMessage.NO_INTERNET_CONNECTON));
    }
  }

  
}

