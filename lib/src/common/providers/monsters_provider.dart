import 'package:riverpod/riverpod.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/providers/data_providers.dart';

final monstersProvider = NotifierProvider<MonstersNotifier, List<Monster>>(
  MonstersNotifier.new,
);

class MonstersNotifier extends Notifier<List<Monster>> {
  @override
  List<Monster> build() {
    return initialMonsters;
  }

  void setHP(int index, int hp) {
    state = [
      for (int i = 0; i < state.length; i++)
        i == index ? state[i].copyWith(currentHP: hp) : state[i],
    ];
  }

  void setInBattle(int index, bool inBattle) {
    state = [
      for (int i = 0; i < state.length; i++)
        i == index ? state[i].copyWith(inBattle: inBattle) : state[i],
    ];
  }

  void resetAll() {
    state = [
      for (final m in state)
        m.copyWith(currentHP: m.maxHP, haste: 1.0, speed: m.speed),
    ];
  }
}
