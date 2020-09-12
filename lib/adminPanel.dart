import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final databaseReference = Firestore.instance;

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  String title, description, price, url, url1, url2, url3, url4, url5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: Icon(Icons.menu),
        title: Text("Admin Panel"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          child: ListView(children: [
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
            ),
            TextField(
              onChanged: (value) {
                description = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Description'),
            ),
            TextField(
              onChanged: (value) {
                price = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Price'),
            ),
            TextField(
              onChanged: (value) {
                url = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image URL'),
            ),
            TextField(
              onChanged: (value) {
                url1 = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image Slider1'),
            ),
            TextField(
              onChanged: (value) {
                url2 = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image Slider2'),
            ),
            TextField(
              onChanged: (value) {
                url3 = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image Slider3'),
            ),
            TextField(
              onChanged: (value) {
                url4 = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image Slider4'),
            ),
            TextField(
              onChanged: (value) {
                url5 = value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Image Slider5'),
            ),
            RaisedButton(
                child: Text('Create Record'),
                onPressed: () {
                  createRecord(title, description, price, url, url1, url2, url3,
                      url4, url5);
                }),
          ]),
        ),
      ),
    );
  }

  void createRecord(String title, description, price, url, url1, url2, url3,
      url4, url5) async {
    await databaseReference.collection("Product File").document("Id").setData({
      'title': 'Mastering Flutter',
      'price': 'Programming Guide for Dart',
      'url':
          'https://ae01.alicdn.com/kf/HTB1XXJnxYGYBuNjy0Foq6AiBFXag/1-PC-ZARSIA-light-Badminton-racket-candy-color-Badminton-Racket-quality-carbon-racket-30LBS.jpg',
    });

    DocumentReference ref =
        await databaseReference.collection("Product File").add({
      'url': '$url',
      'url1': '$url1',
      'url2': '$url2',
      'url3': '$url3',
      'url4': '$url4',
      'url5': '$url5',
      'title': '$title',
      'price': '$price',
      'description': '$description',
    });
    print(ref.documentID);
  }
}
