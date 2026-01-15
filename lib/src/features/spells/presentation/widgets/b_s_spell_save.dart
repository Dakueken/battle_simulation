import 'package:battle_simulation/src/common/providers/spells/spell_editor_provider.dart';
import 'package:battle_simulation/src/features/spells/domain/spell_select.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BSSpellSave extends ConsumerWidget {
  final GlobalKey<FormState> spellKey;

  const BSSpellSave({super.key, required this.spellKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spellNotifier = ref.read(spellEditorProvider.notifier);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final selectedIndex = await showModalBottomSheet<int>(
                backgroundColor: Colors.transparent,
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return const SpellSelect();
                },
              );

              if (selectedIndex != null) {
                spellNotifier.selectSpell(selectedIndex);
              }
            },
            child: Text(
              "Select Spell",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          const SizedBox(width: 10),

          ElevatedButton(
            onPressed: () {
              spellKey.currentState?.reset();
            },
            child: Text(
              "Abort Changes",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          const SizedBox(width: 10),

          ElevatedButton(
            onPressed: () {
              if (spellKey.currentState!.validate()) {
                spellKey.currentState!.save();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Saved'),
                    duration: Duration(milliseconds: 50),
                  ),
                );
              }
            },
            child: Text(
              "Save Changes",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
