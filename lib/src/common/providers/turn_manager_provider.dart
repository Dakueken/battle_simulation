import 'package:riverpod/riverpod.dart';

import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/models/spell.dart';

import 'package:battle_simulation/src/common/providers/character_providers.dart';
import 'package:battle_simulation/src/common/providers/monsters_provider.dart';
import 'package:battle_simulation/src/common/providers/turn_order_provider.dart';
import 'package:battle_simulation/src/common/providers/data_providers.dart';

typedef TurnState = ({
  List<dynamic> turnOrder,
  dynamic currentActor,
  int currentIndex,
  String? lastMessage,
});

final turnManagerProvider = NotifierProvider<TurnManagerNotifier, TurnState>(
  TurnManagerNotifier.new,
);

class TurnManagerNotifier extends Notifier<TurnState> {
  @override
  TurnState build() {
    final order = ref.read(turnOrderProvider);

    return (
      turnOrder: order,
      currentActor: order.isNotEmpty ? order.first : null,
      currentIndex: 0,
      lastMessage: null,
    );
  }

  void nextTurn() {
    ref.read(turnOrderProvider.notifier).consumeTurn();
    final newOrder = ref.read(turnOrderProvider);

    state = (
      turnOrder: newOrder,
      currentActor: newOrder.first,
      currentIndex: 0,
      lastMessage: null,
    );

    if (newOrder.first is Monster) {
      _handleMonsterTurn(newOrder.first as Monster);
    }
  }

  void _handleMonsterTurn(Monster monster) async {
    await Future.delayed(const Duration(seconds: 5));
    final characters = ref.read(charactersProvider);

    final target = characters.firstWhere(
      (c) => c.currentHP > 0 && c.inBattle,
      orElse: () => characters.first,
    );

    const dmg = 20;
    final newHp = (target.currentHP - dmg).clamp(0, target.maxHP);
    final idx = characters.indexOf(target);

    ref.read(charactersProvider.notifier).setHP(idx, newHp);

    final msg = "${monster.name} dealt $dmg dmg to ${target.name}";
    ref.read(messagesProvider.notifier).addMessage(msg);

    state = (
      turnOrder: state.turnOrder,
      currentActor: state.currentActor,
      currentIndex: state.currentIndex,
      lastMessage: msg,
    );

    nextTurn();
  }

  void playerAttack(Character attacker, Monster target, Spell spell) {
    final dmg = 100; //spell.dmg.toInt();

    final monsters = ref.read(monstersProvider);
    final idx = monsters.indexOf(target);
    final newHp = (target.currentHP - dmg).clamp(0, target.maxHP);

    ref.read(monstersProvider.notifier).setHP(idx, newHp);

    final msg =
        "${attacker.name} used ${spell.name} on ${target.name} for $dmg dmg";
    ref.read(messagesProvider.notifier).addMessage(msg);

    state = (
      turnOrder: state.turnOrder,
      currentActor: state.currentActor,
      currentIndex: state.currentIndex,
      lastMessage: msg,
    );

    nextTurn();
  }

  void reset() {
    ref.read(charactersProvider.notifier).resetAll();
    ref.read(monstersProvider.notifier).resetAll();

    final characters = ref.read(charactersProvider);
    final monsters = ref.read(monstersProvider);
    final spells = ref.read(spellsProvider);

    final newOrder = getTurnOrder(
      characters,
      monsters,
      spells,
      turnsToSimulate: 30,
    );

    ref.read(turnOrderProvider.notifier).resetOrder(newOrder);

    state = (
      turnOrder: newOrder,
      currentActor: newOrder.first,
      currentIndex: 0,
      lastMessage: null,
    );

    ref.read(messagesProvider.notifier).clear();
  }
}
