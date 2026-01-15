import 'package:battle_simulation/src/features/start/presentation/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/providers/initativelist/turn_manager_provider.dart';

class BSBackToStart extends ConsumerWidget {
  const BSBackToStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: const Alignment(-0.75, -1),
      child: SizedBox(
        width: 80,
        child: ElevatedButton(
          onPressed: () {
            ref.read(turnManagerProvider.notifier).reset();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const StartScreen()),
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
