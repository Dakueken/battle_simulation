import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/providers/monster/monsters_provider.dart';

class MonsterEditorState {
  final int selectedMonster;
  final List<bool> inParty;

  MonsterEditorState({required this.selectedMonster, required this.inParty});

  MonsterEditorState copyWith({int? selectedMonster, List<bool>? inParty}) {
    return MonsterEditorState(
      selectedMonster: selectedMonster ?? this.selectedMonster,
      inParty: inParty ?? List.of(this.inParty),
    );
  }
}

class MonsterEditorNotifier extends Notifier<MonsterEditorState> {
  @override
  MonsterEditorState build() {
    final monsters = ref.watch(monstersProvider);
    return MonsterEditorState(
      selectedMonster: 0,
      inParty: List.generate(monsters.length, (_) => false),
    );
  }

  void selectMonster(int index) {
    state = state.copyWith(selectedMonster: index);
  }

  void toggleMonsterInParty(int index, BuildContext context) {
    final current = List<bool>.from(state.inParty);
    // Expand the list if necessary
    while (current.length <= index) {
      current.add(false);
    }
    final count = current.where((e) => e).length;

    if (!current[index] && count >= 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Maximal 3 Monster in der Party erlaubt")),
      );
      return;
    }

    current[index] = !current[index];
    state = state.copyWith(inParty: current);
  }
}

final monsterEditorProvider =
    NotifierProvider<MonsterEditorNotifier, MonsterEditorState>(
      () => MonsterEditorNotifier(),
    );
