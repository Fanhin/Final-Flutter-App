import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:trip_buddy/provider/activity.dart';
import 'package:trip_buddy/widgets_activity/list.dart';



class TimelinePage extends StatefulWidget {

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
      body:List() ,
    );
  }
}

