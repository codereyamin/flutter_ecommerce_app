import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/data/models/user/user_model.dart';
import 'package:flutter_ecommerce_app/data/repositories/user/user_repositories.dart';
import 'package:flutter_ecommerce_app/logic/cubits/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  final UserRepository _userRepository = UserRepository();
  void signIn({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel = await _userRepository.singIn(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  void createAccount({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel = await _userRepository.createAccount(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
