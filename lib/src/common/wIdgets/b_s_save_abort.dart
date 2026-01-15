import 'package:battle_simulation/src/features/monster/domain/monster_select.dart';
import 'package:flutter/material.dart';
import 'package:battle_simulation/src/features/character/domain/character_select.dart';

class BSSaveAbort extends StatelessWidget {
  final int selectedChar;
  final bool monster;
  final void Function(int) onCharacterChange;

  const BSSaveAbort({
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
            final valid = formState.validate();
            if (valid) {
              formState.save();
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
    );
  }
}
