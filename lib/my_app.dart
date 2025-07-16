import 'package:api1/cubit/category_cubit.dart';
import 'package:api1/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..fetchData(index: 0),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
