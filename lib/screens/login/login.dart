import 'package:appointment_manager/components/text_field_component.dart';
import 'package:appointment_manager/db/db.dart';
import 'package:appointment_manager/themes/theme_color.dart';
import 'package:appointment_manager/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/background.dart';
import '../../components/button_component.dart';
import '../../utils/routes.dart';
import '../../utils/validations/validations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: ThemeText.header.copyWith(color: ThemeColor.secondary),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFieldComponent(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: Validations.emailValidator,
                controller: emailController,
                placeHolder: 'Email',
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFieldComponent(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                validator: Validations.passwordValidator,
                controller: passwordController,
                hideText: true,
                placeHolder: 'Password',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "Forgot your password?",
                style: ThemeText.placeholder.copyWith(
                    color: ThemeColor.secondary, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ButtonComponent(
                  onTap: () async => await Db.login(
                      email: emailController.text,
                      password: passwordController.text),
                  text: 'LOGIN'),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {Get.toNamed(Routes.registerPage)},
                child: const Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.secondary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
