import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransationForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransationForm(this.onSubmit);

  @override
  _TransationFormState createState() => _TransationFormState();
}

class _TransationFormState extends State<TransationForm> {
  final titleControler = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _submitForm() {
      final title = titleControler.text;
      final value = double.tryParse(valueController.text) ?? 0;
      if (title.isEmpty || value <= 0 || _selectedDate == null) {
        return;
      }

      widget.onSubmit(title, value, _selectedDate);
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
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(_selectedDate == null
                      ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}. '),
                  FlatButton(
                    padding: EdgeInsets.fromLTRB(5, 10, 10, 10),
                    textColor: Theme.of(context).primaryColor,
                    color: Colors.white,
                    child: Text(
                      'Selecionar Data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
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
