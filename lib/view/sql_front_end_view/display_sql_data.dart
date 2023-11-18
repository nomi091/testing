import 'package:flutter/material.dart';
import 'package:testing/services/db_helper.dart';

class DisplayDoctors extends StatefulWidget {
  const DisplayDoctors({super.key});

  @override
  State<DisplayDoctors> createState() => _DisplayDoctorsState();
}

class _DisplayDoctorsState extends State<DisplayDoctors> {
  List<dynamic>? doctorData;
  TextEditingController expcont = TextEditingController();
  TextEditingController docName = TextEditingController();

  @override
  void initState() {
    doctorData = DoctorSQLHelper.getItems() as List;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: doctorData!.isNotEmpty
          ? Column(
              children: [
                TextFormField(
                  controller: docName,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 25),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter  Doctor Name for update ',
                      labelText: 'Doctor Name'),
                ),
                TextFormField(
                  controller: expcont,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 25),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Experiance for update',
                      labelText: 'Experience'),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await DoctorSQLHelper.updateDoctor(
                          docName: docName.text,
                          docExp: int.parse(expcont.text));
                    },
                    child: const Text('Update')),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    itemCount: doctorData!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Text('Data from Sql ${doctorData![index]['name']}'),
                          ElevatedButton(
                              onPressed: () async {
                                await DoctorSQLHelper.deleteItem(
                                  docName: docName.text,
                                );
                              },
                              child: const Text('Delete')),
                        ],
                      );
                    }),
              ],
            )
          : const Text('No data into the local db'),
    );
  }
}
