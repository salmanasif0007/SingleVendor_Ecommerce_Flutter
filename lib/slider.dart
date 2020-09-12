import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/add_to_cart.dart';
import 'package:e_commerce/commentFile.dart';
import 'package:e_commerce/description.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:e_commerce/futureBuilder.dart';

class product extends StatefulWidget {
  final all;
  product(this.all, {Key key}) : super(key: key);

  Map moshaMarsi() {
//    print(all);
    return all;
  }

  @override
  _productState createState() => _productState();
}

class _productState extends State<product> {
//  widget.all;
  int counter = 0;
  double rating = 0;

  @override
  Widget build(BuildContext context) {
//    widget.moshaMarsi();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          actions: <Widget>[
            Stack(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    iconSize: 30,
                    onPressed: () {
//                      print(widget.moshaMarsi()['url2']);

                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cart(widget.moshaMarsi())),
                        );
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
        bottomNavigationBar: new BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Abc()),
                  );
                },
                icon: Icon(Icons.category),
              ),
              IconButton(
                onPressed: () {
//                  Counter(counter);
                  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.add_shopping_cart),
          backgroundColor: Colors.black87,
          onPressed: () {
//                print(projectSnap.data['url1']);
//                print(projectSnap.data['url2']);
//                print(projectSnap.data['url3']);

            setState(() {
              counter++;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: ListView(
          children: [
            Container(
              child: CarouselSlider(
                height: 430.0,
                items: [
//                  url,
//                  url1,
//                  url2,
//                  url3,
//                  url4,
//                  url5,
                  widget.moshaMarsi()['url3'],
                  widget.moshaMarsi()['url2'],
                  widget.moshaMarsi()['url1'],
                  widget.moshaMarsi()['url2']
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Image.network(
                          "$i",
                          height: 300,
                          width: 250,
                        ),
                      );
                    },
                  );
                }).toList(),
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: Duration(seconds: 10),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            Center(
              child: Text(
                'title',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '৳ price',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.0),
                ),
                SmoothStarRating(
                    allowHalfRating: true,
                    onRatingChanged: (rating) {
                      rating = rating;
                      setState(() {});
                    },
                    starCount: 5,
                    rating: rating,
                    size: 18.0,
                    color: Colors.amberAccent,
                    borderColor: Colors.amberAccent,
                    spacing: 0.0)
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 3.0),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.expand_more),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Container(
              child: CarouselSlider(
                height: 100.0,
                items: [
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            SmoothStarRating(
                                allowHalfRating: true,
                                onRatingChanged: (v) {
                                  rating = v;
                                },
                                starCount: 5,
                                rating: rating,
                                size: 18.0,
                                color: Colors.amberAccent,
                                borderColor: Colors.amberAccent,
                                spacing: 0.0),
                            Text(
                              "$i",
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            MaterialButton(
              child: Text('See All'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Comment()),
                );
              },
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 100)),
          ],
        ));
  }
}

//        if (projectSnap.connectionState == ConnectionState.none &&
//            projectSnap.hasData == null) {
//          //print('project snapshot data is: ${projectSnap.data}');
//          return Container();
//        }

//void ratting() {
//  double rating = 5;
//  SmoothStarRating(
//      allowHalfRating: true,
//      onRatingChanged: (v) {
//        rating = v;
//      },
//      starCount: 5,
//      rating: rating,
//      size: 18.0,
//      color: Colors.amberAccent,
//      borderColor: Colors.amberAccent,
//      spacing: 0.0);
//}

//  final url;
//  final url1;
//  final url2;
//  final url3;
//  final url4;
//  final url5;
//  final price;
//  final title;
//
//  ProductInfo{Key key, this.price, this.url,this.url1,this.url2,this.url3,this.url4,this.url5, this.title}) : super(key: key);
