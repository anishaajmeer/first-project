import 'dart:async' show Timer;

import 'package:first_project/model/form_builder_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? username;
  String? password;
  String? genderSelected;
  List<String>? info;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      SharedPreferences userPrefs = await SharedPreferences.getInstance();
      info = userPrefs.getStringList('UserInfo');

      if (info == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FormBuilderScreen()),
            (route) => false);
      } else {
        print(info!);
        username = info![0];
        password = info![1];
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      username: username!,
                      password: password!,
                      gender: genderSelected!,
                    )),
            (route) => false);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "HOT SPOT",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ));
  }
}
