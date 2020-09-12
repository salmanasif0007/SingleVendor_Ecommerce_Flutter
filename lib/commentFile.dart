import 'package:e_commerce/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Comment extends StatefulWidget {
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
//  double rating = 3;
  final _formKey = GlobalKey<FormState>();

  final List<String> entries = <String>[
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more ',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
    'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
              onPressed: () {
//                Navigator.pop(
//                  context,
//                  MaterialPageRoute(builder: (context) => product()),
//                );
              },
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        child: Icon(Icons.comment),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  content: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
//                            onChanged: (value) {
//                              id = value;
//                            },
                            decoration: InputDecoration(labelText: 'Comment'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
//                                onChanged: (value) {
//                              id = value;
//                            },
                            decoration: InputDecoration(labelText: ''),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RaisedButton(
                            child: Text("Submit"),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
          child: ListView.separated(
//          Container(
//            child: Column(children: <Widget>[
//              CarouselSlider(
//                height: 100.0,
//                items: [
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                  'This post is for those who still need a filler text but crave something more entertaining, more relevant, or just plain more. Read on for some cool alternatives to Lorem Ipsum.',
//                ].map((i) {
//                  return Builder(
//                    builder: (BuildContext context) {
//                      return Container(
//                        width: MediaQuery.of(context).size.width,
//                        margin: EdgeInsets.symmetric(horizontal: 5.0),
//                        decoration: BoxDecoration(color: Colors.white),
//                        child: Column(
//                          children: [
//                            SmoothStarRating(
//                                allowHalfRating: true,
//                                onRatingChanged: (v) {
//                                  rating = v;
//                                },
//                                starCount: 5,
//                                rating: rating,
//                                size: 18.0,
//                                color: Colors.amberAccent,
//                                borderColor: Colors.amberAccent,
//                                spacing: 0.0),
//                            Text(
//                              "$i",
//                            ),
//                          ],
//                        ),
//                      );
//                    },
//                  );
//                }).toList(),
//              ),
//            ]),
//          ),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
//            height: 70,
            color: Colors.white,
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
    );
  }
}
