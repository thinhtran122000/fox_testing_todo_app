import 'package:bloc/bloc.dart';

part 'favorite_page_event.dart';
part 'favorite_page_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) {});
  }
}
