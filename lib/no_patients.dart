import 'package:flutter/material.dart';

// this is the no patients view , we display it when our patients list is empty
class NoPatients extends StatelessWidget {
  //  final VoidCallback onAdd;

  // NoPatients({this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.person_outline,
            size: 80,
            color: Colors.black45,
          ),
          Text(
            'No contacts listed',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          FlatButton(
            color: Colors.purple,
            onPressed: () {},
            child: Text(
              'Add your first',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
