import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/data/models/product/product_model.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/provider/login_provider.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/provider/singup_provider.dart';
import 'package:flutter_ecommerce_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_ecommerce_app/presentation/screen/product/product_details_screen.dart';
import 'package:flutter_ecommerce_app/presentation/screen/splash/splash_screen.dart';
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
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => SingUpProvider(context), child: const SignupScreen()));

      case HomeScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case SplashScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case ProductDetailsScreen.routeName:
        return CupertinoPageRoute(
          builder: (context) =>
              ProductDetailsScreen(productModel: settings.arguments as ProductModel),
        );
      default:
        return null;
    }
  }
}
