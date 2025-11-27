import 'package:flutter_clean_archticture_myself_2/core/network/api_request.dart';
import 'package:flutter_clean_archticture_myself_2/core/network/network_manager.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/user_model.dart';

class RemoteDataSource {
  final NetworkManager api;

  RemoteDataSource({required this.api});

  Future<UserModel> getUser(int id)async{
    final user = await api.pefrom<UserModel>(APIRequest(requestType: RequestType.getUserById , id: id,));
    return user;
  }
}