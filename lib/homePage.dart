import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Test"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.block),
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) =>
                      Navigator.pushReplacementNamed(context, '/landingpage'))
                  .catchError((e) => print(e.message));
            },
          ),
          IconButton(
            icon: Icon(Icons.verified_user),
            onPressed: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Profile();
                      })))
                  .catchError((e) => print(e.message));
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('userDetails').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  child: ListTile(
                    title: Text(snapshot.data.documents[index]['email']
                        .toString()
                        .trim()),
                    subtitle: Text(snapshot.data.documents[index]['password']
                        .toString()
                        .trim()),
                    onTap: () {},
                  ),
                );
              },
            );
          } else {
            return Container(
              width: double.infinity,
              child: Center(
                child: Expanded(
                  child: Text("No Data Found"),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
