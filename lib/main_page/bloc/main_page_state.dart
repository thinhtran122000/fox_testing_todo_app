part of 'main_page_bloc.dart';

abstract class MainPageState {}

class TodoInitial extends MainPageState{

}
class TodosLoading extends MainPageState {
  final List<Todo> todos;
  TodosLoading({this.todos = const []});
}

class TodosLoaded extends MainPageState {
  final List<Todo> todos;
  final List<Todo> favoriteTodos;
  TodosLoaded({required this.todos,required this.favoriteTodos});
}

// class IsFavoriteTodo extends MainPageState{
//   final List<Todo> todos;
//   final List<Todo> favoriteTodos;
//   IsFavoriteTodo({required this.todos, required this.favoriteTodos});
// }


