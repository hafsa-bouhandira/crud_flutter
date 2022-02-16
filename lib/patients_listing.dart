import 'package:flutter/material.dart';
import 'package:frontapp/api.dart';
import 'package:frontapp/no_patients.dart';
import 'package:frontapp/patient.dart';

import 'patient.dart';
import 'no_patients.dart';

class PatientsListing extends StatelessWidget {
  final List? contacts;
  final VoidCallback? onAdd;
  final Function(String id)? onDelete;

  PatientsListing({this.contacts, this.onAdd, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return contacts!.isEmpty
        ? NoPatients(
            onAdd: onAdd,
          )
        : ListView(children: [
            ...contacts!
                .map<Widget>(
                  (patient) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Text("SA"),
                      ),
                      title: Text(
                        patient['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: FlatButton(
                        onPressed: () {
                          onDelete!(patient['_id']);
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
            SizedBox(height: 70),
          ]);
  }
}
