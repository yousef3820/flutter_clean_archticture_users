import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/failure.dart';
import 'package:flutter_clean_archticture_myself_2/core/params/user_params.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure,UserEntity>>getUser({required UserParams userParams});
}