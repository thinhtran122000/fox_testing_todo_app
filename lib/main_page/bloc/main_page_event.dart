part of 'main_page_bloc.dart';

abstract class MainPageEvent {}

class LoadTodos extends MainPageEvent {
  final List<Todo> todos;
  LoadTodos({this.todos = const []});
}

class AddTodo extends MainPageEvent {
  final Todo todo;
  AddTodo({required this.todo});
}

class BecomeFavoriteTodo extends MainPageEvent{
  final Todo todo;
  final List<Todo> todos;
  // final List<Todo> favoriteTodos;
  BecomeFavoriteTodo({required this.todos,required this.todo});
}

class NotBecomeFavoriteTodo extends MainPageEvent{
  final Todo todo;
  final List<Todo> todos;
  NotBecomeFavoriteTodo({required this.todo,required this.todos});
}