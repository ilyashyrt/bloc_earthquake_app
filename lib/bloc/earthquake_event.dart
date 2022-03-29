part of 'earthquake_bloc.dart';

abstract class EarthquakeEvent extends Equatable {
  const EarthquakeEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends EarthquakeEvent{}
