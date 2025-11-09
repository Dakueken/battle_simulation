import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/widgets/b_s_textformfield.dart';
import 'package:flutter/material.dart';

class BSHpRow extends StatelessWidget {
  final int selectedChar;
  final bool isChar;
  const BSHpRow({required this.selectedChar, required this.isChar, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text(
            "HP: ",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        isChar
            ? BSTextFormField(
                initialText: characters[selectedChar].currentHP.toString(),
              )
            : Container(),
        isChar
            ? Text("/", style: Theme.of(context).textTheme.headlineMedium)
            : Container(),
        isChar
            ? BSTextFormField(
                initialText: characters[selectedChar].maxHP.toString(),
              )
            : BSTextFormField(
                initialText: monsters[selectedChar].maxHP.toString(),
              ),
      ],
    );
  }
}
