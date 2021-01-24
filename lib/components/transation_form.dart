import 'package:flutter/material.dart';

class TransationForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransationForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControler,
              // onChanged: (newTitle) => title = newTitle,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Text('Nova Transaçao'),
              color: Colors.purple[400],
              textColor: Colors.white,
              onPressed: () {
                final title = titleControler.text;
                final value = double.tryParse(valueController.text) ?? 0;
                onSubmit(title, value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
