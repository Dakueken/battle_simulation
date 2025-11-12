import 'package:battle_simulation/src/common/models/character.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/data/mock_data/spell.dart';
import 'package:battle_simulation/src/common/data/mock_data/messages.dart';
import 'package:battle_simulation/src/features/battle/domain/initative_builder.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_back_to_start.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_attack.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_character.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_log.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_monster.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_initive_list.dart';
import 'package:flutter/material.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  late List<dynamic> turnOrder;

  @override
  void initState() {
    super.initState();
    turnOrder = getTurnOrder(characters, monsters, spells);
  }

  @override
  Widget build(BuildContext context) {
    final selectedCharacter = turnOrder.isNotEmpty ? turnOrder.first : null;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Background
          Image.asset(
            "lib/assets/backgrounds/arena_background.jpg",
            fit: BoxFit.cover,
          ),
          SafeArea(
            left: false,
            bottom: false,
            top: false,
            child: Stack(
              children: [
                BSInitiativeList(turnOrder: turnOrder),

                BSBattleMonster(),

                BSBattleCharacter(),

                BSBattleLog(),

                BSBattleAttack(selectedCharacter: selectedCharacter),

                BSBackToStart(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
