import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:battle_simulation/src/common/models/spell.dart';

class SpellEditorState {
  final int selectedSpell;
  final SpellType selectedType;

  SpellEditorState({required this.selectedSpell, required this.selectedType});

  SpellEditorState copyWith({int? selectedSpell, SpellType? selectedType}) {
    return SpellEditorState(
      selectedSpell: selectedSpell ?? this.selectedSpell,
      selectedType: selectedType ?? this.selectedType,
    );
  }
}

class SpellEditorNotifier extends Notifier<SpellEditorState> {
  @override
  SpellEditorState build() {
    return SpellEditorState(
      selectedSpell: 0,
      selectedType: SpellType.values[0],
    );
  }

  void selectSpell(int index) {
    state = state.copyWith(selectedSpell: index);
  }

  void setType(SpellType type) {
    state = state.copyWith(selectedType: type);
  }

  void updateDamage(double value) {
    spells[state.selectedSpell].dmg = value;
  }

  void updateCooldown(double value) {
    spells[state.selectedSpell].cd = value;
  }

  void updateDelay(double value) {
    spells[state.selectedSpell].delay = value;
  }
}

final spellEditorProvider =
    NotifierProvider<SpellEditorNotifier, SpellEditorState>(
      SpellEditorNotifier.new,
    );
