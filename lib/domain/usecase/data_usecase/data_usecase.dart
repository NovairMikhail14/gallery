
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gallery/data/network/failure.dart';
import 'package:gallery/data/network/requests.dart';
import 'package:gallery/domain/model/auth_models.dart';
import 'package:gallery/domain/usecase/base_usecase.dart';
import 'package:gallery/domain/repository/repository.dart';
import 'package:image_picker/image_picker.dart';

class GetAllDataUseCaseInput {
  String token;
  GetAllDataUseCaseInput(
    this.token,
  );
}
class GetAllDataUseCaseUseCase
    extends BaseUsecase<GetAllDataUseCaseInput,AllDAta> {
Repository repository;
GetAllDataUseCaseUseCase(this.repository);

  @override
  Future<Either<Failure, AllDAta>> execute(GetAllDataUseCaseInput input) {
    return repository.getAllData(GetAllDataRequest(input.token));
  }
  }
  class SendAllDataUseCaseInput {
  String token;
  File image;
  SendAllDataUseCaseInput(
    this.token,
      this.image
  );
}
class SendAllDataUseCaseUseCase
    extends BaseUsecase<SendAllDataUseCaseInput,AllDAta> {
Repository repository;
SendAllDataUseCaseUseCase(this.repository);

  @override
  Future<Either<Failure, AllDAta>> execute(SendAllDataUseCaseInput input) {
    return repository.sendAllImage(SendAllDataRequest(input.token,input.image));
  }
  }