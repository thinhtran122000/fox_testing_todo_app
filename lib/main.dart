import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_testing_todo_app/favorite_page/view/favorite_page.dart';
import 'package:fox_testing_todo_app/home_page/view/home_page.dart';
import 'package:fox_testing_todo_app/main_page/bloc/main_page_bloc.dart';
import 'package:fox_testing_todo_app/main_page/view/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainPageBloc>(
      create: (context) => MainPageBloc()..add(LoadTodos()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainPage(),
        routes: {
          '/homePage': (context) => const HomePage(),
          '/favoritePage': (context) => const FavoritePage(),
        },
      ),
    );
  }
}
