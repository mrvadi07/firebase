import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DataStorage extends StatefulWidget {
  const DataStorage({Key? key}) : super(key: key);

  @override
  State<DataStorage> createState() => _DataStorageState();
}

class _DataStorageState extends State<DataStorage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference user = FirebaseFirestore.instance
      .collection('users')
      .doc('g0DpItFFWA7yPrT64F9u');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // user.update({
        //   'name': 'abc',
        //   'email':'abc@gmail.com',
        // });

        users.add({
          'name': 'xyz',
          'email': 'xyz@gmail.com',
          'name': 'abc',
          'email': 'abc@gmail.com'
        });

        // user.delete();
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: users.get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  /// all users
                  var data = snapshot.data!.docs[0].data();
                  return Center(child: Text("${data}"));

                  /// only one user
                  // var data = snapshot.data!.data() as Map<String, dynamic>;
                  // return Center(
                  //   child: Text('${data}'),
                  // );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

/*

  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  DocumentReference user = FirebaseFirestore.instance
      .collection('Users')
      .doc('105aV24wBOl0vdeNl2Mx');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // users.add({'name': 'xyz', 'email': 'xyz@gmail.com'});
          // user.update({'name': 'xyz', 'email': 'xyz@gmail.com'});
          user.delete();
        },
      ),
      body: FutureBuilder(
        // future: users.get(), //1,2
        future: user.get(), //3
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // var data = snapshot.data!.docs[0].data(); //1
            // return Center(child: Text('${data}')); //1
            // var data =
            //     snapshot.data!.docs[0].data() as Map<String, dynamic>; //2
            // return Center(child: Text('${data['name']}')); //2
            var data = snapshot.data!.data() as Map<String, dynamic>; //3
            return Center(child: Text('${data['name']}')); //3
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
 */
