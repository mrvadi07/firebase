import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirabaseCloud extends StatefulWidget {
  const FirabaseCloud({Key? key}) : super(key: key);

  @override
  State<FirabaseCloud> createState() => _FirabaseCloudState();
}

class _FirabaseCloudState extends State<FirabaseCloud> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentReference user = FirebaseFirestore.instance
      .collection('users')
      .doc('NyjkeSVFddSFlhsPTlxz');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // user.update({'name':'abc'});
          user.set({'name': 'deep', 'email': 'acjncjc@example.com'});
          //user.delete();
        },
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: user.get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data!.data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      Text('${data['name']}'),
                      Text('${data['email']}'),
                    ],
                  );
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
