import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Suggestion_1 extends StatefulWidget {
  @override
  _Suggestion_1State createState() => _Suggestion_1State();
}

class _Suggestion_1State extends State<Suggestion_1> {
  String selectedLink = 'https://www.netflix.com/in/browse/genre/1191605';
  List<Map<String, String>> linkOptions = [
    {'Netflix': 'https://www.netflix.com/in/browse/genre/1191605'},
    {
      'Restaurants':
          'https://www.google.com/search?client=opera-gx&q=famous+restaurants+around+me&sourceid=opera&ie=UTF-8&oe=UTF-8'
    },
    {
      'Spots':
          'https://www.google.com/search?client=opera-gx&q=fmaous+spots+around+me+google&sourceid=opera&ie=UTF-8&oe=UTF-8'
    },
    {'Discounts': 'https://woocommerce.com/products/url-coupons/'},
  ];
  var option;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What would you like to do ?'),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Select a link:'),
            DropdownButton<String>(
              value: selectedLink,
              onChanged: (newValue) {
                setState(() {
                  selectedLink = newValue!;
                });
              },
              items: linkOptions.map((Map<String, String> linkOption) {
                final optionText = linkOption.keys.first;
                option = optionText;
                final optionValue = linkOption.values.first;
                return DropdownMenuItem<String>(
                  value: optionValue,
                  child: Text(optionText),
                );
              }).toList(),
            ),
            Text('Selected Link for  : $option'),
            Link(
              target: LinkTarget.blank,
              uri: Uri.parse(selectedLink),
              builder: (context, followLink) => ElevatedButton(
                child: const Text('Open Selected Link'),
                onPressed: followLink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
