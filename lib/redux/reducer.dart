import 'package:flutter_redux_demo/models/item.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:flutter_redux_demo/redux/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return AppState.fromItems(List.from(state.items)..add(action.item));
  } else if (action is MarkItemAction) {
    return AppState.fromItems(state.items.map((item) {
      if (item.text == action.item.text) {
        //not a strong way to do this we should ideally have a unique id
        print(action.read);
        item = new Item(item.text, read: action.read);
      }
      return item;
    }).toList());
  }
  return state;
}
