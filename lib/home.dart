import 'package:flutter/material.dart';
import 'package:flutter_application_4/cubit/fetching_Data_State.dart';
import 'package:flutter_application_4/cubit/fetching_Data_cubit.dart';
import 'package:flutter_application_4/saving_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  Map<String, String> data = {"name": "Youssef", "age": "19"};

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchingDataCubit(),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<FetchingDataCubit, FetchingDataState>(
                builder: (context, state) {
                  switch (state) {
                    case InitState():
                      return ElevatedButton.icon(
                        onPressed: () {
                          context.read<FetchingDataCubit>().toggle(data);
                        },
                        label: Text("Get Data"),
                        icon: Icon(Icons.download),
                      );
                    case DataLoading():
                      return CircularProgressIndicator();
                    case DataSuccess():
                      return Column(
                        children: [
                          Text("name: ${state.data["name"]}"),
                          Text("Age: ${state.data["age"]}"),
                          ElevatedButton.icon(
                            onPressed: () {
                              context.read<FetchingDataCubit>().toggle(data);
                            },
                            label: Text("retry"),
                            icon: Icon(Icons.repeat_rounded),
                          ),
                        ],
                      );
                    case DataError():
                      return Column(
                        children: [
                          FutureBuilder(
                            future: getUserData(),
                            builder: (context, snapShot) {
                              if (snapShot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if (snapShot.hasError) {
                                return Text(state.errorMsg);
                              }
                              if (snapShot.hasData) {
                                return Column(
                                  children: [
                                    Text("name: ${snapShot.data!["name"]}"),
                                    Text("Age: ${snapShot.data!["age"]}"),
                                  ],
                                );
                              }
                              return SizedBox();
                            },
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              context.read<FetchingDataCubit>().toggle(data);
                            },
                            label: Text("retry"),
                            icon: Icon(Icons.repeat_rounded),
                          ),
                        ],
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
