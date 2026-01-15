import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BSTextFormField extends StatelessWidget {
  final String initialText;
  final Key fieldKey;
  final void Function(double value)? onSavedValue;

  const BSTextFormField({
    super.key,
    required this.initialText,
    required this.fieldKey,
    this.onSavedValue,
  });

  String? _validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Feld darf nicht leer sein';
    }

    final number = double.tryParse(value);
    if (number == null) {
      return 'Nur gültige Zahlen (z.B. 2.0)';
    }

    if (number < 0 || number > 9999) {
      return 'Nur Zahlen von 0 bis 9999';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: TextFormField(
        key: fieldKey,
        initialValue: initialText,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
        ],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: const InputDecoration(isDense: true),
        validator: _validate,
        onSaved: (value) {
          if (value != null && onSavedValue != null) {
            onSavedValue!(double.parse(value));
          }
        },
      ),
    );
  }
}
