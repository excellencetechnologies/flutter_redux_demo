import 'package:flutter/material.dart';
import 'package:flutter_redux_demo/widget/list.dart';
import 'package:flutter_redux_demo/widget/add.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: AddForm(),
            ),
            Expanded(
              child: ListWidget(),
            )
          ],
        ));
  }
}
