import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_testing_todo_app/favorite_page/view/favorite_page.dart';
import 'package:fox_testing_todo_app/home_page/bloc/home_page_bloc.dart';
import 'package:fox_testing_todo_app/home_page/view/home_page.dart';
import 'package:fox_testing_todo_app/new_todo_page/view/new_todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomePageBloc>(
          create: (context) => HomePageBloc()..add(LoadTodos()),
        ),
      ],
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

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int activeIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.lightBlue),
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        currentIndex: activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorite',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const NewTodoPage()),
            ),
          );
        },
      ),
    );
  }
}
