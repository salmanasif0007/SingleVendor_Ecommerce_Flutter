import 'package:flutter/material.dart';
import 'package:e_commerce/main.dart';

bool updateData(String field, id, sentence) {
  try {
    databaseReference
        .collection('Product File')
        .document('$id')
        .updateData({'$field': '$sentence'});
  } catch (e) {
    print(e.toString());
  }
  if (sentence == null) {
    return false;
  } else {
    return true;
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget updateButton = FlatButton(
    child: Text("Update Again"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Update()),
      );
    },
  );
  Widget okButton = FlatButton(
    child: Text("Home Screen"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Abc()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(""),
    content: Text("Your Product Info has been Updated!"),
    actions: [
      updateButton,
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialog2(BuildContext context) {
  Widget updateButton = FlatButton(
    child: Text("Update Again"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Update()),
      );
    },
  );
  Widget okButton = FlatButton(
    child: Text("Home Screen"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Abc()),
      );
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Input Section is Empty!!"),
    content: Text("Please, fill is all the Required Information"),
    actions: [
      updateButton,
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class Update extends StatelessWidget {
  String field, id, sentence;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Me'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                id = value;
              },
              decoration: InputDecoration(
                  labelText: 'Enter the product ID you want to Update'),
            ),
            TextField(
              onChanged: (value) {
                field = value;
              },
              decoration: InputDecoration(
                  labelText: 'Enter the product Field you want to Update'),
            ),
            TextField(
              onChanged: (value) {
                sentence = value;
              },
              decoration: InputDecoration(
                  labelText: 'Enter the product Value you want to Update'),
            ),
            IconButton(
              icon: Icon(Icons.update),
              onPressed: () {
                if (id != null && field != null) {
                  updateData(field, id, sentence);
                  showAlertDialog(context);
                } else {
                  showAlertDialog2(context);
                }
              },
            ),
            Text('Update Me')
          ],
        ),
      ),
    );
  }
}
