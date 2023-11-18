import 'package:flutter/material.dart';

import '../../services/db_helper.dart';

class InsertDoctor extends StatefulWidget {
  const InsertDoctor({super.key});

  @override
  State<InsertDoctor> createState() => _InsertDoctorState();
}

class _InsertDoctorState extends State<InsertDoctor> {
  // DBHandler dbHandler=DBHandler();

  TextEditingController namecont = TextEditingController();
  TextEditingController agecont = TextEditingController();
  TextEditingController speccont = TextEditingController();
  TextEditingController expcont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: namecont,
                style: const TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    labelText: 'Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: speccont,
                style: const TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Specialization',
                    labelText: 'Specialization'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: agecont,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Age',
                    labelText: 'Age'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: expcont,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 25),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Experience',
                    labelText: 'Experience'),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await DoctorSQLHelper.insetData(
                        docName: namecont.text,
                        docExp: int.parse(expcont.text),
                        docAge: int.parse(agecont.text),
                        docSpec: speccont.text);
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
