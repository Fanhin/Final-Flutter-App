import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:trip_buddy/provider/activity.dart';

class AddNewActivity extends StatefulWidget {
  final String id;

  final bool isEditMode;

  AddNewActivity({
    this.id,
    this.isEditMode,
  });

  @override
  _AddNewActivityState createState() => _AddNewActivityState();
}

class _AddNewActivityState extends State<AddNewActivity> {
  Activity activity;
  TimeOfDay _selectedTime;
  DateTime _selectedDate;
  String _inputActivityTitle;
  String _inputDescription;
  final _formKey = GlobalKey<FormState>();

  void _pickUserDueDate() {
    showDatePicker(
            context: context,
            initialDate: widget.isEditMode ? _selectedDate : DateTime.now(),
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
      initialTime: widget.isEditMode ? _selectedTime : TimeOfDay.now(),
    ).then((time) {
      if (time == null) {
        return;
      }
      setState(() {
        _selectedTime = time;
      });
    });
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_selectedDate == null && _selectedTime != null) {
        _selectedDate = DateTime.now();
      }
      if (!widget.isEditMode) {
        Provider.of<ActivityProvider>(context, listen: false).createNewActivity(
          Activity(
            id: DateTime.now().toString(),
            activityTitile: _inputActivityTitle,
            description: _inputDescription,
            dueDate: _selectedDate,
            dueTime: _selectedTime,
          ),
        );
      } else {
        Provider.of<ActivityProvider>(context, listen: false).editActivity(
          Activity(
            id: activity.id,
            activityTitile: _inputActivityTitle,
            description: _inputDescription,
            dueDate: _selectedDate,
            dueTime: _selectedTime,
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    if (widget.isEditMode) {
      activity = Provider.of<ActivityProvider>(context, listen: false)
          .getById(widget.id);
      _selectedDate = activity.dueDate;
      _selectedTime = activity.dueTime;
      _inputActivityTitle = activity.activityTitile;
      _inputDescription = activity.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Container(
                margin: EdgeInsets.only(top: 40),
                child: TextFormField(
                  initialValue:
                      _inputActivityTitle == null ? null : _inputActivityTitle,
                  decoration: InputDecoration(
                    labelText: "Activity title",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _inputActivityTitle = value;
                  },
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextFormField(
                  initialValue:
                      _inputDescription == null ? null : _inputDescription,
                  decoration: InputDecoration(
                    labelText: "Description Activity",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _inputDescription = value;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Text('Due date', style: Theme.of(context).textTheme.subtitle),
              TextFormField(
                onTap: () {
                  _pickUserDueDate();
                },
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Due Date",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(),
                  ),
                  hintText: _selectedDate == null
                      ? 'Provide your due date'
                      : DateFormat.yMMMd().format(_selectedDate).toString(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //Text('Due time', style: Theme.of(context).textTheme.subtitle),
              TextFormField(
                onTap: () {
                  _pickUserDueTime();
                },
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Due time",
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
                  hintText: _selectedTime == null
                      ? 'Provide your due time'
                      : _selectedTime.format(context),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Text(
                    !widget.isEditMode ? 'ADD TASK' : 'EDIT TASK',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _validateForm();
                  },
                ),
              ),
            ],
          )),
    );
  }
}
