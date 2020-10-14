import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:trip_buddy/pages/home_page.dart';
import 'package:trip_buddy/provider/task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Color(0xFFC41A3B),
            primaryColorLight: Color(0xFFFBE0E6),
            accentColor: Color(0xFF1B1F32)),
        home: HomePage(),
      ),
    );
  }
}


