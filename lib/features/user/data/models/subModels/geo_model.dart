import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';

class GeoModel{
  final String lat;
  final String lng;
  GeoModel({required this.lat, required this.lng});
  factory GeoModel.fromjson(Map<String,dynamic>json)
  {
    return GeoModel(lat: json[ApiKeys.lat], lng:json[ApiKeys.lng]);
  }

  Map<String,dynamic> toJson()
  {
    return {
      ApiKeys.lat : lat,
      ApiKeys.lng : lng
    };
  }
}