import 'package:battle_simulation/src/common/widgets/b_s_hp_row.dart';
import 'package:battle_simulation/src/common/widgets/b_s_stat_row.dart';
import 'package:flutter/material.dart';

class BSStatsColumn extends StatelessWidget {
  const BSStatsColumn({
    super.key,
    required this.selectedChar,
    required this.isChar,
  });

  final int selectedChar;
  final bool isChar;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 10,
        children: [
          BSHpRow(selectedChar: selectedChar, isChar: isChar),
          BSStatRow(isChar: isChar, stat: "Armor", selectedChar: selectedChar),
          BSStatRow(
            stat: "Magic Power",
            isChar: isChar,
            selectedChar: selectedChar,
          ),
          BSStatRow(stat: "Speed", isChar: isChar, selectedChar: selectedChar),
          BSStatRow(stat: "Luck", isChar: isChar, selectedChar: selectedChar),
        ],
      ),
    );
  }
}
