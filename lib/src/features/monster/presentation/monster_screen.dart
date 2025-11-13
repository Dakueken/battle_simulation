import 'package:battle_simulation/src/common/widgets/b_s_back_button.dart';
import 'package:battle_simulation/src/common/widgets/b_s_save_abort.dart';
import 'package:battle_simulation/src/common/widgets/b_s_spell_list.dart';
import 'package:battle_simulation/src/common/widgets/b_s_stats_column.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:flutter/material.dart';

class MonsterScreen extends StatefulWidget {
  const MonsterScreen({super.key});

  @override
  State<MonsterScreen> createState() => _MonsterScreenState();
}

class _MonsterScreenState extends State<MonsterScreen> {
  int selectedMonster = 0;
  final bool isChar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        fit: StackFit.expand,
        children: [
          //Hintergrundbild
          Image.asset(
            "lib/assets/backgrounds/dungeon_background.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            bottom: false,
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Form(
                key: ValueKey('form_$selectedMonster'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Monster Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          monsters[selectedMonster].name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        BSBackButton(),
                      ],
                    ),
                    SizedBox(height: 5),

                    //Stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BSStatsColumn(
                          selectedChar: selectedMonster,
                          isChar: isChar,
                        ),

                        // Spell List
                        BSSpellList(),
                      ],
                    ),

                    BSSaveAbort(
                      monster: true,
                      selectedChar: selectedMonster,
                      onCharacterChange: (index) {
                        setState(() {
                          selectedMonster = index;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
