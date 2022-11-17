part of 'home_page_bloc.dart';

abstract class HomePageState {}

class TodoInitial extends HomePageState {}

class TodosLoading extends HomePageState {
  List<Todo> todos = [];
  TodosLoading({required this.todos});
}

class TodosLoaded extends HomePageState {
  final List<Todo> todos;
  TodosLoaded({required this.todos});
}

