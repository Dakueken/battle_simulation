import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/providers/character/character_providers.dart';

class CharacterEditorState {
  final int selectedCharacter;
  final List<bool> inParty;

  CharacterEditorState({
    required this.selectedCharacter,
    required this.inParty,
  });

  CharacterEditorState copyWith({int? selectedCharacter, List<bool>? inParty}) {
    return CharacterEditorState(
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
      inParty: inParty ?? List.of(this.inParty),
    );
  }
}

class CharacterEditorNotifier extends Notifier<CharacterEditorState> {
  @override
  CharacterEditorState build() {
    final characters = ref.watch(charactersProvider);
    return CharacterEditorState(
      selectedCharacter: 0,
      inParty: List.generate(characters.length, (_) => false),
    );
  }

  void selectCharacter(int index) {
    state = state.copyWith(selectedCharacter: index);
  }

  void toggleCharacterInParty(int index, BuildContext context) {
    final current = List<bool>.from(state.inParty);
    // Expand the list if necessary
    while (current.length <= index) {
      current.add(false);
    }
    final count = current.where((e) => e).length;

    // If trying to add and already at 4
    if (!current[index] && count >= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Exactly 4 characters must fight in battle. Uncheck another character first.",
          ),
        ),
      );
      return;
    }

    // If trying to remove and only 4 selected
    if (current[index] && count <= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Exactly 4 characters must fight in battle. Select another character first.",
          ),
        ),
      );
      return;
    }

    current[index] = !current[index];
    state = state.copyWith(inParty: current);
  }
}

final characterEditorProvider =
    NotifierProvider<CharacterEditorNotifier, CharacterEditorState>(
      () => CharacterEditorNotifier(),
    );
