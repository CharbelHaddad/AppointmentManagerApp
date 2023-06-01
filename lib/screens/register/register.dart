import 'package:appointment_manager/components/button_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../components/background.dart';
import '../../components/text_field_component.dart';
import '../../db/db.dart';
import '../../themes/theme_color.dart';
import '../../themes/theme_text.dart';
import '../../utils/routes.dart';
import '../../utils/validations/validations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "REGISTER",
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
                  validator: Validations.defaultValidator,
                  controller: nameController,
                  placeHolder: 'Name',
                ),
              ),
              SizedBox(height: size.height * 0.01),
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
                  controller: passwordController,
                  hideText: true,
                  placeHolder: 'Password',
                  validator: Validations.passwordValidator,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFieldComponent(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  controller: confirmPasswordController,
                  hideText: true,
                  placeHolder: 'Confirm Password',
                  validator: (value) =>
                      MatchValidator(errorText: 'Passwords do not match')
                          .validateMatch(passwordController.text, value ?? '1'),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: IntlPhoneField(
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.disabled,

                  decoration: InputDecoration(
                    hintText: "Phone number ",
                    // fillColor: Theme.of(context).primaryColor.withOpacity(0.05),
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                    ),
                    focusColor: ThemeColor.secondary,
                    iconColor: ThemeColor.secondary,
                    prefixIconColor: ThemeColor.secondary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Color(0xFFDADADA), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: ThemeColor.secondary, width: 1),
                    ),
                  ),
                  initialCountryCode: 'LB', //default contry code,
                  onChanged: (phone) {
                    // only phone number
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ButtonComponent(
                  text: 'REGISTER',
                  onTap: () async => _formKey.currentState!.validate()
                      ? await Db.registerUser(
                          email: emailController.text,
                          name: nameController.text,
                          password: passwordController.text,
                          phone: phoneController.text)
                      : null,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {Get.toNamed(Routes.loginPage)},
                  child: const Text(
                    "Already Have an Account? Sign in",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.secondary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
