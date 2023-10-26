import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice/checkboxState.dart';
import 'package:practice/suggestions.dart';

class Question_1 extends StatefulWidget {
  const Question_1({super.key});
  @override
  State<Question_1> createState() => _Question_1State();
}

class _Question_1State extends State<Question_1> {
  bool value = false;
  final Extroverted = [
    CheckBoxState(title: 'Going Out'),
    CheckBoxState(title: 'Restaurnats'),
    CheckBoxState(title: 'Social Gatherings'),
    CheckBoxState(title: 'Shopping'),
    CheckBoxState(title: 'Local Spots'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferances', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          ...Extroverted.map(buildSingleCheckBox).toList(),
        ],
      ),
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.deepOrange,
        value: checkbox.value,
        title: Text(checkbox.title),
        onChanged: (value) => setState(() {
          checkbox.value = value!;
        }),
      );
}

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: const Text('Introveted'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Suggestion(),
            ),
          );
        },
      ),
    );
  }
}
