import 'package:flutter/material.dart';
import 'package:frontapp/patient.dart';

import 'api.dart';
import 'no_patients.dart';
import 'patients_listing.dart';
import 'patient.dart';
import 'package:http/http.dart' as http;
// this is the patients screen , it is displayed when patients list is not empty
import 'dart:async';
import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:frontapp/patient.dart';
import 'package:http/http.dart' as http;

class PatientsScreen extends StatefulWidget {
  PatientsScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  // final PatientsApi api = PatientsApi();
  final fetchAlbum api = fetchAlbum();

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  String value = "14758";
  List contacts = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    widget.api.getdata().then((data) {
      setState(() {
        contacts = data;
        loading = false;
      });
    });
  }

  void _addContact() async {
    final createdContact =
        // await widget.api.createAlbum(todoTitle, todoTitle, todoTitle);

        setState(() {
      contacts.add({'name': value});
    });
  }

  void _deleteContact(String id) async {
    await widget.api.deleteAlbum(id);
    setState(() {
      contacts.removeWhere((contact) => contact['_id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: PatientsListing(
        contacts: contacts,
        onAdd: _addContact,
        onDelete: _deleteContact,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: initState,
            tooltip: 'Refresh list',
            backgroundColor: Colors.purple,
            child: Icon(Icons.refresh),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: _addContact,
            tooltip: 'Add new contact',
            child: Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: PatientsListing(
//         contacts: contacts,
//         onAdd: _addContact,
//         onDelete: _deleteContact,
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: initState,
//             tooltip: 'Refresh list',
//             backgroundColor: Colors.purple,
//             child: Icon(Icons.refresh),
//           ),
//           SizedBox(width: 10),
//          FloatingActionButton(
//         onPressed: () {
//           showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8)),
//                   title: Text("Add Patient"),
//                   content: TextField(
//                     onChanged: (String ch) {
//                       value = ch;
//                     },
//                   ),
//                   actions: <Widget>[
//                     FlatButton(
//                         onPressed: () {
//                           _addContact;

//                           Navigator.of(context).pop();
//                         },
//                         child: Text("Add"))
//                   ],
//                 );
//               });
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//         ],
//       ),
//     );
//   }
// }
