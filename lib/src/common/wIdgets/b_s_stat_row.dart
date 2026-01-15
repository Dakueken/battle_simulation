import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/providers/character_providers.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/widgets/b_s_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BSStatRow extends ConsumerWidget {
  final int selectedChar;
  final bool isChar;
  final String stat;

  const BSStatRow({
    super.key,
    required this.stat,
    required this.selectedChar,
    required this.isChar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final character = isChar
        ? ref.watch(charactersProvider)[selectedChar]
        : null;
    final monster = isChar ? null : monsters[selectedChar];

    int getValue() {
      if (isChar) {
        switch (stat) {
          case "Armor":
            return character!.armor;
          case "Magic Power":
            return character!.mp;
          case "Speed":
            return character!.speed;
          case "Luck":
            return character!.luck;
        }
      } else {
        switch (stat) {
          case "Armor":
            return monster!.armor;
          case "Magic Power":
            return monster!.mp;
          case "Speed":
            return monster!.speed;
          case "Luck":
            return monster!.luck;
        }
      }
      return 0;
    }

    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text(stat, style: Theme.of(context).textTheme.headlineMedium),
        ),

        BSTextFormField(
          initialText: getValue().toString(),
          fieldKey: ValueKey(stat),
          onSavedValue: (value) {
            if (isChar) {
              final latest = ref.read(charactersProvider)[selectedChar];
              final updated = _updateCharacter(latest, value.toInt());
              ref
                  .read(charactersProvider.notifier)
                  .updateCharacter(selectedChar, updated);
            } else {
              _updateMonster(selectedChar, stat, value.toInt());
            }
          },
        ),
      ],
    );
  }

  Character _updateCharacter(Character latest, int value) {
    switch (stat) {
      case "Armor":
        return latest.copyWith(armor: value);
      case "Magic Power":
        return latest.copyWith(mp: value);
      case "Speed":
        return latest.copyWith(speed: value);
      case "Luck":
        return latest.copyWith(luck: value);
      default:
        return latest;
    }
  }

  void _updateMonster(int index, String stat, int value) {
    switch (stat) {
      case "Armor":
        monsters[index].armor = value;
        break;
      case "Magic Power":
        monsters[index].mp = value;
        break;
      case "Speed":
        monsters[index].speed = value;
        break;
      case "Luck":
        monsters[index].luck = value;
        break;
    }
  }
}
