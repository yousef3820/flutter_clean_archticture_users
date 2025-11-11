import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/subentities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({required super.lat, required super.lng});
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