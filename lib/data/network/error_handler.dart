import 'package:dio/dio.dart';

import 'failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  REQUEST_TIMEOUT,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMECOUT,
  CANCEL,
  RECIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTON,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;

  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int NOT_FOUND = 404;
  static const int REQUEST_TIMEOUT = 408;

  static const int INTERNAL_SERVER_ERROR = 1;
  static const int CONNECT_TIMECOUT = 0;
  static const int CANCEL = -2;
  static const int RECIVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTON = -6;
  static const int DEFAULT = -7;
}

class ApiInternalStatus {
  static const bool success = true;
  static const bool failure = false;
}

class ResponseMessage {
  static const String SUCCESS = "OK";
  static const String NO_CONTENT = "Success";

  static const String BAD_REQUEST = "Bad request, try again later";
  static const String UNAUTHORISED = "User is unauthorised, try again later";
  static const String FORBIDDEN = "Forbidden request, try again later";
  static const String NOT_FOUND = "";
  static const String REQUEST_TIMEOUT = "Something went wrong, try again later";

  static const String INTERNAL_SERVER_ERROR = "";
  static const String CONNECT_TIMECOUT = "Time Out Error try again later";
  static const String CANCEL = "Request was cancelled, try again later";
  static const String RECIVE_TIMEOUT = "Recive error, try again later";
  static const String SEND_TIMEOUT = "Timeout error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTON =
      "Please Check Internet Connection";
  static const String DEFAULT = "Something went wrong, try again later";
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.REQUEST_TIMEOUT:
        return Failure(
            ResponseCode.REQUEST_TIMEOUT, ResponseMessage.REQUEST_TIMEOUT);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMECOUT:
        return Failure(
            ResponseCode.CONNECT_TIMECOUT, ResponseMessage.CONNECT_TIMECOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIVE_TIMEOUT, ResponseMessage.RECIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTON:
        return Failure(ResponseCode.NO_INTERNET_CONNECTON,
            ResponseMessage.NO_INTERNET_CONNECTON);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ErrorHandler {
  late Failure failure;
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }
  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return DataSource.CONNECT_TIMECOUT.getFailure();
      case DioExceptionType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioExceptionType.receiveTimeout:
        return DataSource.RECIVE_TIMEOUT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.BAD_REQUEST.getFailure();
      case DioExceptionType.badResponse:
        if (error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(error.response?.statusCode! ?? 0,
              error.response?.statusMessage.toString()?? "",error.response?.data?? "");
        } else {
          return DataSource.DEFAULT.getFailure();
        }

      case DioExceptionType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.CONNECT_TIMECOUT.getFailure();
      case DioExceptionType.unknown:
        return DataSource.DEFAULT.getFailure();
    }
  }
}
