import 'package:riverpod/riverpod.dart';
import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/providers/data_providers.dart';

final charactersProvider =
    NotifierProvider<CharactersNotifier, List<Character>>(
      CharactersNotifier.new,
    );

class CharactersNotifier extends Notifier<List<Character>> {
  @override
  List<Character> build() {
    return initialCharacters;
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
      for (final c in state)
        c.copyWith(currentHP: c.maxHP, haste: 1.0, speed: c.speed),
    ];
  }
}
