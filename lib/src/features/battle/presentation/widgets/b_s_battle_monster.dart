import 'package:battle_simulation/src/common/providers/monster/monsters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BSBattleMonster extends ConsumerWidget {
  const BSBattleMonster({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monsters = ref.watch(monstersProvider);
    final fightingMonsters = monsters.where((m) => m.inBattle).toList();

    if (fightingMonsters.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: fightingMonsters.map((monster) {
        final hpPercent = monster.currentHP / monster.maxHP;

        return SizedBox(
          height: 350,
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                height: 20,
                child: LinearProgressIndicator(
                  value: hpPercent,
                  backgroundColor: Colors.red,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              SizedBox(
                height: 140,
                width: 200,
                child: Image.asset(monster.image, fit: BoxFit.contain),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
