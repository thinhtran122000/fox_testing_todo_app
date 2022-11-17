import 'package:bloc/bloc.dart';
import 'package:fox_testing_todo_app/models/todo_model.dart';

part 'new_todo_page_event.dart';
part 'new_todo_page_state.dart';

class NewTodoBloc extends Bloc<NewTodoEvent, NewTodoState> {
  NewTodoBloc() : super(NewTodoInitial());
}
