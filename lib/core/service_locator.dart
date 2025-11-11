import 'package:dio/dio.dart';
import 'package:flutter_clean_archticture_myself_2/core/apis/dio_consumer.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/datasources/remote_data_source.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/data/repos/user_repo_impl.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/usecases/get_user.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void init() {
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: sl<Dio>()));

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(api: sl<DioConsumer>()),
  );

  sl.registerLazySingleton<UserRepoImpl>(() => UserRepoImpl(dataSource: sl<RemoteDataSource>()));

  sl.registerLazySingleton<GetUser>(()=>GetUser(userRepository: sl<UserRepoImpl>()));
}
