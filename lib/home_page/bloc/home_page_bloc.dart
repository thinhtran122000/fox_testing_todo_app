import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fox_testing_todo_app/models/todo_model.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  int index;
  HomePageBloc({required this.index})
      : super(
          TodosLoaded(
            todos: [
              Todo(id: '1', title: 'Todo 1'),
              Todo(id: '2', title: 'Todo 2'),
              Todo(id: '3', title: 'Todo 3'),
              Todo(id: '4', title: 'Todo 4'),
            ],
            isFavorite: false
          ),
        ) {
    on<LoadTodos>(_loadTodo);
    on<FavoriteTodo>(_favoriteTodo);
    on<AddTodo>(_addTodo);
  }

  FutureOr<void> _loadTodo(LoadTodos event, Emitter<HomePageState> emit) {
    var currentState = state;
    if (currentState is TodosLoading) {
      List<Todo> newList = event.todos;
      emit(TodosLoaded(todos: newList,isFavorite: false));
    }
  }

  FutureOr<void> _addTodo(AddTodo event, Emitter<HomePageState> emit) {
    var currentState = state;
    if (currentState is TodosLoaded) {
      List<Todo> newList = List.from(currentState.todos)..add(event.todo);
      emit(TodosLoaded(todos: newList,isFavorite: false));
    }
  }

  FutureOr<void> _favoriteTodo(FavoriteTodo event, Emitter<HomePageState> emit) {
    var currentState = state;
    if (currentState is TodosLoaded) {
     if(currentState.todos[index].isFavorite){
      emit(TodosLoaded(todos: currentState.todos,isFavorite: event.isFavorite));
     }else{
      emit(TodosLoaded(todos: currentState.todos,isFavorite: !event.isFavorite));
     }

    }
  }

  @override
  void onEvent(HomePageEvent event) {
    debugPrint(event.runtimeType.toString());
    super.onEvent(event);
  }

  // @override
  // void onChange(Change<HomePageState> change) {
  //   debugPrint(change.runtimeType.toString());
  //   super.onChange(change);
  // }
}
