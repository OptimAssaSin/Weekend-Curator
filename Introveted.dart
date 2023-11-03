import 'package:flutter/material.dart';
import 'package:practice/checkboxState.dart';
import 'package:practice/suggestion_2.dart';


class Question_2 extends StatefulWidget {
  const Question_2({super.key});

  @override
  State<Question_2> createState() => _Question_2State();
}

class _Question_2State extends State<Question_2> {
  bool value = false;
  final Extroverted = [
    CheckBoxState(title: 'Watching Netflix'),
    CheckBoxState(title: 'Cooking'),
    CheckBoxState(title: 'Learning Skills'),
    CheckBoxState(title: 'Indoor Games'),
    CheckBoxState(title: 'Discounts'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferances', style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            ...Extroverted.map(buildSingleCheckBox).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Submit'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Suggestion_2()),
          );
        },
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
