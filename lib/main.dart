import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/admin.dart';
import 'package:e_commerce/adminPanel.dart';
import 'package:e_commerce/commentFile.dart';
import 'package:e_commerce/slider.dart';
import 'package:e_commerce/charts.dart';
import 'package:e_commerce/delete.dart';
import 'package:e_commerce/details.dart';
import 'package:e_commerce/update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/slider.dart';
import 'package:flutter/services.dart';
import 'package:e_commerce/futureBuilder.dart';

void main() {
  runApp(MyApp());
//  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//    systemNavigationBarColor: Colors.red, // navigation bar color
//    statusBarColor: Colors.white, // status bar color
//  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
      title: 'E-commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Abc(),
    );
  }
}

final databaseReference = Firestore.instance;

Future<List> allData() async {
  Firestore.instance
      .collection('test')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => print(["url"])));
  await Future.delayed(Duration(seconds: 1));
}

///////////////////////////////////////////////////////  T  E  S  T   //////////////////////////////////////////////////////////////

Future<Map> aita() async {
  Map all = Map();
  var x = await Firestore.instance
      .collection('Product File')
      .getDocuments()
      .then((data) => data.documents.forEach((doc) => print(doc.data)));

  return all;
}

Future<int> getData() async {
//  var ant;
//  databaseReference
//      .collection("Product File")
//
//      .then((QuerySnapshot snapshot) {
////    String ant;
//    return snapshot.documents.length;
////    print("First Come :- ${snapshot.documents.length}");
//
////    return ant = (snapshot.documents.length).toString();
//  });
////  print("Scecond Come :- $ant");
////  return ant;

  final documents =
      await Firestore.instance.collection('Product File').getDocuments();
  final userObject = documents.documents.length;
  return userObject;
}

//Future<List> allAll() async {
//  var list;
//  QuerySnapshot querySnapshot =
//      await Firestore.instance.collection("Product File").getDocuments();
//
//
//
//
//
//  print(querySnapshot.);
//  return list;
//}
Future<List> allAll() async {
  var all = [];
  var x = await Firestore.instance
      .collection('Product File')
      .getDocuments()
      .then((data) => data.documents.forEach((doc) => all.add(doc.data)));

  return all;
}

Future<Map> getUrl() async {
  var url = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url.add(doc["url"])));
  await Future.delayed(Duration(seconds: 1));
//  print(url);
  final url2 = url.asMap();
//  print(url2);
  return url2;
}

Future<Map> getPrice() async {
  var price = [];
  Firestore.instance.collection('Product File').snapshots().listen(
      (data) => data.documents.forEach((doc) => price.add(doc["peice"])));
}

Future<Map> getUrl1() async {
  var url1 = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url1.add(doc["url1"])));
}

Future<Map> getUrl2() async {
  var url1 = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url1.add(doc["url2"])));
}

Future<Map> getUrl3() async {
  var url3 = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url3.add(doc["url3"])));
}

Future<Map> getUrl4() async {
  var url4 = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url4.add(doc["url4"])));
}

Future<Map> getUrl5() async {
  var url5 = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url5.add(doc["url5"])));
}

Future<Map> getTitle() async {
  var url = [];
  Firestore.instance
      .collection('Product File')
      .snapshots()
      .listen((data) => data.documents.forEach((doc) => url.add(doc["title"])));
  await Future.delayed(Duration(seconds: 1));
//  print(url);
  final url2 = url.asMap();
//  print(url2);
  return url2;
}

//class Counter {
//  final counter;
//  Counter(this.counter);
//
//  int getCounter() {
//    return counter;
//  }
//}

//int getFinalCounter() {
//  var x =   Counter();
//  int counter = Counter.getCounter();
//}

class Abc extends StatefulWidget {
  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {
  var title = getTitle();

  var k = getData();

  var url = getUrl();

  var arr = ['Anik', 'Asif', 'Akib'];
  String appBarTitle = 'E-COMMERCE';
  String badminton(index, url) {
    return url[index];
  }

  String badminton2(index, title) {
    return title[index];
  }

////////////////////////////////////////    S   .   T   .   A   .   R   .   T    //////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.black87,
        title: Text(
          "$appBarTitle",
          style: TextStyle(letterSpacing: 5),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              }),
          // Using Stack to show add_shopping_cart
//          Stack(
//            children: <Widget>[
//              IconButton(
//                  icon: Icon(Icons.add_shopping_cart),
//                  onPressed: () {
//                    var counter = getCounter();
//                    setState(() {
//                      counter = 0;
//                    });
//                  }),
//              counter != 0
//                  ? Positioned(
//                      right: 13,
//                      top: 9,
//                      child: Container(
//                        padding: EdgeInsets.all(2),
//                        decoration: BoxDecoration(
//                          color: Colors.red,
//                          borderRadius: BorderRadius.circular(8),
//                        ),
//                        constraints: BoxConstraints(
//                          minWidth: 14,
//                          minHeight: 14,
//                        ),
//                        child: Text(
//                          '$counter',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 8,
//                          ),
//                          textAlign: TextAlign.center,
//                        ),
//                      ),
//                    )
//                  : Container()
//            ],
//          ),
        ],
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            ),
            MaterialButton(
              onPressed: () async {
//                print(await aita());

//                var x =  allAll().toString();
//                Future

//                print(x);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Comment()),
                );
              },
              child: ListTile(
                title: Text("All Inboxes"),
                leading: Icon(Icons.message),
              ),
            ),
            Divider(
              height: 0.1,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPanel()),
                );
              },
              child: ListTile(
                title: Text("Admin Panel"),
                leading: Icon(Icons.border_color),
              ),
            ),
            MaterialButton(
              onPressed: () async {
                var k = await getData();

                var url = await getUrl();

                var title = await getTitle();
                print(title);
//                print("Aitai oita haha :- ");
//                print(await getUrl());

                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Charts(k: k, url: url, title: title),
                    ));
              },
              child: ListTile(
                title: Text("Charts"),
                leading: Icon(Icons.insert_chart),
              ),
            ),
            MaterialButton(
                onPressed: () {},
                child: ListTile(
                  title: Text("Payments"),
                  leading: Icon(Icons.payment),
                )),
            MaterialButton(
                onPressed: () {
                  getUrl();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Delete()),
                  );
                },
                child: ListTile(
                  title: Text("DeleteMe"),
                  leading: Icon(Icons.delete_sweep),
                )),
            MaterialButton(
                onPressed: () {
                  getUrl();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Update()),
                  );
                },
                child: ListTile(
                  title: Text("UpdateMe"),
                  leading: Icon(Icons.update),
                )),
          ],
        ),
      ),

      ////////////////////////////////////////    B   .   O   .   D   .   Y    //////////////////////////////////////////////////

      body: Container(
        child: ListView(children: [
          Column(
            children: <Widget>[
              CarouselSlider(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                height: 200.0,
                items: [
//                  url,
//                  url1,
//                  url2,
//                  url3,
//                  url4,
//                  url5,
                  "cov4.jpg",
                  "cov1.jpg",
                  "cov3.jpg",
                  "cov2.jpg",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: MaterialButton(
                          child: Image.asset(
                            "images/$i",
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyStatefulWidget()),
                            );
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),

//          Column(
//            children: <Widget>[
//              GridView.count(
//                // Create a grid with 2 columns. If you change the scrollDirection to
//                // horizontal, this produces 2 rows.
//                crossAxisCount: 2,
//                // Generate 100 widgets that display their index in the List.
//                children: List.generate(100, (index) {
//                  return Center(
//                    child: Text(
//                      'Item $index',
//                      style: Theme.of(context).textTheme.headline,
//                    ),
//                  );
//                }),
//              ),
//            ],
//          ),
          SizedBox(
            height: 20,
          ),
          Image(
            image: AssetImage('images/pix1.jpg'),
//            height: 100,
//            width: 200,
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            color: Colors.white70,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'Best Collection',
                style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 5.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: <Widget>[
              CarouselSlider(
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                height: 300.0,
                items: [
                  "slide_p1.jpg",
                  "slider_p2.jpg",
                  "slider_p3.jpg",
                  "slider_p4.jpg",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: MaterialButton(
                          child: Image.asset(
                            "images/$i",
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyStatefulWidget()),
                            );
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.black,
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'CATEGORY',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5.0,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(0.0),
//                child: Column(
//                  children: <Widget>[
//                    Image(
//                      image: AssetImage('images/Capture.PNG'),
//                      width: 160.0,
//                    ),
//                    Text("Phone Stand"),
//                    Text("৳ 440"),
//                  ],
//                ),
//              ),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/w1.webp'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/w3.webp'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/w4.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            'Watchs',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/w5.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/w1.webp'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/w6.webp'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wb8.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wb2.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wb3.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            'Handbags',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wb1.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wb5.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wb7.webp'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(0.0),
//                child: Column(
//                  children: <Widget>[
//                    Image(
//                      image: AssetImage('images/Capture.PNG'),
//                      width: 160.0,
//                    ),
//                    Text("Phone Stand"),
//                    Text("৳ 440"),
//                  ],
//                ),
//              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/bag1.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/bag2.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/bag3.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            'Money Bag',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/bag97.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/bag99.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/bag98.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mf1.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mf3.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mf6.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            "Men's Wear",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mf20.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mf22.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/mf21.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.all(0.0),
//                child: Column(
//                  children: <Widget>[
//                    Image(
//                      image: AssetImage('images/Capture.PNG'),
//                      width: 160.0,
//                    ),
//                    Text("Phone Stand"),
//                    Text("৳ 440"),
//                  ],
//                ),
//              ),

              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wf1.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wf8.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wf6.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text(
                            "Women's Wear",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wf4.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wf5.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/wf7.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                  color: Colors.white,
                  elevation: 5,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyStatefulWidget()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/je1.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/j2.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/j3.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Text('Jewellery',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/j4.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/j5.jpg'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('images/j6.webp'),
                                height: 40,
                                width: 40,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Bangladesh",
    "Canada",
    "USA",
    "UK",
    "India",
    "China",
    "Sweden",
    "Denmark",
    "Australia",
    "Pakistan",
    "Japan",
  ];
  final recentCities = [
    "Bangladesh",
    "Canada",
    "USA",
    "UK",
    "India",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Colors.amberAccent,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

//
////some category
//
//Row(
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(0.0),
//child: MaterialButton(
//onPressed: () {
//Navigator.push(
//context,
//MaterialPageRoute(builder: (context) => Details()),
//);
//},
//child: Column(
//children: <Widget>[
//Image(
//image: AssetImage('images/Capture2.PNG'),
//width: 140.0,
//),
//Text("Smart Band"),
//Text("৳ 1590"),
//],
//),
//),
//),
//Padding(
//padding: const EdgeInsets.all(0.0),
//child: Column(
//children: <Widget>[
//Image(
//image: AssetImage('images/Capture3.PNG'),
//width: 140.0,
//),
//Text("Small B"),
//Text("৳ 240"),
//],
//),
//),
//],
//),
//Row(
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Column(
//children: <Widget>[
//Image(
//image: AssetImage('images/Capture4.PNG'),
//width: 160.0,
//),
//Text("Earphone"),
//Text("৳ 740"),
//],
//),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Column(
//children: <Widget>[
//Image(
//image: AssetImage('images/Capture5.PNG'),
//width: 160.0,
//),
//Text("Music Box"),
//Text("৳ 5540"),
//],
//),
//),
//],
//),

//build new design
//        shrinkWrap: true,
//        children: <Widget>[
//          Image(
//            image: AssetImage('images/e-com.jpg'),
//          ),
////          GridView.count(
////            // Create a grid with 2 columns. If you change the scrollDirection to
////            // horizontal, this produces 2 rows.
////            crossAxisCount: 2,
////            // Generate 100 widgets that display their index in the List.
////            children: List.generate(100, (index) {
////              return Center(
////                child: Text(
////                  'Item $index',
////                  style: Theme.of(context).textTheme.headline,
////                ),
////              );
////            }),
////          ),
//
//          Text("Anik"),
//        ],
//    ),
//    );
//  }
//}

//      Hear  main    //

//code
//GestureDetector(
//behavior: HitTestBehavior.opaque,
//onPanDown: (detail) {
//print(detail);
//FocusScope.of(context).requestFocus(FocusNode());
//},
//child: ListView(
//shrinkWrap: true,
//children: <Widget>[
//SizedBox(height: 20.0),
//Container(
//height: 60.0,
//color: Colors.blue,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Icon(Icons.hourglass_empty, color: Colors.white, size: 30.0),
//Padding(padding: const EdgeInsets.only(right: 5.0)),
//Text('TOP5',
//style: TextStyle(color: Colors.white, fontSize: 23.0)),
//],
//),
//),
//SizedBox(height: 20.0),
//Container(
//child: ListView.builder(
//shrinkWrap: true,
//itemCount: 5,
//itemBuilder: (context, index) {
//return Column(
//children: <Widget>[
//Container(
//height: 40.0,
//color: Colors.green,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.center,
//children: <Widget>[
//Icon(Icons.format_list_numbered,
//color: Colors.white),
//Padding(padding: const EdgeInsets.only(right: 5.0)),
//Text(arr[index],
//style: TextStyle(
//fontSize: 20.0, color: Colors.white)),
//],
//),
//),
//Container(
//height: 140.0,
//child: ListView.builder(
//shrinkWrap: true,
//scrollDirection: Axis.horizontal,
//itemCount: 10,
//itemBuilder: (context, index) {
//return GestureDetector(
//child: Card(
//elevation: 5.0,
//child: Container(
//height: MediaQuery.of(context).size.width / 3,
//width: MediaQuery.of(context).size.width / 3,
//alignment: Alignment.center,
//child: Text('Item $index'),
//),
//),
//onTap: () {
//print(123);
//},
//);
//},
//),
//),
//SizedBox(height: 20.0),
//],
//);
//},
//),
//),
//],
//),
//),
