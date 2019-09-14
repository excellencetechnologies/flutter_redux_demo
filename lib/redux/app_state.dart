import 'package:flutter_redux_demo/models/item.dart';

class AppState {
  List<Item> items;

  static var empty = AppState(new List());

  AppState(this.items);
  AppState.fromList(List<String> list) {
    this.items = list.map((f) => new Item(f)).toList();
  }
  AppState.fromItems(this.items);
}
