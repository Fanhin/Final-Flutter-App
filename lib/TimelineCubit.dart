import 'package:bloc/bloc.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [int] as its state.
/// {@endtemplate}
class TimelineCubit extends Cubit<List> {
  TimelineCubit() : super(List());

  void addTimeline(data) => state.add(data);


}
