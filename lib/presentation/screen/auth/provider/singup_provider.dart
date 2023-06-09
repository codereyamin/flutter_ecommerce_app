import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/logic/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_ecommerce_app/logic/cubits/user_cubit/user_state.dart';

class SingUpProvider with ChangeNotifier {
  final BuildContext context;
  SingUpProvider(this.context) {
    _listenToUserCubit();
  }
  bool isLoading = false;
  String error = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController confirmPassWordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  StreamSubscription? _streamSubscription;

  void _listenToUserCubit() {
    _streamSubscription = BlocProvider.of<UserCubit>(context).stream.listen((userState) {
      if (userState is UserLoadingState) {
        isLoading = true;
        error = "";
        notifyListeners();
      } else if (userState is UserErrorState) {
        isLoading = false;
        error = userState.message;
        notifyListeners();
      } else {
        isLoading = false;
        error = "";
        notifyListeners();
      }
    });
  }

  void singUp() async {
    if (!formKey.currentState!.validate()) return;
    String email = emailController.text.trim();
    String password = passWordController.text.trim();
    BlocProvider.of<UserCubit>(context).createAccount(email: email, password: password);
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
