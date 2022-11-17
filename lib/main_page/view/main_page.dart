import 'package:flutter/material.dart';
import 'package:fox_testing_todo_app/favorite_page/view/favorite_page.dart';
import 'package:fox_testing_todo_app/home_page/view/home_page.dart';
import 'package:fox_testing_todo_app/new_todo_page/view/new_todo_page.dart';

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
