import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'login.dart';

class Get_StorangeTask extends StatefulWidget {
  const Get_StorangeTask({Key? key}) : super(key: key);

  @override
  State<Get_StorangeTask> createState() => _Get_StorangeTaskState();
}

class _Get_StorangeTaskState extends State<Get_StorangeTask> {
  final box1 = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To HomeScreen",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await box1.remove("userid");
                Get.to(Login());
              },
              child: Text("logOut"),
            ),
          ],
        ),
      ),
    );
  }
}
