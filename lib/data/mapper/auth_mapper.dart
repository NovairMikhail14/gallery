import 'package:gallery/app/constants.dart';
import 'package:gallery/app/extensions.dart';
import 'package:gallery/data/responses/auth_response/auth_responses.dart';
import 'package:gallery/domain/model/auth_models.dart';

extension UserResponseMapper on AuthUserResponse? {
  User toDomain() {
    return User(
        this?.id.orZero() ?? Constants.zero,
        this?.name.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.createdAt.orEmpty() ?? Constants.empty,
        this?.updatedAt.orEmpty() ?? Constants.empty);
  }

}
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
        this?.user.toDomain(), this?.token.orEmpty() ?? Constants.empty);
  }
}
extension AllDataResponseMapper on AllDataResponse{
  AllDataResponse toDomain() {
    return AllDataResponse(images);
  }
}

