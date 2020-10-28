import 'package:flutter/material.dart';

class Activity {
  final String id;
  String activityTitile;
  DateTime dueDate;
  TimeOfDay dueTime;
  String description;
  bool isDone;

  Activity({
    @required this.id,
    this.activityTitile,
    this.dueDate,
    this.dueTime,
    this.description,
    this.isDone = false,
  });
}

class ActivityProvider extends ChangeNotifier {
  final List<Activity> _activityList = [
    Activity(
      id: 'actiivty#1',
      activityTitile: "Submitt Flutter Project",
    dueDate: DateTime.now(),
      description: 'รีบทำเร็ว จะไม่เสร็จแล้วส่งหกโมงเย็น',
      dueTime: TimeOfDay.now(),
    ),
    Activity(
      id: 'activity#2',
       activityTitile: "Submitt Flutter Project",
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
      description: 'รีบทำเร็ว จะไม่เสร็จแล้วส่งหกโมงเย็น',
    ),
  ];

  List<Activity> get itemsList {
    return _activityList;
  }

  Activity getById(String id) {
    return _activityList.firstWhere((element) => element.id == id);
  }

  void createNewActivity(Activity activity) {
    final newActivity = Activity(
      id: activity.id,
      activityTitile: activity.activityTitile,
      dueDate: activity.dueDate,
      dueTime: activity.dueTime,
      description: activity.description,
    );
    _activityList.add(newActivity);
    notifyListeners();
  }

  void removeActivity(String id) {
    _activityList.removeWhere((activity) => activity.id == id);
    notifyListeners();
  }

  void editActivity(Activity activity) {
    removeActivity(activity.id);
    createNewActivity(activity);
  }

  void changeStatus(String id) {
    int index = _activityList.indexWhere((activity) => activity.id == id);
    _activityList[index].isDone = !_activityList[index].isDone;
  }
}
