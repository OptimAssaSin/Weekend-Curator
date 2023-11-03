import 'package:flutter/material.dart';
import 'package:practice/Introveted.dart';
import 'package:practice/Extroverted.dart';
import 'package:practice/main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text(
            "How would you Describe Yourself ?",
            style: TextStyle(fontSize: 20),selectionColor: Colors.black,
          ),
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          verticalDirection: VerticalDirection.up,
          children: [
            ElevatedButton(
              child: const Text('Extroverted'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Question_1(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 1100,
            ),
            ElevatedButton(
              child: const Text('Introverted'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Question_2(),
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }),
      ),
    );
  }
}
