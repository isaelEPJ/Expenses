import 'dart:math';

import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transation_form.dart';
import 'package:expenses/models/transation.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  // TransactionUser({Key key}) : super(key: key);

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

final _transation = [
  Transation(
      id: 't1',
      title: 'Transaçao de teste',
      value: 798.01,
      date: DateTime.now()),
  Transation(
      id: 't2',
      title: 'Transaçao numero dois',
      value: 347.87,
      date: DateTime.now())
];

class _TransactionUserState extends State<TransactionUser> {
  _addTransaction(String title, double value) {
    final newTransaction = Transation(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );
    setState(() {
      _transation.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TransationForm(_addTransaction),
          TransactionList(_transation),
        ],
      ),
    );
  }
}
