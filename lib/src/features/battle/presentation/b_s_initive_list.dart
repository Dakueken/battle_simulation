import 'package:battle_simulation/src/features/battle/domain/initiative_list.dart';
import 'package:flutter/material.dart';

class BSInitiativeList extends StatelessWidget {
  const BSInitiativeList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: false,
      itemCount: initiativeList.length,
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
              initiativeList[index],
              alignment: Alignment.center,
              fit: BoxFit.fitHeight,
            ),
          ),
        );
      },
    );
  }
}
