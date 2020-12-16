import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_market_client/models/models.dart';
import 'package:food_market_client/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> res = await UserService.signIn(email, password);

    if (res.message != null) {
      emit(UserLoadFailed(res.message));
    } else {
      emit(UserLoaded(res.value));
    }
  }
}
