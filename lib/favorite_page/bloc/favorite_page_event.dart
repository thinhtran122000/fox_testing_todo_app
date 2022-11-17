part of 'favorite_page_bloc.dart';

abstract class FavoriteEvent {}

class LoadFavoriteTodo extends FavoriteEvent {
  final List<Todo> todos;
  LoadFavoriteTodo({required this.todos});
}

class AddFavoriteTodo extends FavoriteEvent {
  final Todo todo;
  AddFavoriteTodo({required this.todo});
}
