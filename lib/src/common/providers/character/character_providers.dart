import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/providers/data_providers.dart';
import 'package:battle_simulation/src/common/providers/hive_repository_provider.dart';

final charactersProvider =
    NotifierProvider<CharactersNotifier, List<Character>>(
      CharactersNotifier.new,
    );

class CharactersNotifier extends Notifier<List<Character>> {
  @override
  List<Character> build() {
    return [
      for (final c in initialCharacters)
        c.copyWith(characterSpells: List.of(c.characterSpells)),
    ];
  }

  Future<void> loadFromHive() async {
    final repository = ref.read(hiveRepositoryProvider);
    try {
      final savedCharacters = await repository.loadCharacters();
      if (savedCharacters.isNotEmpty) {
        state = savedCharacters;
        return;
      }
    } catch (e) {
      // If loading fails, keep mock data
    }
  }

  void updateCharacter(int index, Character updated) {
    state = [
      for (int i = 0; i < state.length; i++) i == index ? updated : state[i],
    ];
    _saveToHive();
  }

  void setHP(int index, int hp) {
    if (index < 0 || index >= state.length) return;
    final char = state[index];
    updateCharacter(index, char.copyWith(currentHP: hp));
  }

  void setInBattle(int index, bool inBattle) {
    if (index < 0 || index >= state.length) return;

    final char = state[index];
    updateCharacter(index, char.copyWith(inBattle: inBattle));
  }

  void resetAll() {
    state = [
      for (final c in state)
        c.copyWith(currentHP: c.maxHP, haste: 1.0, speed: c.speed),
    ];
    _saveToHive();
  }

  Future<void> _saveToHive() async {
    final repository = ref.read(hiveRepositoryProvider);
    await repository.saveCharacters(state);
  }
}
