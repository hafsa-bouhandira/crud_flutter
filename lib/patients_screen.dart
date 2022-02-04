import 'package:flutter/material.dart';


import 'api.dart';
import 'no_patients.dart';

// this is the patients screen , it is displayed when patients list is not empty 

class PatientsScreen extends StatefulWidget {
  PatientsScreen({Key? key, required this.title}) : super(key: key);

  final String title;
  final PatientsApi api = PatientsApi();

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  List contacts = [
    {'name': 'fisoooo'}
  ];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    widget.api.getContacts().then((data) {
      setState(() {
        contacts = data;
        loading = false;
      });
    });
  }

  void _addContact() {
    setState(() {
      contacts.add({'name': 'sam smith'});
      contacts.add({'name': 'sam smith'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: contacts.isEmpty
          ? NoPatients()
          : ListView(
              children: contacts
                  .map<Widget>(
                    (contact) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Text("SA"),
                        ),
                        title: Text(
                          contact['name'],
                          style: TextStyle(fontSize: 20),
                        ),
                        trailing: FlatButton(
                          onPressed: () {
                            // onDelete(contact.id);
                          },
                          child: Icon(
                            Icons.delete,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // _loadContacts(true);
            },
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
