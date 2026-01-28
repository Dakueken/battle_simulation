import 'package:battle_simulation/src/common/providers/character/character_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BSBattleCharacter extends ConsumerWidget {
  const BSBattleCharacter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(charactersProvider);
    final fightingCharacters = characters.where((c) => c.inBattle).toList();

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 120,
        color: const Color.fromARGB(100, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: fightingCharacters.map((character) {
            final hpText = "${character.currentHP}/${character.maxHP}";

            return Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(180, 47, 0, 117),
                border: Border.all(
                  width: 5,
                  color: const Color.fromARGB(180, 255, 193, 7),
                ),
              ),
              child: Column(
                spacing: 10,
                children: [
                  SizedBox(
                    height: 48,
                    child: Image.asset(character.image, fit: BoxFit.fill),
                  ),
                  Text(
                    hpText,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
