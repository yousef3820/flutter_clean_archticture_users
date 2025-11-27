import 'package:dio/dio.dart';

/// -----------------------------
/// 1️⃣ Enum for Request Type
/// -----------------------------
enum RequestType {
  login,
  characters,
  characterById,
}

/// -----------------------------
/// 2️⃣ Base Request Protocol
/// -----------------------------
abstract class RequestProtocol<T> {
  RequestType get type;

  String get baseUrl => "https://rickandmortyapi.com/api/";

  /// Derived from switch(type)
  String get path;

  /// Derived from switch(type)
  String get method;

  Map<String, String> get headers => {"Content-Type": "application/json"};

  Map<String, dynamic>? get parameters;
  dynamic get body;

  /// Parse response to model
  T parseResponse(Response response);
}

/// -----------------------------
/// 3️⃣ Concrete Request
/// -----------------------------
class APIRequest<T> extends RequestProtocol<T> {
  @override
  final RequestType type;

  final int? id;
  final Map<String, dynamic>? extraParams;
  final dynamic requestBody;

  APIRequest({
    required this.type,
    this.id,
    this.extraParams,
    this.requestBody,
  });

  @override
  String get path {
    switch (type) {
      case RequestType.login:
        return "auth/login";
      case RequestType.characters:
        return "character/";
      case RequestType.characterById:
        return "character/$id";
    }
  }

  @override
  String get method {
    switch (type) {
      case RequestType.login:
        return "POST";
      case RequestType.characters:
      case RequestType.characterById:
        return "GET";
    }
  }

  @override
  Map<String, dynamic>? get parameters {
    switch (type) {
      case RequestType.characters:
        return extraParams;
      default:
        return null;
    }
  }

  @override
  dynamic get body {
    switch (type) {
      case RequestType.login:
        return requestBody;
      default:
        return null;
    }
  }

  @override
  T parseResponse(Response response) {
    final data = response.data;

    switch (type) {
      case RequestType.login:
        return data['token'] as T;

      case RequestType.characterById:
        return Character.fromJson(data) as T;

      case RequestType.characters:
        final results = data["results"] as List;
        return results.map((e) => Character.fromJson(e)).toList() as T;
    }
  }
}

/// -----------------------------
/// 4️⃣ Network Manager (Dio)
/// -----------------------------
class NetworkManager {
  final Dio _dio = Dio();

  Future<T> perform<T>(APIRequest<T> request) async {
    final url = "${request.baseUrl}${request.path}";

    try {
      final response = await _dio.request(
        url,
        data: request.body,
        queryParameters: request.parameters,
        options: Options(
          method: request.method,
          headers: request.headers,
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return request.parseResponse(response);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error:
              "HTTP ${response.statusCode}: ${response.statusMessage}\n${response.data}",
        );
      }
    } on DioException catch (e) {
      final message =
          e.response?.data?.toString() ?? e.message ?? "Unknown network error";
      throw Exception("Network Error: $message");
    }
  }
}

/// -----------------------------
/// 5️⃣ Model Example
/// -----------------------------
class Character {
  final int id;
  final String name;
  final String status;

  Character({required this.id, required this.name, required this.status});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"],
      name: json["name"],
      status: json["status"],
    );
  }
}

/// -----------------------------
/// 6️⃣ Usage Example
/// -----------------------------
void main() async {
  final network = NetworkManager();

  try {
    // 🔹 Example 1: GET all characters
    final characters = await network.perform<List<Character>>(
      APIRequest(type: RequestType.characters),
    );
    print("Total characters: ${characters.length}");

    // 🔹 Example 2: GET character by ID
    final character = await network.perform<Character>(
      APIRequest(type: RequestType.characterById, id: 1),
    );
    print("Character: ${character.
    
    name}");

    // 🔹 Example 3: POST login (mock example)
    final token = await network.perform<String>(
      APIRequest(
        type: RequestType.login,
        requestBody: {"username": "morty", "password": "1234"},
      ),
    );
    print("Token: $token");
  } catch (e) {
    print("Error: $e");
  }
}
