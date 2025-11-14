import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/models/spell.dart';

List<dynamic> getTurnOrder(
  List<Character> allCharacters,
  List<Monster> allMonsters,
  List<Spell> allSpells, {
  int turnsToSimulate = 15,
}) {
  //TODO gute möglichkeit für default Delay überlegen!
  double defaultSpellDelay = allSpells[0].delay;

  List<dynamic> battleParticipants = [
    ...characters.where((c) => c.inBattle),
    ...monsters.where((m) => m.inBattle),
  ];

  final simulated = battleParticipants
      .map(
        (c) => {
          'character': c,
          'remainingDelay': (defaultSpellDelay / c.speed / c.haste) * 100,
        },
      )
      .toList();

  List<dynamic> turnOrder = [];

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
