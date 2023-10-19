import 'package:flutter/material.dart';
import 'package:testing/view/auth_screens/sign_up_screen.dart';
import 'package:testing/widgets/custom_auth_widgets.dart';

import '../../services/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: customtext(
                    text: 'Login Screen',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              customtext(
                  text: 'User Name',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    //labelText: 'Enter Name',
                    hintText: 'Enter Your Name'),
              ),
              const SizedBox(
                height: 20,
              ),
              customtext(
                  text: 'Password',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    //labelText: 'Enter Name',
                    hintText: 'Enter Your Password'),
              ),
              const SizedBox(
                height: 60,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.secondry,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: AppColors.primary, width: 0.6)),
                  child: GestureDetector(
                    onTap: () {
                      print('Name ${nameController.text}');
                      print('password ${passwordController.text}');
                    },
                    child: customtext(
                        text: 'Login',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.secondry,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border:
                            Border.all(color: AppColors.primary, width: 0.6)),
                    child: customtext(
                        text: 'Sign Up',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
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
