// Auth

import 'dart:io';

import 'package:image_picker/image_picker.dart';

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
  File image;
  SendAllDataRequest(
      this.token,
      this.image
      );
}
