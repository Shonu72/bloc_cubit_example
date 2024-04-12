import 'package:bloc_example/bloc/cubit/internet_cubit.dart';
// import 'package:bloc_example/bloc/internet_bloc/internet_bloc.dart';
// import 'package:bloc_example/bloc/internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // blockbuilder is used to build the ui based on the state of the bloc and
        //the blocklistener is used to listen to the state of the bloc and perform some actions but
        // blockconsumer is used to do both the things at the same time
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Connected'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 1),
                ),
              );
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Internet Lost'),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 1),
                ),
              );
            }
          },
          builder: (context, state) {
            // for cubit we'll == operator to check the state
            // if (state is InternetConnectedState) { // example of bloc
            if (state == InternetState.Gained) {
              // example of cubit
              return const Text('Internet Connected');
            } else if (state == InternetState.Lost) {
              return const Text('Internet Lost');
            } else {
              return const Text('Loading ...');
            }
          },
        ),
      ),
    );
  }
}
