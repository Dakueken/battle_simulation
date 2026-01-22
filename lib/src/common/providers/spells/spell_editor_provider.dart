import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:battle_simulation/src/common/providers/spells/spells_provider.dart';

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
    ref.read(spellsProvider.notifier).updateDamage(state.selectedSpell, value);
  }

  void updateCooldown(double value) {
    ref
        .read(spellsProvider.notifier)
        .updateCooldown(state.selectedSpell, value);
  }

  void updateDelay(double value) {
    ref.read(spellsProvider.notifier).updateDelay(state.selectedSpell, value);
  }
}

final spellEditorProvider =
    NotifierProvider<SpellEditorNotifier, SpellEditorState>(
      SpellEditorNotifier.new,
    );
