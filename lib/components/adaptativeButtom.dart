import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adaptativeButtom extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  adaptativeButtom({this.label, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : RaisedButton(
            child: Text(label),
            onPressed: onPressed,
            color: Theme.of(context).accentColor,
            textColor: Theme.of(context).primaryColor,
          );
  }
}
