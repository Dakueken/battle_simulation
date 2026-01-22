import 'package:battle_simulation/src/common/providers/spells/spells_provider.dart';
import 'package:battle_simulation/src/common/providers/spells/spell_editor_provider.dart';
import 'package:battle_simulation/src/features/spells/domain/spell_select.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BSSpellSave extends ConsumerWidget {
  final GlobalKey<FormState> spellKey;
  final VoidCallback? onAbortDelete;
  final VoidCallback? onDelete;

  const BSSpellSave({
    super.key,
    required this.spellKey,
    this.onAbortDelete,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spellNotifier = ref.read(spellEditorProvider.notifier);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              ref.read(spellsProvider.notifier).addSpell();
              Future.microtask(() {
                final spells = ref.read(spellsProvider);
                spellNotifier.selectSpell(spells.length - 1);
              });
            },
            child: Text(
              "Add New",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          const SizedBox(width: 10),

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
              onAbortDelete?.call();
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
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onDelete == null
                ? null
                : () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Expanded(child: Text('Delete this spell?')),
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(
                                  context,
                                ).hideCurrentSnackBar();
                              },
                              child: const Text(
                                'Abort',
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(
                                  context,
                                ).hideCurrentSnackBar();
                                onDelete!();
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 5),
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text(
              "Delete",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
