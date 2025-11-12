import 'package:dio/dio.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/exceptions.dart';

class ErrorModel {
  final String status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  
  factory ErrorModel.fromjson(Map<String,dynamic>json)
  {
    return ErrorModel(status: json["status"], errorMessage: json["errormessage"]);
  }
}

void handleExceptions(DioException e) {
      switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ServerException(errorModel: e.response!.data);
      case DioExceptionType.sendTimeout:
        throw ServerException(errorModel: e.response!.data);
    
      case DioExceptionType.receiveTimeout:
        throw ServerException(errorModel: e.response!.data);
    
      case DioExceptionType.badCertificate:
        throw ServerException(errorModel: e.response!.data);
    
    
      case DioExceptionType.cancel:
        throw ServerException(errorModel: e.response!.data);
    
      case DioExceptionType.connectionError:
        throw ServerException(errorModel: e.response!.data);
    
      case DioExceptionType.unknown:
        throw ServerException(errorModel: e.response!.data);

      case DioExceptionType.badResponse:
       switch(e.response?.statusCode){
          case 400:
            throw ServerException(errorModel: e.response!.data);
          case 401:
            throw ServerException(errorModel: e.response!.data);
          case 402:
            throw ServerException(errorModel: e.response!.data);
          case 403:
            throw ServerException(errorModel: e.response!.data);
          case 404:
            throw ServerException(errorModel: e.response!.data);
          case 405:
            throw ServerException(errorModel: e.response!.data);
          case 500:
            throw ServerException(errorModel: e.response!.data);
          case 501:
            throw ServerException(errorModel: e.response!.data);
          case 502:
            throw ServerException(errorModel: e.response!.data);
       }
    }
  }