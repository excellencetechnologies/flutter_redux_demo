import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_demo/models/item.dart';
import 'package:flutter_redux_demo/redux/actions.dart';
import 'package:flutter_redux_demo/redux/app_state.dart';

class AddFormViewModel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnItemAddedCallback>(converter: (store) {
      return (text) => store.dispatch(AddItemAction(Item(text)));
    }, builder: (BuildContext context, callback) {
      return AddForm(callback);
    });
  }
}

class AddForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  final OnItemAddedCallback callback;

  AddForm(this.callback);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: _controller,
                  decoration: InputDecoration(labelText: 'Enter list item'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                  child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          callback(_controller.text);
                          _formKey.currentState.reset();
                        }
                      },
                      child: Text('Add')))
            ],
          ),
        ) // Build this out in the next steps.
        );
  }
}

typedef OnItemAddedCallback = Function(String text);
