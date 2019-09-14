import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:flutter_redux_demo/screen/home.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux_demo/redux/reducer.dart';

void main() => runApp(MyApp());

class LogMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    print("===MIDDLEWARE===");
    print(action);
    next(action); // very important :)
  }
}

final store = Store<AppState>(appReducer,
    initialState: AppState.fromList(List.from(["Item1", "Item2"])),
    middleware: [
      LogMiddleware()
    ]
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      child: MyMaterialApp(),
      store: store,
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}
