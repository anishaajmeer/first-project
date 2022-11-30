// ignore_for_file: duplicate_ignore


import 'package:flutter/material.dart';

import 'homescreen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // ignore: duplicate_ignore, duplicate_ignore, duplicate_ignore
  @override
  // ignore: dead_code, dead_code
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       primarySwatch:Colors.blue
),
// ignore: prefer_const_constructors
home:HomeScreen());
  }
}
