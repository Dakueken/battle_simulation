import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BSTextFormField extends StatelessWidget {
  final String initialText;

  const BSTextFormField({super.key, required this.initialText});

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Feld darf nicht leer sein';
    }
    final number = int.tryParse(value);
    if (number == null || number < 1 || number > 9999) {
      return 'Nur Zahlen von 1 bis 9999';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: TextFormField(
        initialValue: initialText,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: const InputDecoration(isDense: true),
        validator: _validate,
      ),
    );
  }
}
