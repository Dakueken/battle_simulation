import 'package:riverpod/riverpod.dart';

import 'package:battle_simulation/src/common/providers/character_providers.dart';
import 'package:battle_simulation/src/common/providers/monsters_provider.dart';
import 'package:battle_simulation/src/common/providers/data_providers.dart';

import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/models/spell.dart';

final turnOrderProvider = NotifierProvider<TurnOrderNotifier, List<dynamic>>(
  TurnOrderNotifier.new,
);

class TurnOrderNotifier extends Notifier<List<dynamic>> {
  @override
  List<dynamic> build() {
    final characters = ref.read(charactersProvider);
    final monsters = ref.read(monstersProvider);
    final spells = ref.read(spellsProvider);

    return getTurnOrder(characters, monsters, spells, turnsToSimulate: 30);
  }

  void consumeTurn() {
    if (state.isEmpty) return;

    state = [...state.skip(1), state.first];
  }

  void resetOrder(List<dynamic> newOrder) {
    state = newOrder;
  }
}

List<dynamic> getTurnOrder(
  List<Character> allCharacters,
  List<Monster> allMonsters,
  List<Spell> allSpells, {
  int turnsToSimulate = 15,
}) {
  final double defaultSpellDelay = allSpells[0].delay;

  final List<dynamic> battleParticipants = [
    ...allCharacters.where((c) => c.inBattle),
    ...allMonsters.where((m) => m.inBattle),
  ];

  final simulated = battleParticipants
      .map(
        (dynamic c) => {
          'character': c,
          'remainingDelay': (defaultSpellDelay / c.speed / c.haste) * 100,
        },
      )
      .toList();

  final turnOrder = <dynamic>[];

  for (int i = 0; i < turnsToSimulate; i++) {
    simulated.sort(
      (a, b) => (a['remainingDelay'] as double).compareTo(
        b['remainingDelay'] as double,
      ),
    );

    final next = simulated.first;
    turnOrder.add(next['character']);

    final double delta = next['remainingDelay'] as double;

    for (final entry in simulated) {
      entry['remainingDelay'] = (entry['remainingDelay'] as double) - delta;
    }

    final c = next['character'];
    next['remainingDelay'] = (defaultSpellDelay / c.speed / c.haste) * 100;
  }

  return turnOrder;
}
