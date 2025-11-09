import 'package:flutter/material.dart';

class BSBackButton extends StatelessWidget {
  const BSBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text("back", style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
