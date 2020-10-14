import 'package:flutter/material.dart';

class TimelinePage extends StatefulWidget {
  final String timelineTitle = "TimelinePage";
  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timeline Page"),
      ),
    );
  }
}
