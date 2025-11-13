import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:flutter/material.dart';

class BSSpellElement extends StatelessWidget {
  final SpellType selectedType;
  final ValueChanged<SpellType> onTypeChanged;

  const BSSpellElement({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final spellTypes = SpellType.values;

    return Row(
      children: [
        SizedBox(
          width: 300,
          child: Text(
            "Element",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        DropdownButton<SpellType>(
          dropdownColor: const Color.fromARGB(180, 47, 0, 117),
          value: selectedType,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          onChanged: (SpellType? newValue) {
            if (newValue != null) {
              onTypeChanged(newValue);
            }
          },
          items: spellTypes.map((SpellType spell) {
            return DropdownMenuItem<SpellType>(
              value: spell,
              child: Text(
                spell.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
