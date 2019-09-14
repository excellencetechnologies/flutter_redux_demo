import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/redux/actions.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';
import 'package:flutter_redux_demo/redux/containers/list.dart';
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
            child: AddFormViewModel(),
          ),
          Expanded(
            child: ListContainer(),
          )
        ],
      ),
      floatingActionButton: FetchButton(),
    );
  }
}

class FetchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(converter: (store) {
      return () => store.dispatch(FetchItemAction());
    }, builder: (context, cb) {
      return FloatingActionButton(
        onPressed: () {
          cb();
        },
        child: Icon(Icons.refresh),
      );
    });
  }
}
