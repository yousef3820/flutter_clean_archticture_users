import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/subModels/geo_model.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/subentities/address_entity.dart';

class AdderssModel extends AddressEntity {
  AdderssModel({
    required super.street,
    required super.suite,
    required super.city,
    required super.zipcode,
    required super.geo,
  });

  factory AdderssModel.fromjson(Map<String, dynamic> json) {
    return AdderssModel(
      street: json[ApiKeys.street],
      suite: json[ApiKeys.suite],
      city: json[ApiKeys.city],
      zipcode: json[ApiKeys.zipcode],
      geo: GeoModel.fromjson(json[ApiKeys.geo]) ,
    );
  }

  Map<String,dynamic> toJson(){
    return {
      ApiKeys.street : street,
      ApiKeys.suite : suite,
      ApiKeys.city : city,
      ApiKeys.zipcode : zipcode,
      ApiKeys.geo : geo,
    };  
  }
}
