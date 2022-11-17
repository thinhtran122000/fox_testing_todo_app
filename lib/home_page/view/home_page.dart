import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_testing_todo_app/favorite_page/view/favorite_page.dart';
import 'package:fox_testing_todo_app/home_page/bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is TodosLoaded) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.todos[index].title),
                  leading: IconButton(
                    onPressed: () {
                      // debugPrint('${state.todos[index].isFavorite}');
                      if (state.todos[index].isFavorite) {
                        state.todos[index].isFavorite = false;
                        context.read<HomePageBloc>().add(FavoriteTodo(isFavorite: state.todos[index].isFavorite));
                        // Navigator.of(context).pushNamed('/favoritePage',arguments:  state.todos[index].isFavorite);
                      } else {
                        state.todos[index].isFavorite = true;
                        context.read<HomePageBloc>().add(FavoriteTodo(isFavorite: state.todos[index].isFavorite));
                        // Navigator.of(context).pushNamed('/favoritePage',arguments:  state.todos[index].isFavorite);
                      }
                    },
                    icon: state.todos[index].isFavorite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_outline),
                  ),
                ),
              );
            }
            return const Text('Something wrong');
          },
        ),
      ),
    );
  }
}

/*

*/

