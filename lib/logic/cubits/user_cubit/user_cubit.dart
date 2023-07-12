import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/data/models/user/user_model.dart';
import 'package:flutter_ecommerce_app/data/repositories/user/user_repositories.dart';
import 'package:flutter_ecommerce_app/logic/cubits/user_cubit/user_state.dart';
import 'package:flutter_ecommerce_app/logic/services/preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState()) {
    _initialize();
  }
  final UserRepository _userRepository = UserRepository();

  void _initialize() async {
    final user = await Preferences.fetchUserDetails();
    String? email = user["email"];
    String? password = user["password"];
    if (email == null || password == null) {
      emit(UserLoggedOutState());
    } else {
      signIn(email: email, password: password);
    }
  }

  void _emitLoggedInState(
      {required UserModel userModel, required String email, required String password}) async {
    await Preferences.saveUserDetails(email: email, password: password);
    emit(UserLoggedInState(userModel));
  }

  void signIn({required String email, required String password}) async {
    emit(UserLoadingState());
    log("user cubit login function call");
    try {
      UserModel userModel = await _userRepository.singIn(email: email, password: password);
      log("user cubit save data function call");
      _emitLoggedInState(userModel: userModel, email: email, password: password);
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }

  void createAccount({required String email, required String password}) async {
    emit(UserLoadingState());
    try {
      UserModel userModel = await _userRepository.createAccount(email: email, password: password);
      _emitLoggedInState(userModel: userModel, email: email, password: password);
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
