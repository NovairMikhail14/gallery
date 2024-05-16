
import 'package:dio/dio.dart';
import 'package:gallery/app/constants.dart';
import 'package:retrofit/http.dart';
import '../responses/auth_response/auth_responses.dart';

part 'app_api.g.dart';
//flutter packages pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: Constants.baseURL)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/auth/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @GET("/my-gallery")
  Future<AllDataResponse> getAllData(
    @Header('Authorization') String token,
  );
  @MultiPart()
  @POST("/upload")
  Future<AllDataResponse> sendAllData(
    @Header('Authorization') String token,
    @Part(name: 'img') String image,
  );
}
