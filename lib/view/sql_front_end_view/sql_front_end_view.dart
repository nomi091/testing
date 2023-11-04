import 'package:flutter/material.dart';
import 'package:testing/model/doctor_model.dart';

import '../../model/auth_model.dart';
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
                    // AuthModel auth=AuthModel
                    // (name: "Noman",
                    // password: ""
                    // )  ;

                    Doctor doc = Doctor(
                        name: namecont.text,
                        exp: int.parse(expcont.text),
                        age: int.parse(agecont.text),
                        spec: speccont.text);
                    await SportsSQLHelper.createItem(
                        name: doc.name,
                        exp: doc.exp,
                        age: doc.age,
                        spec: doc.spec);
                    //  int rowid=await  DBHandler.instance.insertDoctor(doc);
                    // if(rowid>0){
                    //   showDialog(context: context,
                    //   builder: (context){
                    //     return const AlertDialog(
                    //       title: Text('Data inserted'),
                    //     );
                    //   });
                    // }
                    // else{
                    //    showDialog(context: context,
                    //   builder: (context){
                    //     return const AlertDialog(
                    //       title: Text('Failued'),
                    //     );
                    //   });
                    // }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
