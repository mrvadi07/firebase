import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key, required this.id, this.token}) : super(key: key);
  final String id;
  final token;

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController otp = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  int sec = 15;
  bool isResend = false;

  void Timerdemo() {
    Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
      sec--;

      if (sec == 0) {
        timer.cancel();
        setState(() {});
        sec = 15;
        isResend = true;
      }
    });
  }

  @override
  void initState() {
    Timerdemo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$sec",
              style: const TextStyle(fontSize: 30),
            ),
            isResend
                ? ElevatedButton(
                    onPressed: () async {
                      await auth.verifyPhoneNumber(
                        phoneNumber: '+91 6353200469',
                        verificationCompleted: (phoneAuthCredential) {
                          log('verifyed');
                        },
                        verificationFailed: (error) {
                          log('ERROR');
                        },
                        codeSent: (verificationId, forceResendingToken) {
                          setState(() {});
                          Get.to(VerifyOtp(
                            id: verificationId,
                          ));
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          log('Time out');
                        },
                        forceResendingToken: widget.token,
                      );
                      setState(() {});
                      isResend = false;
                      Timerdemo();
                    },
                    child: const Text("Redend otp"),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: otp,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    smsCode: otp.text, verificationId: widget.id);
                UserCredential userCredential =
                    await auth.signInWithCredential(credential);
                print('${userCredential.user!.phoneNumber}');
                print('${userCredential.user!.uid}');
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
