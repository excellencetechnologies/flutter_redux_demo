import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/models/item.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Item>>(
      converter: (store) => store.state.items,
      builder: (BuildContext context, List<Item> list) {
        return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${list[index].text}'),
              );
            });
      },
    );
  }
}
