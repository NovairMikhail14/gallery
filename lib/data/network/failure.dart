class Failure{
  int code;
  String message;
  Map<String,dynamic>? dioMessage;

  Failure(this.code, this.message,[this.dioMessage]);
}