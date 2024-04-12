import 'package:bloc_example/bloc/cubit/internet_cubit.dart';
import 'package:bloc_example/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_example/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internet Connectivity Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        // in case of bloc we'll se the bloc here
        // create: (context) => InternetBloc(),
        create: (context) => InternetCubit(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
