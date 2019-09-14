import 'package:flutter/material.dart';
import 'package:flutter_redux_demo/models/item.dart';

class ListWidget extends StatelessWidget {
  final List<Item> list;
  final Function(Item, bool) doMarkItem;

  ListWidget(this.list, this.doMarkItem);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              print(list[index]);
              doMarkItem(list[index], list[index].read ? false : true);
            },
            title: Text(
              '${list[index].text}',
              style: list[index].read
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : TextStyle(decoration: TextDecoration.none),
            ),
          );
        });
  }
}
