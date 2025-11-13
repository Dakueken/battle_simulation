import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:battle_simulation/src/common/widgets/b_s_textformfield.dart';
import 'package:flutter/material.dart';

class BSSpellStat extends StatelessWidget {
  final String statName, stat;
  const BSSpellStat({
    super.key,
    required this.selectedSpell,
    required this.statName,
    required this.stat,
  });

  final int selectedSpell;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: Text(
            statName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        BSTextFormField(initialText: stat),
      ],
    );
  }
}
