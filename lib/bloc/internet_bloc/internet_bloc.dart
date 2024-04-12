import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_example/bloc/internet_bloc/internet_state.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()) {
    // this will emit the internet lost state
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    // this will emit the internet connected state
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        add(InternetConnectedEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }

// this will close the connectivitySubscription when the bloc is closed to avoid memory leaks
  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
