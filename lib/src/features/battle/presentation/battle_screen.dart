import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/data/mock_data/spell.dart';
import 'package:battle_simulation/src/common/data/mock_data/messages.dart';
import 'package:battle_simulation/src/features/battle/domain/b_s_turn_manager.dart';
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
  late BSTurnManager turnManager;

  @override
  void initState() {
    super.initState();
    final initialTurnOrder = getTurnOrder(characters, monsters, spells);
    turnManager = BSTurnManager(
      turnOrder: initialTurnOrder,
      onLog: (text) {
        messages.add(text);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: turnManager,
      builder: (context, _) {
        final selectedCharacter = turnManager.current;

        if (selectedCharacter is Monster) {
          turnManager.handleMonsterTurn();
        }

        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              // Background
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
                    BSInitiativeList(
                      turnOrder: turnManager.turnOrder,
                      activeIndex: turnManager.turnOrder.indexOf(
                        selectedCharacter,
                      ),
                    ),
                    BSBattleMonster(),
                    BSBattleCharacter(),
                    BSBattleLog(),
                    BSBattleAttack(
                      selectedCharacter: selectedCharacter,
                      onSpellTap: () => turnManager.removeFirst(),
                    ),
                    BSBackToStart(),
                  ],
                ),
              ),

              if (turnManager.turnMessage != null)
                Container(
                  color: Colors.black54,
                  alignment: Alignment.center,
                  child: Text(
                    turnManager.turnMessage!,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
