import 'package:firebase/sign_in_page.dart';
import 'package:firebase/spalsh.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'View/send_otp.dart';
import 'cloud_datastorage.dart';
import 'data storage.dart';
import 'google_SignIn.dart';
import 'logout.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box1 = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirabaseCloud(),
      // box1.read('userid') == null ? Login() : Get_StorangeTask(),
    );
  }
}
