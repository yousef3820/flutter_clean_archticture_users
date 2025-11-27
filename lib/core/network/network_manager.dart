import 'package:dio/dio.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/error_model.dart';
import 'package:flutter_clean_archticture_myself_2/core/network/api_request.dart';

class NetworkManager {
  final Dio _dio = Dio();
  Future<T> pefrom<T>(APIRequest<T> requset) async {
    final url = "${requset.baseUrl}/${requset.path}";
    try {
      final response = await _dio.request(
        url,
        data: requset.data,
        queryParameters: requset.queryParameters,
        options: Options(
          headers: requset.headers,
          method: requset.mehod,
          responseType: ResponseType.json,
        ),
      );
      return requset.performParse(response);
    } on DioException catch (e) {
      handleExceptions(e);
      rethrow;
    }
  }
}
