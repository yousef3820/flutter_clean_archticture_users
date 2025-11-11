import 'package:bloc/bloc.dart';
import 'package:flutter_clean_archticture_myself_2/core/params/user_params.dart';
import 'package:flutter_clean_archticture_myself_2/core/service_locator.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_archticture_myself_2/features/user/domain/usecases/get_user.dart';
import 'package:meta/meta.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  final GetUser getUserUseCase = sl<GetUser>();
  GetUserCubit() : super(GetUserInitial());

  eitherGetUserOrFailure(int id) async {
    emit(GetUserLoading());
    final userOrFailure = await getUserUseCase.call(
      userParams: UserParams(id: id.toString()),
    );
    userOrFailure.fold(
      (failure) => emit(GetUserFailure(errorMessage: failure.errorMessage)),
      (success) => emit(GetUserSuccess(user: success)),
    );
  }
}
