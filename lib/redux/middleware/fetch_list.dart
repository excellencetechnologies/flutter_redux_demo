import 'package:flutter_redux_demo/models/item.dart';
import 'package:flutter_redux_demo/redux/actions.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:flutter_redux_demo/service/fetch_list.dart';
import 'package:redux/redux.dart';

class FetchListMiddleware implements MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is FetchItemAction) {
      () async {
        // store.dispatch(ShowApploading()) we can do something like this as well.
        try {
          Item item = await PostService.fetchRandomPost();
          print("fetched item $item");
          store.dispatch(AddItemAction(item));
        } catch (e) {
          print(e);
          //store.dispatch(.. some exception handling ...)
        }
      }();
    }
    next(action); // very important :)
  }
}
