import 'package:dio/dio.dart';

abstract class ResponseHandler {
  ResponseHandler();
}

class SuccsesResponse<T> extends ResponseHandler {
  T model;
  SuccsesResponse(this.model);
}

class ErrorResponse extends ResponseHandler {
  String error;
  ErrorResponse(this.error);

  
}

class ExcaptionResponse extends ResponseHandler {
  DioError error;
  ExcaptionResponse(this.error);
}
