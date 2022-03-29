// ignore_for_file: prefer_const_constructors

import 'package:bloc_earthquake_app/bloc/earthquake_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<EarthquakeBloc>(context).add(InitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: BlocBuilder<EarthquakeBloc, EarthquakeState>(
        builder: (context, state) {
          if (state is EarthquakeLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is EarthquakeLoadedState) {
            return ListView.builder(
                itemCount: state.earthquake!.result!.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.red,
                    child: ListTile(
                      leading: Text(
                        (index + 1).toString(),
                        //style: AppTextStyle.sizedText,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            state.earthquake!.result![index].title.toString(),
                            textAlign: TextAlign.center,
                            //style: AppTextStyle.boldAndSizedText,
                          ),
                          Text(
                            state.earthquake!.result![index].date.toString(),
                            //style: AppTextStyle.boldAndSizedText,
                          ),
                        ],
                      ),
                      trailing: Text(
                        '${state.earthquake!.result![index].mag}',
                        //style: AppTextStyle.boldAndSizedText,
                      ),
                    ),
                  );
                });
          } else if (state is EarthquakeErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
