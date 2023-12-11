import 'package:flutter/material.dart';

import '../../services/db_helper.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  late Future<List<Map<String, dynamic>>> studentList;

  @override
  void initState() {
    super.initState();
    studentList = StudentSqlHelper.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: studentList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var student = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 28.0),
                      child: ListTile(
                        title: Text(student['name']),
                        subtitle: Text(
                            'Semester: ${student['semester']}, Project: ${student['ProName']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                showEditDialog(context, student, index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Implement delete functionality
                                deleteStudent(student['name']);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return const Text('No students found');
          }
        },
      ),
    );
  }

  void deleteStudent(String name) async {
    await StudentSqlHelper.deleteStudent(name);
    setState(() {
      studentList = StudentSqlHelper.getStudents();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Student deleted successfully'),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> showEditDialog(
      BuildContext context, Map<String, dynamic> student, int index) async {
    TextEditingController nameController =
        TextEditingController(text: student['name']);
    TextEditingController semesterController =
        TextEditingController(text: student['semester']);
    TextEditingController projectNameController =
        TextEditingController(text: student['ProName']);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Student'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: 'Name')),
                TextField(
                    controller: semesterController,
                    decoration: const InputDecoration(labelText: 'Semester')),
                TextField(
                    controller: projectNameController,
                    decoration:
                        const InputDecoration(labelText: 'Project Name')),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                await StudentSqlHelper.updateStudent(
                    nameController.text,
                    semesterController.text,
                    projectNameController.text,
                    student['name']);

                setState(() {
                  studentList = StudentSqlHelper.getStudents();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
