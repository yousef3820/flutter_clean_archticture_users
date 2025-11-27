import 'package:dartz/dartz.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/exceptions.dart';
import 'package:flutter_clean_archticture_myself_2/core/errors/failure.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/datasources/remote_data_source.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/models/user_model.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/repos/user_repo.dart';

class UserRepoImpl extends UserRepo {
  final RemoteDataSource dataSource;

  UserRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, UserModel>> getUser({
    required int id,
  }) async {
    try {
      final user = await dataSource.getUser(id);
      return Right(user);
    } on ServerException catch (e) {
      return left(Failure(errorMessage: e.errorModel.errorMessage));
    }
  }
}
