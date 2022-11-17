import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_testing_todo_app/main_page/bloc/main_page_bloc.dart';

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
        child: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is TodosLoading) {
              return const CircularProgressIndicator();
            }
            if (state is TodosLoaded) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.todos[index].title),
                  leading: IconButton(
                    onPressed: () {
                      context.read<MainPageBloc>().add(BecomeFavoriteTodo(
                            todo: state.todos[index],
                            todos: state.favoriteTodos,
                          ));
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

