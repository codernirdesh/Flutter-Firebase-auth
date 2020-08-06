import 'package:firebase_test/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _email.text,
                                      password: _password.text)
                                  .then((user) {
                                print(user);
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              }).catchError((e) {
                                print(e.message);
                              });
                            },
                            child: Text("Sign In"),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: RaisedButton(
                            color: Colors.redAccent,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUp();
                              }));
                            },
                            child: Text("Create an account"),
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
