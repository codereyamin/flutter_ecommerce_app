import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/core/routes.dart';
import 'package:flutter_ecommerce_app/core/ui.dart';
import 'package:flutter_ecommerce_app/logic/cubits/user_cubit/user_cubit.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/signin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomThemes.defaultTheme,
        initialRoute: SigninScreen.routeName,
        onGenerateRoute: Routes.onGenerateRoute,
      ),
    );
  }
}
