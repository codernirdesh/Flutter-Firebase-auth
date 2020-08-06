import 'package:firebase_test/LoginPage.dart';
import 'package:firebase_test/homePage.dart';
import 'package:firebase_test/signup.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nirdesh",
      color: Colors.red,
      theme: ThemeData(
        focusColor: Colors.red,
        primarySwatch: Colors.red,
        primaryColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingpage': (BuildContext context) => MyApp(),
        '/login': (BuildContext context) => LoginPage(),
        '/signup': (BuildContext context) => SignUp(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}
