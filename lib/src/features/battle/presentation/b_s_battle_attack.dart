import 'package:battle_simulation/src/data/mock_data/spell.dart';
import 'package:flutter/material.dart';

class BSBattleAttack extends StatelessWidget {
  const BSBattleAttack({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Color.fromARGB(152, 0, 0, 0),
        height: 100,
        width: 500,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => VerticalDivider(),
          itemCount: spells.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromARGB(180, 47, 0, 117),
                border: Border.all(
                  width: 5,
                  color: Color.fromARGB(180, 255, 193, 7),
                ),
              ),
              width: 170,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    spells[index].name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "CD: ${spells[index].cd}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "Delay: ${spells[index].delay}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
