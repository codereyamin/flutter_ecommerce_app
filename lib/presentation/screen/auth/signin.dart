import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/ui.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/provider/login_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/gap_widget.dart';
import '../../widgets/link_button.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_text_field.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static const String routeName = "login";

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Ecommerce App"),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Text(
              "Log In",
              style: CustomTexStyles.heading1,
            ),
            const GapWidget(),
            (provider.error != "")
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      provider.error,
                      style: const TextStyle(color: Colors.red),
                    ),
                  )
                : const SizedBox(),
            PrimaryTextField(
              controller: provider.emailController,
              labelText: "email",
            ),
            const GapWidget(),
            PrimaryTextField(
              controller: provider.passWordController,
              labelText: "password",
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LinkButton(
                  text: "forgot password",
                  onPressed: () {},
                )
              ],
            ),
            const GapWidget(),
            PrimaryButton(
              text: (provider.isLoading) ? "...." : "Login",
              onPressed: provider.login,
            ),
            const GapWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("don't have an account ?"),
                LinkButton(
                  text: " Sign Up",
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
