import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 360.0,
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.asset('assets/student.jpg',
                            fit: BoxFit.cover)),
                  ),
                  Form(
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _email,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hintText: "Enter email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: _password,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hintText: "Enter password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.yellow,
                            onPressed: () {
                              if (_email.text != null &&
                                  _password.text.length >= 6) {
                                FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: _email.text,
                                        password: _password.text)
                                    .then((user) {
                                  Firestore.instance
                                      .collection('userDetails')
                                      .add({
                                    'email': _email.text,
                                    'password': _password.text
                                  });
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, '/home');
                                }).catchError((e) {
                                  print(e.message);
                                });
                              } else {}
                            },
                            child: Text("Create"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
