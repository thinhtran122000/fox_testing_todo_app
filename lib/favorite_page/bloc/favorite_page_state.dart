part of 'favorite_page_bloc.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class LoadingFavoriteTodos extends FavoriteState {
  List<Todo> todos = [];
  LoadingFavoriteTodos({required this.todos});
}

class LoadedFavoriteTodos extends FavoriteState {
  final List<Todo> todos;
  bool isFavorite;
  LoadedFavoriteTodos({required this.todos, required this.isFavorite});
}
