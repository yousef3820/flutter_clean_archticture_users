import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromjson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json[ApiKeys.name],
      catchPhrase: json[ApiKeys.catchPhrase],
      bs: json[ApiKeys.bs],
    );
  }
}
