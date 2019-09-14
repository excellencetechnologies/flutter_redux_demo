import 'package:flutter_redux_demo/models/item.dart';

class AddItemAction {
  final Item item;
  AddItemAction(this.item);
}

class MarkItemAction {
  final Item item;
  final bool read;
  MarkItemAction(this.item, this.read);
}

class FetchItemAction{
  FetchItemAction();
}