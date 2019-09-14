import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:redux/redux.dart';

class LogMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    print("===MIDDLEWARE===");
    print(action);
    next(action); // very important :)
  }
}
