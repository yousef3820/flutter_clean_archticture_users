import 'package:flutter_clean_archticture_myself_2/core/apis/api_consumer.dart';
import 'package:flutter_clean_archticture_myself_2/core/apis/api_end_points.dart';
import 'package:flutter_clean_archticture_myself_2/core/params/user_params.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/user_model.dart';

class RemoteDataSource {
  final ApiConsumer api;

  RemoteDataSource({required this.api});

  Future<UserModel> getUser(UserParams userParams)async{
    final user = await api.get("${ApiEndPoints.users}/${userParams.id}");
    return UserModel.fromjson(user);
  }
}