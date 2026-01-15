import 'package:battle_simulation/src/common/providers/turn_manager_provider.dart';
import 'package:battle_simulation/src/features/battle/presentation/battle_screen.dart';
import 'package:battle_simulation/src/features/character/presentation/character_screen.dart';
import 'package:battle_simulation/src/features/monster/presentation/monster_screen.dart';
import 'package:battle_simulation/src/features/spells/presentation/spell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/backgrounds/arena_background.jpg",
            fit: BoxFit.cover,
          ),

          Positioned(
            right: 150,
            bottom: 75,
            child: SizedBox(
              height: 250,
              child: Image.asset(
                "lib/assets/monster/green/idle/frame-1.png",
                fit: BoxFit.contain,
              ),
            ),
          ),

          Positioned(
            left: 170,
            bottom: 50,
            child: SizedBox(
              height: 200,
              child: Image.asset(
                "lib/assets/images/wizard.png",
                fit: BoxFit.contain,
              ),
            ),
          ),

          Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(turnManagerProvider.notifier).reset();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const BattleScreen()),
                  );
                },
                child: Text(
                  "Start Battle",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CharacterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Character",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (_) => SpellScreen()));
                    },
                    child: Text(
                      "Edit Spells",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const MonsterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Monster",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
