import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:battle_simulation/src/common/providers/character_providers.dart';
import 'package:battle_simulation/src/common/providers/monsters_provider.dart';
import 'package:battle_simulation/src/common/providers/turn_manager_provider.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_back_to_start.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_attack.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_character.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_log.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_battle_monster.dart';
import 'package:battle_simulation/src/features/battle/presentation/widgets/b_s_initive_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BattleScreen extends ConsumerStatefulWidget {
  const BattleScreen({super.key});

  @override
  ConsumerState<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends ConsumerState<BattleScreen> {
  bool _monsterTurnScheduled = false;

  @override
  Widget build(BuildContext context) {
    ref.listen(turnManagerProvider, (previous, next) {
      final actor = next.currentActor;

      if (actor is Monster && !_monsterTurnScheduled) {
        _monsterTurnScheduled = true;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _monsterTurnScheduled = false;
          ref.read(turnManagerProvider.notifier).nextTurn();
        });
      }
    });

    final turnState = ref.watch(turnManagerProvider);
    final turnOrder = turnState.turnOrder;

    ref.watch(charactersProvider);
    ref.watch(monstersProvider);

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
                BSInitiativeList(
                  turnOrder: turnOrder,
                  activeIndex: turnOrder.indexOf(turnState.currentActor),
                ),
                const BSBattleMonster(),
                const BSBattleCharacter(),
                const BSBattleLog(),

                BSBattleAttack(
                  selectedCharacter: turnState.currentActor,
                  onSpellTap: (Spell spell) {
                    final actor = turnState.currentActor;

                    if (actor is! Monster) {
                      // Pick first alive monster as target
                      final target = ref
                          .read(monstersProvider)
                          .firstWhere((m) => m.inBattle);

                      ref
                          .read(turnManagerProvider.notifier)
                          .playerAttack(actor, target, spell);
                    }
                  },
                ),

                const BSBackToStart(),

                if (turnState.lastMessage != null)
                  Container(
                    color: Colors.black54,
                    alignment: Alignment.center,
                    child: Text(
                      turnState.lastMessage!,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
