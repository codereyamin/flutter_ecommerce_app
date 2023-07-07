import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../presentation/screen/auth/signin.dart';
import '../presentation/screen/auth/signup.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SigninScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => LoginProvider(context), child: const SigninScreen()));
      case SignupScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SignupScreen());
      default:
        return null;
    }
  }
}
