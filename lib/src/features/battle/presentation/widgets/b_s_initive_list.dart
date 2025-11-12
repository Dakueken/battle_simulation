import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/data/mock_data/spell.dart';
import 'package:battle_simulation/src/features/battle/domain/initative_builder.dart';
import 'package:flutter/material.dart';

class BSInitiativeList extends StatelessWidget {
  final List<dynamic> turnOrder;

  const BSInitiativeList({super.key, required this.turnOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(100, 0, 0, 0),
      width: 72,
      child: ListView.builder(
        itemCount: turnOrder.length,
        itemBuilder: (context, index) {
          final characterOrMonster = turnOrder[index];
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
                characterOrMonster.image,
                alignment: Alignment.center,
                fit: BoxFit.fitHeight,
              ),
            ),
          );
        },
      ),
    );
  }
}
