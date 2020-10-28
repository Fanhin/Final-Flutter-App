import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:trip_buddy/beginCubit.dart';
import 'package:trip_buddy/begin_observer.dart';
import 'package:trip_buddy/pages/begin_page.dart';

import 'package:trip_buddy/pages/home_page.dart';
import 'package:trip_buddy/pages/timeline_page.dart';
import 'package:trip_buddy/provider/activity.dart';
import 'package:trip_buddy/provider/task.dart';

import 'package:trip_buddy/widgets/add_new_task.dart';

void main() {
  Bloc.observer = BeginObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ActivityProvider()),
        ChangeNotifierProvider(create: (_) => TaskProvider())
      ],
      child: BlocProvider(
        create: (_)=> BeginCubit(),
              child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              primaryColor: Color(0xFFC41A3B),
              primaryColorLight: Color(0xFFFBE0E6),
              accentColor: Color(0xFF1B1F32)),
          home: BeginPage(),
        ),
      ),
    );

    
  }
}
