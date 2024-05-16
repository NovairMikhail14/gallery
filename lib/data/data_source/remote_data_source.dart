import 'package:gallery/data/network/app_api.dart';

import '../network/requests.dart';
import '../responses/auth_response/auth_responses.dart';


abstract class RemoteDataSource {
  // Auth
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<AllDataResponse> getAllData(GetAllDataRequest getAllDAta);
  Future<AllDataResponse> sendAllData(SendAllDataRequest sendAllData);
}

class RemoteDataSourceImp implements RemoteDataSource {
  AppServiceClient appServiceClient;

  RemoteDataSourceImp(this.appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<AllDataResponse> getAllData(GetAllDataRequest getAllJobRequest) async {
    return await appServiceClient.getAllData("Bearer ${getAllJobRequest.token}");
  }

  @override
  Future<AllDataResponse> sendAllData(SendAllDataRequest sendAllData)async {
    return await appServiceClient.sendAllData("Bearer ${sendAllData.token}",sendAllData.image);
  }

}
