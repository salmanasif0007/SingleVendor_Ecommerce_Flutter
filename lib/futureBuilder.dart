import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/slider.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;
  Future<List> aita() async {
    var all = [];
    var x = await Firestore.instance
        .collection('Product File')
        .getDocuments()
        .then((QuerySnapshot data) =>
            data.documents.forEach((doc) => all.add(doc.data)));
//    print(all);
    return all;
  }

  Widget projectWidget() {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(
            child: Text("Ami Nai ^._.^"),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black87,
            title: Center(child: Text("Product List")),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      iconSize: 30,
                      onPressed: () {
//                      print(widget.moshaMarsi()['url2']);

                        setState(() {
                          counter = 0;
                        });
                      }),
                  counter != 0
                      ? Positioned(
                          right: 13,
                          top: 9,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              '$counter',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ],
          ),
          body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            childAspectRatio: 0.5,
            crossAxisCount: 2,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(projectSnap.data.length, (index) {
              return Center(
                  child: Column(
                children: [
                  MaterialButton(
                      onPressed: () async {
                        var anik = projectSnap.data[index];
//                        print(anik);

//                        print(projectSnap.data[index]);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => product(anik),
                            ));
                      },
                      child: Image.network(
                        projectSnap.data[index]['url1'],
//                        fit: BoxFit.fitHeight,
                        fit: BoxFit.fill,
                        height: 200,
                        width: 200,
//                        alignment: Alignment.center,
                      )),
                  SizedBox(height: 20),
                  Text(
                    projectSnap.data[index]['title'],
                    textScaleFactor: 1.5,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Price: " + projectSnap.data[index]['price'],
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
//                  Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceAround,
//                      children: [
//                        IconButton(
//                          icon: Icon(Icons.update),
//                          onPressed: () {
////                            Navigator.push(context,
////                                MaterialPageRoute(builder: (context) => Update()));
//                          },
//                        ),
//                        IconButton(
//                          icon: Icon(Icons.delete_sweep),
//                          onPressed: () {
////                            Navigator.push(context,
////                                MaterialPageRoute(builder: (context) => Delete()));
//                          },
//                        ),
//                      ]),
                ],
              )); //Image.network(badminton(index, url))
            }),
          ),
        );
      },
      future: aita(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: projectWidget(),
    );
  }
}
