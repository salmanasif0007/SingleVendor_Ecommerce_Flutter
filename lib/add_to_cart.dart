import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final all;
  Cart(this.all, {Key key}) : super(key: key);

  Map mMarsi() {
//    print(all);
    return all;
  }

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int items = 1;
  int iii = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Cart"),
      ),
      body: ListView.builder(
        itemCount: items,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.network(
                    widget.mMarsi()['url2'],
                    height: 150,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Title: " + widget.mMarsi()['title']),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(''),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text("Price: " + widget.mMarsi()['price'])
                        ],
                      ),
                      Column(
                        children: <Widget>[],
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_up,
                        ),
                        onPressed: () {
                          setState(() {
                            iii++;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('$iii'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                            ),
                            onPressed: () {
                              setState(() {
                                if (iii > 0) {
                                  iii--;
                                }
                              });
                            },
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[],
                      )
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
