import 'package:flutter/material.dart';
import 'package:e_commerce/main.dart';

void deleteData(String id) {
  try {
    databaseReference.collection('Product File').document(id).delete();
  } catch (e) {
    print(e.toString());
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget deleteButton = FlatButton(
    child: Text("Delete Again"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Delete()),
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
    content: Text("Your Product Info has been Deleted!"),
    actions: [
      deleteButton,
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
  Widget deleteButton = FlatButton(
    child: Text("Delete Again"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Delete()),
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
      deleteButton,
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

class Delete extends StatelessWidget {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Me'),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                id = value;
              },
              decoration: InputDecoration(
                  labelText: 'Enter the product ID you want to delete'),
            ),
            IconButton(
              icon: Icon(Icons.delete_sweep),
              onPressed: () {
                if (id != null) {
                  deleteData(id);
                  showAlertDialog(context);
                } else {
                  showAlertDialog2(context);
                }
              },
            ),
            Text('Delete Me')
          ],
        ),
      ),
    );
  }
}
