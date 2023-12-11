import 'package:flutter/material.dart';

import '../../services/db_helper.dart';
import 'display_update_student_form.dart';

class StudnetInsertScreen extends StatefulWidget {
  const StudnetInsertScreen({super.key});

  @override
  State<StudnetInsertScreen> createState() => _StudnetInsertScreenState();
}

class _StudnetInsertScreenState extends State<StudnetInsertScreen> {
  TextEditingController studentNameController = TextEditingController();
  TextEditingController semesterNameController = TextEditingController();
  TextEditingController projectNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: studentNameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: semesterNameController,
                decoration: const InputDecoration(labelText: 'Semester'),
              ),
              TextField(
                controller: projectNameController,
                decoration: const InputDecoration(labelText: 'Project Name'),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    // Insert student into the database
                    await StudentSqlHelper.insertStudent(
                      studentNameController.text,
                      semesterNameController.text,
                      projectNameController.text,
                    );

                    // Clear the text fields after saving
                    studentNameController.clear();
                    semesterNameController.clear();
                    projectNameController.clear();

                    // Show a Snackbar with a success message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data saved successfully'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } catch (e) {
                    // Show a Snackbar with an error message in case of failure
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to save data'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  'Save Student Data',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const StudentListScreen()),
                  );
                },
                child: const Text(
                  'View Students',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
