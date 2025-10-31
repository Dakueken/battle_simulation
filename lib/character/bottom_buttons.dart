import 'package:battle_simulation/monster/monster_select.dart';
import 'package:flutter/material.dart';
import 'package:battle_simulation/character/character_select.dart';

class BottomButtons extends StatelessWidget {
  final int selectedChar;
  final bool monster;
  final void Function(int) onCharacterChange;

  const BottomButtons({
    super.key,
    required this.selectedChar,
    required this.monster,
    required this.onCharacterChange,
  });

  @override
  Widget build(BuildContext context) {
    final formState = Form.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            final selectedIndex = await showModalBottomSheet<int>(
              backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return monster
                    ? const MonsterSelect()
                    : const CharacterSelect();
              },
            );
            if (selectedIndex != null) {
              onCharacterChange(selectedIndex);
            }
          },
          child: Text(
            "Change Character",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            formState.reset();
          },
          child: Text(
            "Abort Changes",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            if (formState.validate()) {
              formState.save();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Saved')));
            }
          },
          child: Text(
            "Save Changes",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
