import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:trip_buddy/provider/activity.dart';
import 'package:trip_buddy/widgets_activity/item_text.dart';



class ListItem extends StatefulWidget {
  final Activity activity;

  ListItem(this.activity);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Provider.of<ActivityProvider>(context, listen: false)
            .changeStatus(widget.activity.id);
        print('SET STATE ${widget.activity.isDone.toString()}');
      });
    }

    String timeShow(String dueTime) {
      var arr = dueTime.split('(');
      var fin = arr[1].split(')');
      return fin[0];
    }

    return Dismissible(
      key: ValueKey(widget.activity.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        Provider.of<ActivityProvider>(context, listen: false)
            .removeActivity(widget.activity.id);
      },
      background: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'DELETE',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontFamily: 'Lato',
                fontSize: 16,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
              size: 28,
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: _checkItem,
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 140, 0),
                width: 4,
                color: Color(0xFFC41A3B),
              ),
              height: 5,
            ),
            Container(
              
              margin: EdgeInsets.only(left: 5, right: 5),
              child: TimelineTile(
                alignment: TimelineAlign.manual,
                indicatorStyle: IndicatorStyle(color: Color(0xFFC41A3B),width: 20),
                lineXY: 0.3,
                beforeLineStyle: const LineStyle(color: Color(0xFFC41A3B)),
                endChild: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0))),
                  child: ItemText(
                    check: widget.activity.isDone,
                    textActivityTitle: widget.activity.activityTitile,
                    textDescription: widget.activity.description,
                    dueDate: widget.activity.dueDate,
                    dueTime: widget.activity.dueTime,
                  ),
                ),
                startChild: Container(
                 
                  decoration: BoxDecoration(
                    
                      color: Colors.amberAccent,
                      borderRadius: new BorderRadius.only(
                        
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                          bottomLeft: const Radius.circular(10.0),
                          bottomRight: const Radius.circular(10.0))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                        child: Text(
                          widget.activity.dueDate.toString().split(" ")[0],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                  
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                          
                            timeShow(widget.activity.dueTime.toString()),
                            style: TextStyle(
                              color: Color(0xFFC41A3B),
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        
                          )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 140, 0),
                width: 4,
                color: Color(0xFFC41A3B),
              ),
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
