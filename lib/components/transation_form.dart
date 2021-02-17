import 'package:expenses/components/adaptativeButtom.dart';
import 'package:expenses/components/adaptativeDatePicker.dart';
import 'package:expenses/components/adaptativeTextField.dart';
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
            adaptativeTextField(
              isController: titleControler,
              labelText: 'Titulo',
              onSubmited: (_) => _submitForm(),
              textInputAction: TextInputAction.next,
            ),
            adaptativeTextField(
              isController: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmited: (_) => _submitForm(),
              labelText: 'Valor (R\$)',
              textInputAction: TextInputAction.next,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text(_selectedDate == null
                      ? 'Nenhuma data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}. '),
                  adaptativeDatePicker(
                    selectedDate: _selectedDate,
                    onDateChange: (newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    },
                  ),
                ],
              ),
            ),
            adaptativeButtom(label: 'Nova Transaçao', onPressed: _submitForm),
          ],
        ),
      ),
    );
  }
}
