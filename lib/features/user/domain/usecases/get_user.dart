import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/failure.dart';
import 'package:flutter_clean_archticture_myself_2/core/params/user_params.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/repos/user_repo.dart';

class GetUser {
  final UserRepo userRepository;

  GetUser({required this.userRepository});

  Future<Either<Failure, UserEntity>> call({required UserParams userParams}) {
    return userRepository.getUser(userParams: userParams);
  }
}
