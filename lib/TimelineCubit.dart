import 'package:bloc/bloc.dart';
import 'package:trip_buddy/provider/activity.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class TimelineCubit extends Cubit<List<Activity>> {
  TimelineCubit() : super([]);

  void addTimeline(data) => state.add(data);


}

