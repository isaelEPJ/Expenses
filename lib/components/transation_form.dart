import 'package:flutter/material.dart';

class TransationForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransationForm(this.onSubmit);

  @override
  _TransationFormState createState() => _TransationFormState();
}

class _TransationFormState extends State<TransationForm> {
  final titleControler = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final title = titleControler.text;
      final value = double.tryParse(valueController.text) ?? 0;
      if (title.isEmpty || value <= 0) {
        return;
      }

      widget.onSubmit(title, value);
    }

    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControler,
              // onChanged: (newTitle) => title = newTitle,
              decoration: InputDecoration(labelText: 'Título'),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              child: Text('Nova Transaçao'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: _submitForm,
            ),
          ],
        ),
      ),
    );
  }
}
