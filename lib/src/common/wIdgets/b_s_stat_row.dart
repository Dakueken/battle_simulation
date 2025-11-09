import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/widgets/b_s_textformfield.dart';
import 'package:flutter/material.dart';

class BSStatRow extends StatelessWidget {
  final int selectedChar;
  final bool isChar;
  final String stat;
  const BSStatRow({
    required this.stat,
    required this.selectedChar,
    required this.isChar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text(stat, style: Theme.of(context).textTheme.headlineMedium),
        ),
        isChar
            ? BSTextFormField(
                initialText: characters[selectedChar].armor.toString(),
              )
            : BSTextFormField(
                initialText: monsters[selectedChar].armor.toString(),
              ),
      ],
    );
  }
}
