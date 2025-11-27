import 'package:dio/dio.dart';
import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/user_model.dart';

enum RequestType { getUserById }

abstract class RequestProtocol<T> {
  String get path;
  String get baseUrl => ApiEndPoints.baseUrl;
  String get mehod;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic> get headers => {"Content-type": "application/json"};
  Object? get data;
  T performParse(Response response);
}

class APIRequest<T> extends RequestProtocol {
  final RequestType requestType;
  final int? id;
  final Map<String, dynamic>? extraParams;
  final Object? body;

  APIRequest({required this.requestType, this.id, this.extraParams, this.body});
  @override
  // TODO: implement data
  Object? get data => body;

  @override
  String get mehod => switch (requestType) {
    RequestType.getUserById => "GET",
  };

  @override
  String get path => switch (requestType) {
    RequestType.getUserById => "${ApiEndPoints.users}/$id",
  };

  @override
  T performParse(Response response) {
    final data = response.data;
    switch (requestType) {
      case RequestType.getUserById:
        return UserModel.fromjson(data) as T;
    }
  }

  @override
  // TODO: implement queryParameters
  Map<String, dynamic>? get queryParameters => extraParams;
}
