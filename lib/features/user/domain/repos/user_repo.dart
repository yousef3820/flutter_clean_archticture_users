import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/failure.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure,UserModel>>getUser({required int id});
}