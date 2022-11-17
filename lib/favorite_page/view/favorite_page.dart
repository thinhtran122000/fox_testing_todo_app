import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fox_testing_todo_app/main_page/bloc/main_page_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: Center(
        child: BlocConsumer<MainPageBloc, MainPageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is TodosLoaded) {
              return ListView.builder(
                itemCount: state.favoriteTodos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.favoriteTodos[index].title),
                  leading: IconButton(
                    onPressed: () {
                      context.read<MainPageBloc>().add(NotBecomeFavoriteTodo(
                            todo: state.favoriteTodos[index],
                            todos: state.todos,
                          ));
                    },
                    icon: const Icon(
                      Icons.favorite,
                    ),
                  ),
                ),
              );
            }
            return const Center();
          },
        ),
      ),
    );
  }
}
