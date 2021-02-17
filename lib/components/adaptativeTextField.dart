import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class adaptativeTextField extends StatelessWidget {
  final void Function(String) onSubmited;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController isController;

  adaptativeTextField(
      {this.onSubmited,
      this.labelText,
      this.isController,
      this.keyboardType = TextInputType.text,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: isController,
              onSubmitted: onSubmited,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              placeholder: labelText,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: isController,
            decoration: InputDecoration(labelText: labelText),
            onSubmitted: onSubmited,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
          );
  }
}
