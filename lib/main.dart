import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_app_ui_example/page/home_page.dart';
import 'package:todo_app_ui_example/provider/todos.dart';
import 'package:todo_app_ui_example/redux/reducer.dart';
import 'package:todo_app_ui_example/redux/state.dart';

final store = Store<AppState>(
  reducer,
  initialState: AppState( 
    itemListState: [],
  ),
);
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Todo App';

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primarySwatch: Colors.pink,
            scaffoldBackgroundColor: Color(0xFFf6f5ee),
          ),
          home:StoreConnector<AppState , AppState>(
            converter: (store) => store.state,
            builder: (context, item) => HomePage(),) ,
        ),
      );
}
