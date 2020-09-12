import 'package:e_commerce/admin.dart';
import 'package:e_commerce/delete.dart';
import 'package:e_commerce/update.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

class Charts extends StatelessWidget {
  final k;
  final url;
  final title;

  Charts({Key key, this.k, this.url, this.title}) : super(key: key);

  String badminton(index, url) {
    return url[index];
  }

  String badminton2(index, title) {
    return title[index];
  }

//  List aita() async {
//    var all = [];
//    var x = await Firestore.instance
//        .collection('Product File')
//        .getDocuments()
//        .then((data) => data.documents.forEach((doc) => all.add(doc.data)));
//    return all;
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List"),
      ),
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        childAspectRatio: 0.5,
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(k, (index) {
          return Center(
              child: Column(
            children: [
              Image.network(badminton(index, url)),
              Text(
                badminton2(index, title),
                textScaleFactor: 1.5,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                IconButton(
                  icon: Icon(Icons.update),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Update()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete_sweep),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Delete()));
                  },
                ),
              ]),
            ],
          )); //Image.network(badminton(index, url))
        }),
      ),
    );
  }
}
