import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/routes.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/signin.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SigninScreen.routeName,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
