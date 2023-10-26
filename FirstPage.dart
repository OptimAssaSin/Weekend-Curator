import 'package:flutter/material.dart';
import 'package:practice/Introveted.dart';
import 'package:practice/Extroverted.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: const Text("How would you Descibe Yourself ?",style: TextStyle(fontSize: 20)),
        ),

        body:Row(

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
                    builder: (context) =>  Question_1(),
                  ),
                );
              },
            ),
            SizedBox(height: 1100,),
            ElevatedButton(
              child: const Text('Introveted'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Question_2(),
                  ),
                );
              },
            ),
          ],
        ),
        drawer: const Drawer(
          child: DrawerHeader(
            child: Icon(Icons.favorite),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.adjust_sharp),
          onPressed: () {
            print("button pressed");
          },
        ),
      ),
    );
  }
}
