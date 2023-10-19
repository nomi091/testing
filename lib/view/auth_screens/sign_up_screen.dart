import 'package:flutter/material.dart';
import 'package:testing/services/app_colors.dart';
import 'package:testing/view/auth_screens/login_screen.dart';
import '../../widgets/custom_auth_widgets.dart';
import '../../widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'SignUp',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              customtext(
                  text: 'Enter User_Name',
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 8,
              ),
              customtextformfeild(
                  controller: userNameTextEditingController,
                  hintText: "Enter User Name"),
              const SizedBox(
                height: 20,
              ),
              customtext(
                  text: 'Enter Email Address',
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              customtextformfeild(
                  controller: emailTextEditingController,
                  hintText: "Enter User Name"),
              const SizedBox(
                height: 20,
              ),
              customtext(
                  text: 'Enter Password',
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              customtextformfeild(
                  controller: passwordTextEditingController,
                  hintText: "Enter Password"),
              const SizedBox(
                height: 20,
              ),
              customtext(
                  text: 'Enter confirm password',
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              customtextformfeild(
                  controller: confirmPasswordTextEditingController,
                  hintText: 'Enter Email'),
              const SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      print('Name is ${userNameTextEditingController.text}');
                      print(
                          'Password is ${passwordTextEditingController.text}');
                      print(
                          'confirm Password is ${confirmPasswordTextEditingController.text}');
                    },
                    child: customtext(
                        text: 'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor)),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 40,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: customtext(
                        text: 'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor)),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
