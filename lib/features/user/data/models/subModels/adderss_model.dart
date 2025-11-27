import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/subModels/geo_model.dart';

class AdderssModel{
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;
  AdderssModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
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
