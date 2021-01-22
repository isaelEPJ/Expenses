import 'package:flutter/material.dart';

class TransationForm extends StatelessWidget {
  Widget build(BuildContext context) {
    final titleControler = TextEditingController();
    final valueCOntroller = TextEditingController();
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
              controller: valueCOntroller,
              // onChanged: (newValue) => value = newValue,
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
