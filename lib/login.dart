import 'package:firebase/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'logout.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final box1 = GetStorage();
  bool loading = false;

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: "Enter Email")),
            SizedBox(
              height: 20,
            ),
            TextField(
                controller: passcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: loading == true
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        try {
                          UserCredential credential =
                              await auth.signInWithEmailAndPassword(
                                  email: emailcontroller.text,
                                  password: passcontroller.text);

                          print('${credential.user!.email}');
                          print('${credential.user!.uid}');

                          await box1.write(
                            'userid',
                            credential.user!.uid,
                          );
                          setState(() {
                            loading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Get_StorangeTask(),
                              ));
                        } on FirebaseAuthException catch (e) {
                          print('${e.code}');
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${e.message}'),
                          ));
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                    ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You dont't have an acoount?",
                ),
                SizedBox(
                  width: 5,
                ),
                InkResponse(
                  onTap: () {
                    Get.to(SignIn());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
