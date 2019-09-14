import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  final List<String> data = ["List Item1", "List Item2", "List Item3", "List Item4"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${data[index]}'),
          );
        });
  }
}
