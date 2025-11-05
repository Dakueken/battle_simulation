import 'package:battle_simulation/src/data/mock_data/characters.dart';
import 'package:battle_simulation/src/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/data/mock_data/spell.dart';
import 'package:battle_simulation/src/features/battle/domain/initative_builder.dart';
import 'package:flutter/material.dart';

class BSInitiativeList extends StatelessWidget {
  const BSInitiativeList({super.key});

  @override
  Widget build(BuildContext context) {
    final turnOrder = getTurnOrder(characters, monsters, spells);

    return ListView.builder(
      shrinkWrap: false,
      itemCount: turnOrder.length,
      itemBuilder: (context, index) {
        return Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            height: 48,
            decoration: BoxDecoration(
              color: Color.fromARGB(180, 47, 0, 117),
              border: Border.all(
                width: 1,
                color: Color.fromARGB(180, 255, 193, 7),
              ),
            ),
            width: 72,
            child: Image.asset(
              turnOrder[index].image,
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }
}
