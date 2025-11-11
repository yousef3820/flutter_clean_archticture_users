import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/exceptions.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/failure.dart';
import 'package:flutter_clean_archticture_myself_2/core/params/user_params.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/datasources/remote_data_source.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/repos/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final RemoteDataSource dataSource;

  UserRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams userParams,
  }) async {
    try {
      final user = await dataSource.getUser(userParams);
      return Right(user);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: e.errorModel.errorMessage));
    }
  }
}
