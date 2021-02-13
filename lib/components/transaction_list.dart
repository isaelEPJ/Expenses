import 'package:flutter/material.dart';
import '../models/transation.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transation> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Nenhuma transaçao encontrada',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: IconButton(
                    onPressed: () => onRemove(tr.id),
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              );
            },
            // children: transactions.map((tr) {
            // }).toList(),
          );
  }
}
