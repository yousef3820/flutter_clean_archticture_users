part of 'get_user_cubit.dart';

@immutable
sealed class GetUserState {}

final class GetUserInitial extends GetUserState {}

final class GetUserLoading extends GetUserState {}

final class GetUserSuccess extends GetUserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserFailure extends GetUserState {
  final String errorMessage;
  GetUserFailure({required this.errorMessage});
}
