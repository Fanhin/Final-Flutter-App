import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemText extends StatelessWidget {
  final bool check;
  final String textActivityTitle;
  final String textDescription;
  final DateTime dueDate;
  final TimeOfDay dueTime;

  ItemText({
    this.check,
    this.textActivityTitle,
    this.textDescription,
    this.dueDate,
    this.dueTime,
  });

  Widget _buildDateText(BuildContext context) {
    return Text(
      DateFormat.yMMMd().format(dueDate).toString(),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        color: check ? Colors.grey : Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildTimeText(BuildContext context) {
    return Text(
      dueTime.format(context),
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 14,
        color: check ? Colors.grey : Theme.of(context).primaryColorDark,
      ),
    );
  }

  Widget _buildDateTimeTexts(BuildContext context) {
    if (dueDate != null && dueTime == null) {
      return _buildDateText(context);
    } else if (dueDate != null && dueTime != null) {
      return Row(
        children: <Widget>[
          _buildDateText(context),
          SizedBox(
            width: 20,
          ),
          _buildTimeText(context),
        ],
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return _buildText(context);
  }

 

  Widget _buildText(BuildContext context) {
    
    return Column(
     
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
          child: Row(
            children: <Widget>[
              Container(),
              Container(
                width: 200,
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  
                  textActivityTitle,
                  maxLines: 20,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(25, 5, 5, 10),
          child: Text(
            textDescription,
            maxLines: 15,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
       
      ],
    );
  }
}
