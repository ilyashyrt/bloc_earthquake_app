// ignore_for_file: unused_local_variable, avoid_print

import 'package:bloc/bloc.dart';
import 'package:bloc_earthquake_app/data/models/earthquake_model.dart';
import 'package:bloc_earthquake_app/data/repository/earthquake_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'earthquake_event.dart';
part 'earthquake_state.dart';

class EarthquakeBloc extends Bloc<EarthquakeEvent, EarthquakeState> {
  final EarthquakeRepository? earthquakeRepository;
  EarthquakeBloc(EarthquakeState initialState, this.earthquakeRepository)
      : super(initialState) {
    on<EarthquakeEvent>((event, emit) async {
      if (event is InitialEvent) {
        try {
          Earthquake? earthquakeList;
          emit(EarthquakeLoadingState());
          earthquakeList = await earthquakeRepository?.getDataFromService();
          print(earthquakeList.toString());
          emit(EarthquakeLoadedState(earthquake: earthquakeList));
        } catch (e) {
          emit(EarthquakeErrorState(errorMessage: e.toString()));
        }
      }
    });
  }
}
