import 'package:json_annotation/json_annotation.dart';
part 'auth_responses.g.dart';

//flutter packages pub run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class AuthUserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  AuthUserResponse(
      this.id, this.name, this.email, this.createdAt, this.updatedAt);
  factory AuthUserResponse.fromJson(Map<String,dynamic> json) => _$AuthUserResponseFromJson(json);
  Map<String,dynamic> toJson() => _$AuthUserResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "user")
  AuthUserResponse? user;
  @JsonKey(name: "token")
  String? token;

  AuthenticationResponse(this.user, this.token);
  factory AuthenticationResponse.fromJson(Map<String,dynamic> json) => _$AuthenticationResponseFromJson(json);
  Map<String,dynamic> toJson() => _$AuthenticationResponseToJson(this);
}

@JsonSerializable()
class AllDataResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<String>? images;
  AllDataResponse(this.images);
  factory AllDataResponse.fromJson(Map<String,dynamic> json) => _$AllDataResponseFromJson(json);
  Map<String,dynamic> toJson() => _$AllDataResponseToJson(this);
}


