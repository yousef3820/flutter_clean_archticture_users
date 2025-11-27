import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/failure.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/user_model.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/repos/user_repo.dart';

class GetUser {
  final UserRepo userRepository;

  GetUser({required this.userRepository});

  Future<Either<Failure, UserModel>> call({required int id}) {
    return userRepository.getUser(id: id);
  }
}
