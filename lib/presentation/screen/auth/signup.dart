import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/presentation/screen/auth/provider/singup_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/ui.dart';
import '../../widgets/gap_widget.dart';
import '../../widgets/link_button.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/primary_text_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String routeName = "singUp";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SingUpProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("Ecommerce App"),
      ),
      body: SafeArea(
        child: Form(
          key: provider.formKey,
          child: ListView(
            padding: const EdgeInsets.all(30),
            children: [
              Text(
                "Created account",
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
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Email is required";
                  }
                  if (!value.trim().contains("@") && !value.trim().contains(".")) {
                    return "Email is not valid";
                  }
                  return null;
                },
              ),
              const GapWidget(),
              PrimaryTextField(
                controller: provider.passWordController,
                labelText: "password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "password is required";
                  }
                  if (value.length <= 5) {
                    return "password most be 6 word";
                  }
                  return null;
                },
              ),
              const GapWidget(),
              PrimaryTextField(
                controller: provider.confirmPassWordController,
                labelText: "confirm password",
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "confirm your password";
                  }
                  if (value.length <= 5) {
                    return "confirm password most be 6 word";
                  }
                  if (value.trim() != provider.passWordController.text.trim()) {
                    return "password do not match!";
                  }
                  return null;
                },
              ),
              const GapWidget(),
              PrimaryButton(
                text: (provider.isLoading) ? "...." : "crated account",
                onPressed: provider.singUp,
              ),
              const GapWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have a account?"),
                  LinkButton(
                    text: " Sign in",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
