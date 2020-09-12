import 'package:flutter/material.dart';
import 'package:carousel_widget/carousel_widget.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeData();

    return Scaffold(
        backgroundColor: Colors.white,
        body: Carousel(
          listViews: [
            Fragment(
              child: getScreen(0),
            ),
            Fragment(
              child: getScreen(1),
            ),
            Fragment(
              child: getScreen(2),
            ),
            Fragment(
              child: getScreen(3),
            )
          ],
        ));
  }

  Widget getScreen(index) {
    return new ListView(
      children: <Widget>[
        new Container(
          height: 250.0,
          margin: const EdgeInsets.fromLTRB(20.0, 90.0, 20.0, 0.0),
          child: Image.asset(
            imagenames.elementAt(index),
          ),
        ),
        new Container(
          height: 45.0,
          margin: const EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 0.0),
          child: Text(
            titles.elementAt(index),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20),
          ),
        ),
        new Container(
          height: 100.0,
          margin: const EdgeInsets.fromLTRB(50.0, 12.0, 50.0, 0.0),
          child: Text(
            description.elementAt(index),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ],
    );
  }

  List<String> titles = List();
  List<String> description = List();
  List<String> imagenames = List();

  void initializeData() {
    titles.add("৳ 1590");
    description.add("Lcago Design");
    imagenames.add("images/Capture55.jpg");

    titles.add("৳ 1590");
    description.add("B63 Nino Design");
    imagenames.add("images/Capture33.jpg");

    titles.add("৳ 1590");
    description.add("Artobaro Design");
    imagenames.add("images/Capture11.jpg");

    titles.add("৳ 1590");
    description.add("Poradobiro Design");
    imagenames.add("images/Capture2.PNG");
  }
}
