import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/subModels/adderss_model.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/subModels/company_model.dart';
class UserModel{
  final int id;
  final String username;
  final String website;
  final String name;
  final String phone;
  final String email;
  final AdderssModel address;
  final CompanyModel company;
  UserModel(
    this.id,
    this.username,
    this.website, {
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.company
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      json[ApiKeys.id],
      json[ApiKeys.username],
      json[ApiKeys.website],
      name: json[ApiKeys.name],
      phone: json[ApiKeys.phone],
      email: json[ApiKeys.email],
      address: AdderssModel.fromjson(json[ApiKeys.address]),
      company: CompanyModel.fromjson(json[ApiKeys.company])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.id: id,
      ApiKeys.username: username,
      ApiKeys.website: website,
      ApiKeys.name: name,
      ApiKeys.phone: phone,
      ApiKeys.email: email,
      ApiKeys.address: address,
      ApiKeys.company : company,
    };
  }
}
