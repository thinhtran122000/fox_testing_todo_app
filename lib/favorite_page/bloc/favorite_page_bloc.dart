import 'package:bloc/bloc.dart';
import 'package:fox_testing_todo_app/models/todo_model.dart';

part 'favorite_page_event.dart';
part 'favorite_page_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<LoadFavoriteTodo>((event, emit) {});
  
  }
}
