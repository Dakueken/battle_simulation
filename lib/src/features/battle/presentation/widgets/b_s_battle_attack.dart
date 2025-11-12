import 'package:flutter/material.dart';
import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/models/monster.dart';

class BSBattleAttack extends StatelessWidget {
  final dynamic selectedCharacter;
  final VoidCallback? onSpellTap;

  const BSBattleAttack({
    super.key,
    required this.selectedCharacter,
    this.onSpellTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMonster = selectedCharacter is Monster;
    final spellsToShow = selectedCharacter is Character
        ? selectedCharacter.characterSpells
        : [];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Color.fromARGB(152, 0, 0, 0),
        height: 100,
        width: 500,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => VerticalDivider(),
          itemCount: spellsToShow.length,
          itemBuilder: (context, index) {
            final spell = spellsToShow[index];

            return GestureDetector(
              onTap: isMonster ? null : onSpellTap,
              child: Container(
                padding: EdgeInsets.all(5),
                width: 170,
                decoration: BoxDecoration(
                  color: Color.fromARGB(180, 47, 0, 117),
                  border: Border.all(
                    width: 5,
                    color: Color.fromARGB(180, 255, 193, 7),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      spell.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      "CD: ${spell.cd}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      "Delay: ${spell.delay}",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
