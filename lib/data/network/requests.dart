// Auth
class GetAllDataRequest {
  String token;
  GetAllDataRequest(
      this.token
      );
}
class LoginRequest {
  String email;
  String password;
  LoginRequest(this.email, this.password);
}

class SendAllDataRequest {
  String token;
  String image;
  SendAllDataRequest(
      this.token,
      this.image
      );
}
