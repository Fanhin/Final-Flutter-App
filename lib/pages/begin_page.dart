import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:trip_buddy/beginCubit.dart';
import 'package:trip_buddy/pages/home_page.dart';
import 'package:trip_buddy/provider/task.dart';

class BeginPage extends StatefulWidget {
  @override
  _BeginPageState createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to MyTrip'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: Text(
                "Hi !! ",
                style: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.red),
              ),
            ),
            Container(
              child: Text(
                "Number of  Todo List!! ",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 10),
              child: BlocBuilder<BeginCubit, int>(
                builder: (context, state) {
                  return Text('$state',style: TextStyle(fontSize: 30),);
                },
              ),
            ),
            Container(
              child: RaisedButton.icon(
                textColor: Colors.white,
                color: Color(0xFFC41A3B),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                icon: Icon(Icons.arrow_forward_ios, size: 20),
                label: Text(
                  "Enter to My Trip",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Container(
              child: RaisedButton.icon(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    context.bloc<BeginCubit>().increment(taskList.length);
                  });
                },
                icon: Icon(Icons.arrow_forward_ios, size: 20),
                label: Text(
                  "Show number of Todo List",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
