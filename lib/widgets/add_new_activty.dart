import 'package:flutter/material.dart';
import 'package:trip_buddy/provider/activity.dart';


class AddNewActivity extends StatefulWidget {
  @override
  _AddNewActivityState createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {

  Activity activity;
  TimeOfDay _selectedTime;
  DateTime _selectedDate;
  String _inputDescription;
final _formKey = GlobalKey<FormState>();

void _pickUserDueDate() {
    showDatePicker(
            context: context,
            initialDate:  DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2040))
        .then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() {
        _selectedDate = date;
      });
    });
  }

   void _pickUserDueTime() {
    showTimePicker(
      context: context,
      initialTime:  TimeOfDay.now(),
    ).then((time) {
      if (time == null) {
        return;
      }
      setState(() {
        _selectedTime = time;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }






}