import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:battle_simulation/src/features/spells/domain/spell_select.dart';
import 'package:flutter/material.dart';

class BSSpellSave extends StatefulWidget {
  final GlobalKey<FormState> spellKey;
  final SpellType selectedType;
  final int selectedSpell;
  final Function(int newSpell, SpellType newType) onSpellChanged;

  const BSSpellSave({
    super.key,
    required this.spellKey,
    required this.selectedSpell,
    required this.selectedType,
    required this.onSpellChanged,
  });

  @override
  State<BSSpellSave> createState() => _BSSpellSaveState();
}

class _BSSpellSaveState extends State<BSSpellSave> {
  late int selectedSpell;
  late SpellType selectedType;

  @override
  void initState() {
    super.initState();
    selectedSpell = widget.selectedSpell;
    selectedType = widget.selectedType;
  }

  @override
  Widget build(BuildContext context) {
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
                  return SpellSelect();
                },
              );

              if (selectedIndex != null) {
                setState(() {
                  selectedSpell = selectedIndex;
                  selectedType = SpellType.values.firstWhere(
                    (e) => e.name == spells[selectedSpell].element,
                  );
                  widget.onSpellChanged(selectedSpell, selectedType);
                });
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
              widget.spellKey.currentState?.reset();
            },
            child: Text(
              "Abort Changes",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              if (widget.spellKey.currentState!.validate()) {
                widget.spellKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    backgroundColor: const Color.fromARGB(180, 255, 193, 7),
                    content: Text(
                      'Änderungen gespeichert',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
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
