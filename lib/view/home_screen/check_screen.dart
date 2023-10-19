import 'package:flutter/material.dart';

class MyContactList extends StatefulWidget {
  const MyContactList({super.key});

  @override
  State<MyContactList> createState() => _MyContactListState();
}

class _MyContactListState extends State<MyContactList> {
  List<bool> chk = [false, false, false, false, false];
  bool istap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone'),
      ),
      body: Center(
        child: Column(
          children: const [
            // InkWell(
            //   onTap: () {
            //     // tap=true
            //     setState(() {
            //       istap = !istap;
            //     });
            //     print('Tap Value $istap');
            //   },
            //   child: Container(
            //     color: istap ? Colors.red : Colors.green,
            //     height: 150,
            //     width: 150,
            //     alignment: Alignment.center,
            //     child: Text(
            //       '$istap',
            //       style: const TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   color: istap ? Colors.green : Colors.red,
            //   height: 150,
            //   width: 150,
            // ),
            // ListView.builder(
            //     itemCount: chk.length,
            //     shrinkWrap: true,
            //     itemBuilder: (context, index) {
            //       return CheckboxListTile(
            //           title: Text('Item ${index + 1}'),
            //           value: chk[index],
            //           onChanged: (value) {
            //             setState(() {
            //               chk[index] = value!;
            //             });
            //           });
            //     })

            // Row(
            //   children: [
            //     GestureDetector(
            //       // onLongPress: () {
            //       //   setState(() {
            //       //     chk[0] = true;
            //       //   });
            //       // },
            //       child: Checkbox(
            //         value: istap,
            //         onChanged: (bool? value) {
            //           // print('Print $value');
            //           setState(() {
            //             istap = value!;
            //           });
            //           //   setState(() {

            //           //  istap= value!;
            //           //   });
            //         },
            //       ),
            //     ),
            //     Text('Label 1 $istap'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: chk[1],
            //       onChanged: (bool? value) {
            //         setState(() {
            //           chk[1] = value!;
            //         });
            //       },
            //     ),
            //     const Text('Label 2'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     GestureDetector(
            //       child: Checkbox(
            //         value: chk[2],
            //         onChanged: (bool? value) {
            //           setState(() {
            //             chk[2] = value!;
            //           });
            //         },
            //       ),
            //     ),
            //     const Text('Label 3'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: chk[3],
            //       onChanged: (bool? value) {
            //         setState(() {
            //           chk[3] = value!;
            //         });
            //       },
            //     ),
            //     const Text('Label 4'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: chk[4],
            //       onChanged: (bool? value) {
            //         setState(() {
            //           chk[4] = value!;
            //         });
            //       },
            //     ),
            //     const Text('Label 5'),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
