import 'package:flutter/material.dart';
import 'package:testing/view/sql_front_end_view/display_update_student_form.dart';
import 'package:testing/view/sql_front_end_view/student_form.dart';


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
        home: StudnetInsertScreen(),
    );
  }
}
