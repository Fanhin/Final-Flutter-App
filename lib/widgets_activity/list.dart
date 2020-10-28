import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_buddy/provider/activity.dart';
import 'package:trip_buddy/widgets_activity/list_item.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activityList = Provider.of<ActivityProvider>(context).itemsList;
    activityList.sort((a, b) => a.dueDate.compareTo(b.dueDate));

    return activityList.length > 0
        ? ListView.builder(
            itemCount: activityList.length,
            itemBuilder: (context, index) {
              return ListItem(activityList[index]);
            },
          )
        : LayoutBuilder(builder: (context, constrains) {
            return Center();
          });
  }
}
