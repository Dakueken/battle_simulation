import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/data/mock_data/messages.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/features/battle/domain/b_s_initative_builder.dart';
import 'package:battle_simulation/src/features/battle/domain/b_s_turn_manager.dart';
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
  bool _monsterTurnScheduled = false;

  @override
  void initState() {
    super.initState();
    final initialTurnOrder = getTurnOrder(characters, monsters, spells);
    turnManager = BSTurnManager(
      turnOrder: initialTurnOrder,
      onLog: (text) => messages.add(text),
    );
  }

  @override
  void dispose() {
    turnManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/backgrounds/arena_background.jpg",
            fit: BoxFit.cover,
          ),

          SafeArea(
            bottom: false,
            top: false,
            child: Stack(
              children: [
                ValueListenableBuilder<List<dynamic>>(
                  valueListenable: turnManager.turnOrderNotifier,
                  builder: (context, turnOrder, _) {
                    final current = turnManager.currentNotifier.value;
                    return BSInitiativeList(
                      turnOrder: turnOrder,
                      activeIndex: turnOrder.indexOf(current),
                    );
                  },
                ),

                const BSBattleMonster(),

                const BSBattleCharacter(),

                const BSBattleLog(),

                ValueListenableBuilder<dynamic>(
                  valueListenable: turnManager.currentNotifier,
                  builder: (context, selectedCharacter, _) {
                    if (selectedCharacter is Monster &&
                        !_monsterTurnScheduled) {
                      _monsterTurnScheduled = true;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _monsterTurnScheduled = false;
                        turnManager.handleMonsterTurn();
                      });
                    }

                    return BSBattleAttack(
                      selectedCharacter: selectedCharacter,
                      onSpellTap: () => turnManager.removeFirst(),
                    );
                  },
                ),

                const BSBackToStart(),

                ValueListenableBuilder<String?>(
                  valueListenable: turnManager.turnMessageNotifier,
                  builder: (context, message, _) {
                    if (message == null) return const SizedBox.shrink();
                    return Container(
                      color: Colors.black54,
                      alignment: Alignment.center,
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
