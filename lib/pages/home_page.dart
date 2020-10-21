import 'package:flutter/material.dart';
import 'package:trip_buddy/widgets/add_new_task.dart';
import 'timeline_page.dart';
import 'todolist_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //properties

  int currentTab = 0;
  final List<Widget> screens = [
    TimelinePage(),
    TodolistPage(),
  ];

  //activity page(Tab)

  Widget currentScreen = TimelinePage(); // page first

  final PageStorageBucket bucket = PageStorageBucket();
  TimelinePage title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),

      //fab Btn
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed: () {
          if (currentTab == 0) {
          } else {
            showModalBottomSheet(
              context: context,
              builder: (_) => AddNewTask(isEditMode: false),
            );
          }
        },
      ),

      //fab position
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                child: MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = TimelinePage();
                        currentTab = 0;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.linear_scale,
                          color: currentTab == 0 ? Colors.blue : Colors.grey),
                      Text(
                        "Timeline",
                        style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = TodolistPage();
                        currentTab = 1;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.list,
                          color: currentTab == 1 ? Colors.blue : Colors.grey),
                      Text(
                        "TodoList",
                        style: TextStyle(
                            color: currentTab == 1 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
