import 'package:battle_simulation/src/common/widgets/b_s_back_button.dart';
import 'package:battle_simulation/src/common/widgets/b_s_save_abort.dart';
import 'package:battle_simulation/src/common/widgets/b_s_spell_list.dart';
import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/widgets/b_s_stats_column.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int selectedChar = 0;
  bool isChar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Stack(
        fit: StackFit.expand,
        children: [
          //Hintergrundbild
          Image.asset(
            "lib/assets/backgrounds/tavern_background.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            bottom: false,
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Form(
                key: ValueKey('form_$selectedChar'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Character Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          characters[selectedChar].name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        BSBackButton(),
                      ],
                    ),
                    SizedBox(height: 5),

                    //Stats
                    Row(
                      children: [
                        BSStatsColumn(
                          selectedChar: selectedChar,
                          isChar: isChar,
                        ),

                        // Spell List
                        BSSpellList(),
                      ],
                    ),

                    BSSaveAbort(
                      monster: false,
                      selectedChar: selectedChar,
                      onCharacterChange: (index) {
                        setState(() {
                          selectedChar = index;
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
