import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:final_sem_project/image _recognize.dart';

class NextPage extends StatelessWidget {
  CollectionReference users = FirebaseFirestore.instance.collection('medicine');
  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('medicine').snapshots();
  var n;
  String name = '';

  NextPage(String scannedText, {required this.n});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageRecognize()));
              },
            )
          ],
        ),
        body: Column(children: [
          Text(
            'Medicine name:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("${n}"),
          TextField(
            decoration: InputDecoration(hintText: ' '),
            onChanged: (value) {
              n = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Enter doctor name'),
            onChanged: (value) {
              name = value;
            },
          ),
          SizedBox(
            height: 30,
          ),

          ElevatedButton(
              onPressed: () async {
                await users
                    .add({'name': name, 'Prescription': n})
                    .then((value) => print("User Added"))
                    .catchError((error) => print("Failed to add user: $error"));
              },
              child: Text('Submit data')),



          SizedBox(
            height: 30,
          ),
          // Text(
          //     'given'
          // ),







          // Container(
          //     alignment: Alignment.center,
          //     child: StreamBuilder<QuerySnapshot>(
          //         stream: user,
          //         builder: (
          //           BuildContext context,
          //           AsyncSnapshot<QuerySnapshot> snapshot,
          //         ) {
          //           if (snapshot.hasError) {
          //             return Text('Something went wrong');
          //           }
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return Text('Loading');
          //           }
          //           final data = snapshot.requireData;
          //
          //           return ListView.builder(
          //               itemCount: data.size,
          //               itemBuilder: (context, index) {
          //                 return Text(
          //                     "Doctors name is ${data.docs[index]['name']} and given mediines are  ${data.docs[index]['Prescription']} ",
          //                   style: TextStyle(fontSize: 20),
          //                 );
          //               });
          //         })),

          // body: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text('Medicine name: \n${n}'),
          //
          //     ],
          //   ),
          // )
        ]));
  }
}









