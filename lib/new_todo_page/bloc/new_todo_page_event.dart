part of 'new_todo_page_bloc.dart';


abstract class NewTodoEvent {}

class AddTodo extends NewTodoEvent{
  final Todo todo;
  AddTodo({required this.todo});
}