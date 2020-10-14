import 'package:flutter/material.dart';
import 'package:trip_buddy/pages/trip.dart';



class HomePage extends StatefulWidget {
  
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  List<Map> tripList = [
    {"tripName": "title1", "date": "01/01/2020"},
    {"tripName": "title2", "date": "02/01/2020"},
    {"tripName": "title3", "date": "03/01/2020"},
    {"tripName": "title4", "date": "04/01/2020"},
    {"tripName": "title5", "date": "05/01/2020"},
  ];

  List lessons;

   @override
  void initState() {
    lessons = getTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ListTile makeListTile(Trip trip) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            trip.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                        value: trip.indicatorValue,
                        valueColor: AlwaysStoppedAnimation(Colors.green)),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(trip.date,
                        style: TextStyle(color: Colors.white))),
              )
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            
          },
        );

    Card makeCard(Trip trip) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(trip),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Buddy"),
      ),
      body: makeBody);
  }

  List getTrips() {
  return [
    Trip(
        title: "Trip title 1",
        date: "01/01/2020",
        indicatorValue: 0.33,
        
    ),
    Trip(
        title: "Trip title 2",
        date: "01/01/2020",
        indicatorValue: 0.33,
       
       ),
    Trip(
        title: "Trip title 3",
        date: "01/01/2020",
        indicatorValue: 0.66,
      
        ),
    Trip(
        title: "Trip title 4",
        date: "01/01/2020",
        indicatorValue: 0.66,
        
       ),
    Trip(
        title: "Trip title 5",
        date: "01/01/2020",
        indicatorValue: 1.0,
     
       ),
    Trip(
        title: "Trip title 6",
        date: "01/01/2020",
        indicatorValue: 1.0,
        
        ),
    Trip(
        title: "Trip title 7",
        date: "01/01/2020",
        indicatorValue: 1.0,
       
       )
  ];
}
}
