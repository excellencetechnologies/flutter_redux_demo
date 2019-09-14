import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:flutter_redux_demo/redux/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is AddItemAction) {
    return AppState.fromItems(List.from(state.items)..add(action.item));
  }
  return state;
}
