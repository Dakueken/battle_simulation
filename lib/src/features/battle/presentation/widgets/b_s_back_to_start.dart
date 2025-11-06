import 'package:battle_simulation/src/features/start/presentation/start_screen.dart';
import 'package:flutter/material.dart';

class BSBackToStart extends StatelessWidget {
  const BSBackToStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.75, -1),
      child: SizedBox(
        width: 80,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => StartScreen()),
            );
          },
          child: Text(
            "Abort Battle",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
