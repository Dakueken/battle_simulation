import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:battle_simulation/src/common/providers/spells/spell_editor_provider.dart';
import 'package:battle_simulation/src/common/widgets/b_s_back_button.dart';
import 'package:battle_simulation/src/features/spells/presentation/widgets/b_s_spell_element.dart';
import 'package:battle_simulation/src/features/spells/presentation/widgets/b_s_spell_save.dart';
import 'package:battle_simulation/src/features/spells/presentation/widgets/b_s_spell_stat.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpellScreen extends ConsumerWidget {
  SpellScreen({super.key});

  final _spellKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spellState = ref.watch(spellEditorProvider);
    final spellNotifier = ref.read(spellEditorProvider.notifier);

    final selectedSpell = spellState.selectedSpell;
    final selectedType = spellState.selectedType;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/backgrounds/tavern_background.jpg",
            fit: BoxFit.fill,
          ),

          SafeArea(
            bottom: false,
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Form(
                key: _spellKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          spells[selectedSpell].name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const BSBackButton(),
                      ],
                    ),

                    const SizedBox(height: 10),

                    BSSpellStat(
                      selectedSpell: selectedSpell,
                      statName: "Damage Modifier",
                      stat: spells[selectedSpell].dmg.toString(),
                      onSavedValue: spellNotifier.updateDamage,
                    ),

                    BSSpellStat(
                      selectedSpell: selectedSpell,
                      statName: "Cooldown",
                      stat: spells[selectedSpell].cd.toString(),
                      onSavedValue: spellNotifier.updateCooldown,
                    ),

                    BSSpellStat(
                      selectedSpell: selectedSpell,
                      statName: "Delay",
                      stat: spells[selectedSpell].delay.toString(),
                      onSavedValue: spellNotifier.updateDelay,
                    ),

                    BSSpellElement(
                      selectedType: selectedType,
                      onTypeChanged: spellNotifier.setType,
                    ),

                    BSSpellSave(spellKey: _spellKey),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
