import 'package:flutter/material.dart';

import '../widgets/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: Column(
          children: [
            buildCustomContainer(),
            const SizedBox(
              height: 10,
            ),
            buildCustomContainer(),
            const SizedBox(
              height: 10,
            ),
            buildCustomParametrizedNonNulAble(Colors.green, 'student'),
            const SizedBox(
              height: 10,
            ),
            buildCustomParametrizedNullAble(
                color: Colors.brown, text: 'amreen'),
            const SizedBox(
              height: 10,
            ),
            buildCustomParametrizedNullAble(),
            const SizedBox(
              height: 10,
            ),
            buildCustomParametrizedNullAble(
                color: Colors.brown, text: 'hassan'),
          ],
        ),
      ),
    );
  }
}

// class MyWidget extends StatelessWidget {
//   const MyWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
