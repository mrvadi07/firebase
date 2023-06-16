import 'dart:async';
import 'package:firebase/login.dart';
import 'package:firebase/sign_in_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Spalsh extends StatefulWidget {
  const Spalsh({Key? key}) : super(key: key);

  @override
  State<Spalsh> createState() => _SpalshState();
}

class _SpalshState extends State<Spalsh> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 300,
          color: Colors.tealAccent,
          child: Center(
            child: Text(
              "Spalsh",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
