import 'package:todo_app_ui_example/model/todo.dart';

class AppState {
  List<Todo> itemListState = [];
  AppState({this.itemListState});
  AppState copyWith(itemListState) {
    return AppState(itemListState: itemListState ?? this.itemListState);
  }
}
