import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:clientandrews/models/account.dart';

// SingleChildScrollView showResults(BuildContext context, Account model) {
//   return SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         _buildResultsRow('Name', model.accountName),
//         _buildResultsRow('Type', model.accountType),
//         _buildResultsRow('First Name', model.firstName),
//         _buildResultsRow('Last Name', model.lastUpdateTime),
//         _buildResultsRow('Phone', model.phone1),
//         _buildResultsRow('Notes', model.notes, linebreak: true),
//         // _buildResultsRow('Hobbies', model.hobbies, linebreak: true),
//         // _buildResultsRow('ManeColor', model.maneColor),
//         // _buildResultsRow('HasSpots', model.hasSpots),
//         // _buildResultsRow('SpotColor', model.spotColor),
//         // _buildResultsRow('Height', model.height),
//         // _buildResultsRow('Weight', model.weight),
//         _buildResultsRow(
//             'ShowDate', DateFormat.yMd().format(model.lastUpdateTime)),
//       ],
//     ),
//   );
// }

void showResults(BuildContext context, Account model) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Updated Results'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildResultsRow('Name', model.accountName),
              _buildResultsRow('Type', model.accountType),
              _buildResultsRow('First Name', model.firstName),
              _buildResultsRow('Last Name', model.lastUpdateTime),
              _buildResultsRow('Phone', model.phone1),
              _buildResultsRow('Notes', model.notes, linebreak: true),
              // _buildResultsRow('Hobbies', model.hobbies, linebreak: true),
              // _buildResultsRow('ManeColor', model.maneColor),
              // _buildResultsRow('HasSpots', model.hasSpots),
              // _buildResultsRow('SpotColor', model.spotColor),
              // _buildResultsRow('Height', model.height),
              // _buildResultsRow('Weight', model.weight),
              _buildResultsRow(
                  'ShowDate', DateFormat.yMd().format(model.lastUpdateTime)),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildResultsRow(String name, dynamic value, {bool linebreak: false}) {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Text(
              '$name:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          _buildValueInline(value, linebreak),
        ],
      ),
      _buildValueOnOwnRow(value, linebreak),
      Container(height: 12.0),
    ],
  );
}

Widget _buildValueInline(dynamic value, bool linebreak) {
  return (linebreak) ? Container() : Text(value.toString());
}

Widget _buildValueOnOwnRow(dynamic value, bool linebreak) {
  return (linebreak) ? Text(value.toString()) : Container();
}
