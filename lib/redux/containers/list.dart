import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/models/item.dart';
import 'package:flutter_redux_demo/redux/actions.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:flutter_redux_demo/widget/list.dart';
import 'package:redux/redux.dart';

class ListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) {
          return ListWidget(vm.items, vm.markItem);
        });
  }
}

class _ViewModel {
  final List<Item> items;
  final Function(Item, bool) markItem;

  _ViewModel({@required this.items, @required this.markItem});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        items: store.state.items,
        markItem: (Item item, bool read) {
          store.dispatch(MarkItemAction(item, read));
        });
  }
}
