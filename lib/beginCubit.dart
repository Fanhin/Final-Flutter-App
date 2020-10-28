

import 'package:bloc/bloc.dart';
import 'package:provider/provider.dart';
import 'package:trip_buddy/provider/task.dart';


class BeginCubit extends Cubit<int> {
  

  BeginCubit() : super(0);

  
  void increment(int num) => emit( num);

 
}
