import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';

final monstersProvider = NotifierProvider<MonstersNotifier, List<Monster>>(
  MonstersNotifier.new,
);

class MonstersNotifier extends Notifier<List<Monster>> {
  @override
  List<Monster> build() {
    // Genau wie bei Characters: initiale Kopie der Mockdaten
    return [
      for (final m in monsters) m.copyWith(), // defensive copy
    ];
  }

  void updateMonster(int index, Monster updated) {
    state = [
      for (int i = 0; i < state.length; i++) i == index ? updated : state[i],
    ];
  }

  void setHP(int index, int hp) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(currentHP: hp));
  }

  void setInBattle(int index, bool inBattle) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(inBattle: inBattle));
  }

  void setSpeed(int index, int speed) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(speed: speed));
  }

  void setArmor(int index, int armor) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(armor: armor));
  }

  void setMp(int index, int mp) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(mp: mp));
  }

  void setLuck(int index, int luck) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(luck: luck));
  }

  void setMaxHP(int index, int maxHP) {
    if (index < 0 || index >= state.length) return;
    final mon = state[index];
    updateMonster(index, mon.copyWith(maxHP: maxHP));
  }

  void resetAll() {
    // Genau wie bei Characters: Werte zurücksetzen, aber NICHT Mockdaten neu laden
    state = [
      for (final m in state) m.copyWith(currentHP: m.maxHP, speed: m.speed),
    ];
  }
}
