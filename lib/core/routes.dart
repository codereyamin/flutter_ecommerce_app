import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../presentation/screen/auth/signin.dart';
import '../presentation/screen/auth/signup.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SigninScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SigninScreen());
      case SignupScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SignupScreen());
      default:
        return null;
    }
  }
}
