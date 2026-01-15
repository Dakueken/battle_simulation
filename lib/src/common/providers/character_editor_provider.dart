import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/data/mock_data/characters.dart';

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
    final count = current.where((e) => e).length;

    if (!current[index] && count >= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Maximal 4 Charaktere in der Party erlaubt")),
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
