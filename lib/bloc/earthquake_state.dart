// ignore_for_file: prefer_const_constructors_in_immutables

part of 'earthquake_bloc.dart';

abstract class EarthquakeState extends Equatable {
  const EarthquakeState();

  @override
  List<Object> get props => [];
}

class EarthquakeInitial extends EarthquakeState {}

class EarthquakeLoadingState extends EarthquakeState {}

class EarthquakeLoadedState extends EarthquakeState {
  final Earthquake? earthquake;
  EarthquakeLoadedState({required this.earthquake});
}

class EarthquakeErrorState extends EarthquakeState {
  final String errorMessage;

  EarthquakeErrorState({required this.errorMessage});
}
