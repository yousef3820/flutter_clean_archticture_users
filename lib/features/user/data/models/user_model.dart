import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/subModels/adderss_model.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/subModels/company_model.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final CompanyModel company;
  UserModel(
    this.id,
    this.username,
    this.website, {
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
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
