import 'package:firebase/View/verify_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendOtp extends StatefulWidget {
  const SendOtp({Key? key}) : super(key: key);

  @override
  State<SendOtp> createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //     child: ElevatedButton(
      //   child: Text('Send'),
      //   onPressed: () async {
      //     await auth.verifyPhoneNumber(
      //       phoneNumber: '+91 75675 31134',
      //
      //
      //
      //       verificationCompleted: (phoneAuthCredential) {
      //         print('verified');
      //       },
      //
      //
      //       verificationFailed: (error) {
      //         print('ERROR');
      //       },
      //
      //
      //       codeSent: (verificationId, forceResendingToken) {
      //         Navigator.push(context,MaterialPageRoute(builder: (context) => VerifyOtp(id:verificationId ),));
      //       },
      //
      //
      //       codeAutoRetrievalTimeout: (verificationId) {
      //         print('TIME OUT');
      //       },
      //     );
      //   },
      // )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(child: const Text('send'),onPressed: ()  async{

             await auth.verifyPhoneNumber(

                phoneNumber: '+91 6353200469',

                  verificationCompleted: (PhoneAuthCredential phoneAuthCredential) { print('verifyed'); },

                  verificationFailed: (error) { print('Error'); },

              codeSent: (verificationId, forceResendingToken) {
                  Get.to(VerifyOtp(id: verificationId,token: forceResendingToken,));


              }, codeAutoRetrievalTimeout: (String verificationId) { print('TIme Out'); },

              );

            },),
          ),
        ],
      ),
    );
  }
}
