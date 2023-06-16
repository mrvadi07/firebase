import 'package:firebase/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'logout.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final box1 = GetStorage();
  bool loading = false;

  // FirebaseAuth auth = FirebaseAuth.instance;
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
            const Text(
              "Sign in",
              style: TextStyle(color: Colors.blue, fontSize: 50),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: const InputDecoration(hintText: "Enter Email")),
            const SizedBox(height: 20),
            TextField(
                keyboardType: TextInputType.number,
                controller: passcontroller,
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                )),
            const SizedBox(height: 20),
            loading
                ? const CircularProgressIndicator()
                : Center(
                    child: ElevatedButton(
                      child: const Text('Sign in'),
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        try {
                          UserCredential credential =
                              await auth.createUserWithEmailAndPassword(
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
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Olredy you have account?",
                ),
                const SizedBox(width: 5),
                InkResponse(
                  onTap: () {
                    Get.to(const Login());
                  },
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
