import 'package:flutter/material.dart';
import 'package:testing/view/sql_front_end_view/sql_front_end_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
       const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InsertDoctor(),
    );
  }
}
