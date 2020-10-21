import 'package:flutter/material.dart';

class Activity {
  final String id;
  String activityTitile;
  DateTime date;
  TimeOfDay time;
  String description;

  Activity(
      {this.id, this.activityTitile, this.date, this.time, this.description});
}

class ActivityProvider with ChangeNotifier {
  final List<Activity> _activityList = [
    Activity(
      id: 'activity#1',
      activityTitile: 'Do homework',
      date: DateTime.now(),
      time: TimeOfDay.now(),
      description: 'assign before 20.00',
    ),
  ];
}
