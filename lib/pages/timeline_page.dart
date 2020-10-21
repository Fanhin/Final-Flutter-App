import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../TimelineCubit.dart';

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
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return TimelineTile(
              alignment: TimelineAlign.manual,
              lineXY: 0.3,
              endChild: Container(
                constraints: const BoxConstraints(minHeight: 120),
                color: Colors.lightGreenAccent,
              ),
              startChild: Container(
                child: BlocBuilder<TimelineCubit, List>(
                  builder: (context, state) {


                    
                    return Text("$state");
                  },
                ),
                color: Colors.amberAccent,
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: () => {
          context.bloc<TimelineCubit>().addTimeline("KU"),
          this.setState(() {})
        },
      ),
    );
  }
}
