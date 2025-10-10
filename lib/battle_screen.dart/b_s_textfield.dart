import 'package:flutter/material.dart';

class BSTextfield extends StatelessWidget {
  const BSTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: InputDecoration(),
      ),
    );
  }
}
