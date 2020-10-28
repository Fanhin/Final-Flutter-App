import 'package:flutter/material.dart';

class Task {
  final String id;
  String description;
  DateTime dueDate;
  TimeOfDay dueTime;
  bool isDone;

  Task({
    @required this.id,
    @required this.description,
    this.dueDate,
    this.dueTime,
    this.isDone = false,
  });
}

class TaskProvider with ChangeNotifier {
  final List<Task> _todoList = [
    Task(
      id: 'task#1',
      description: 'Create my models',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'task#2',
      description: 'Add provider',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
  ];

  List<Task> get itemsList {
    return _todoList;
  }

  Task getById(String id) {
    return _todoList.firstWhere((element) => element.id == id);
  }

  void createNewTask(Task task) {
    final newTask = Task(
      id: task.id,
      description: task.description,
      dueDate: task.dueDate,
      dueTime: task.dueTime,
    );
    _todoList.add(newTask);
    notifyListeners();
  }

  void removeTask(String id) {
    _todoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void editTask(Task task) {
    removeTask(task.id);
    createNewTask(task);
  }

  void changeStatus(String id) {
    int index = _todoList.indexWhere((task) => task.id == id);
    _todoList[index].isDone = !_todoList[index].isDone;
    
  }

  
}
