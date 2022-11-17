part of 'home_page_bloc.dart';

abstract class HomePageEvent {}

class LoadTodos extends HomePageEvent {
  final List<Todo> todos;
  LoadTodos({this.todos = const []});
}

class FavoriteTodo extends HomePageEvent {
   bool isFavorite =false;
  FavoriteTodo({required this.isFavorite});
}

class AddTodo extends HomePageEvent {
  final Todo todo;
  AddTodo({required this.todo});
}
