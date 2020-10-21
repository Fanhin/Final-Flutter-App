import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_buddy/provider/task.dart';

import 'list_item.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    return taskList.length > 0
        ? ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              return ListItem(taskList[index]);
            },
          )
        : LayoutBuilder(builder: (context, constrains) {
            return Center();
          });
  }
}
