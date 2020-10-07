import 'package:flutter/material.dart';

import 'package:trip_buddy/screens/feature_page.dart';
import 'package:trip_buddy/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Buddy App',
      home: HomePage()
    );
  }
}

