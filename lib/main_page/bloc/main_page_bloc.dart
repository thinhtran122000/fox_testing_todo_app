import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fox_testing_todo_app/models/todo_model.dart';
part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  MainPageBloc() : super(TodosLoading(todos: [])) {
    on<LoadTodos>(_loadTodo);
    on<AddTodo>(_addTodo);
    on<BecomeFavoriteTodo>(_becomeFavoriteTodo);
    on<NotBecomeFavoriteTodo>(_notbecomeFavoriteTodo);
  }

  FutureOr<void> _loadTodo(LoadTodos event, Emitter<MainPageState> emit) {
    var currentState = state;
    if (currentState is TodosLoading) {
      List<Todo> newList = event.todos;
      emit(TodosLoaded(todos: newList, favoriteTodos: []));
    }
  }

  FutureOr<void> _addTodo(AddTodo event, Emitter<MainPageState> emit) {
    var currentState = state;
    if (currentState is TodosLoaded) {
      List<Todo> newList = List.from(currentState.todos)..add(event.todo);
      emit(TodosLoaded(todos: newList, favoriteTodos: []));
    }
  }

  @override
  void onEvent(MainPageEvent event) {
    debugPrint(event.runtimeType.toString());
    super.onEvent(event);
  }

  FutureOr<void> _becomeFavoriteTodo(BecomeFavoriteTodo event, Emitter<MainPageState> emit) async {
    var currentState = state;
    if (currentState is TodosLoaded) {
      List<Todo> newTodoList = currentState.todos;
      for (Todo todo in currentState.todos) {
        if (!todo.isFavorite) {
          todo.isFavorite=true;
          List<Todo> newFavoriteTodoList = List.from(currentState.favoriteTodos)..add(todo);
          emit(TodosLoaded(todos: newTodoList, favoriteTodos: newFavoriteTodoList));
        }
        // else {
        //   List<Todo> newTodoList = event.todos;
        //   emit(TodosLoaded(todos: newTodoList, favoriteTodos: ));
        // }
      }
    }
  }

  FutureOr<void> _notbecomeFavoriteTodo(NotBecomeFavoriteTodo event, Emitter<MainPageState> emit) {
    var currentState = state;
    if (currentState is TodosLoaded) {
      for (Todo favoriteTodo in currentState.favoriteTodos) {
        if (favoriteTodo.isFavorite) {
          List<Todo> newTodoList = currentState.todos;
          List<Todo> newFavoriteTodoList = currentState.favoriteTodos..remove(favoriteTodo);
          emit(TodosLoaded(todos: newTodoList, favoriteTodos: newFavoriteTodoList));
        }
        // else {
        //   List<Todo> newTodoList = event.todos;
        //   emit(TodosLoaded(todos: newTodoList, favoriteTodos: []));
        // }
      }
    }
  }
}
