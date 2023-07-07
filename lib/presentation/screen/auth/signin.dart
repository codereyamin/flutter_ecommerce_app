import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/core/ui.dart';

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
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
            PrimaryTextField(
              controller: emailController,
              labelText: "email",
            ),
            const GapWidget(),
            PrimaryTextField(
              controller: passWordController,
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
              text: "Login",
              onPressed: () {},
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
