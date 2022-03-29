// ignore_for_file: prefer_const_constructors

import 'package:bloc_earthquake_app/bloc/earthquake_bloc.dart';
import 'package:bloc_earthquake_app/data/repository/earthquake_repository.dart';
import 'package:bloc_earthquake_app/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) =>
              EarthquakeBloc(EarthquakeInitial(), EarthquakeRepository()),
          child: HomePage(),
        ));
  }
}
