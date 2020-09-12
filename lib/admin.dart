import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the Admin Panel "),
      ),
      body: FloatingActionButton(
        onPressed: () {
          getData();
        },
      ),
    );
  }
}

void getData() {
  databaseReference
      .collection("Product File")
      .getDocuments()
      .then((QuerySnapshot snapshot) {
    print("This is :- ${snapshot.documents.length}");
  });
}
