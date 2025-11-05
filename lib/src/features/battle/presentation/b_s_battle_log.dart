import 'package:battle_simulation/src/data/mock_data/messages.dart';
import 'package:flutter/material.dart';

class BSBattleLog extends StatelessWidget {
  const BSBattleLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.all(10),
        color: Color.fromARGB(152, 0, 0, 0),
        width: 450,
        height: 150,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 5, 30, 5),
          controller: ScrollController(),
          child: Text(
            messages.join('\n'),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
