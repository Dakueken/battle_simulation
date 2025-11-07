import 'package:battle_simulation/src/common/widgets/b_s_save_abort.dart';
import 'package:battle_simulation/src/common/widgets/b_s_textformfield.dart';
import 'package:battle_simulation/src/common/data/mock_data/monsters.dart';
import 'package:battle_simulation/src/common/data/mock_data/spell.dart';
import 'package:flutter/material.dart';

class MonsterScreen extends StatefulWidget {
  const MonsterScreen({super.key});

  @override
  State<MonsterScreen> createState() => _MonsterScreenState();
}

class _MonsterScreenState extends State<MonsterScreen> {
  int selectedMonster = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Monster Editor",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Color.fromARGB(180, 255, 193, 7),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Hintergrundbild
          Image.asset(
            "lib/assets/backgrounds/dungeon_background.jpg",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Form(
              key: ValueKey('form_$selectedMonster'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Monster Name
                  Text(
                    monsters[selectedMonster].name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 5),

                  //Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "HP: ",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                ),
                                BSTextFormField(
                                  initialText: monsters[selectedMonster].maxHP
                                      .toString(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Armor",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                ),
                                BSTextFormField(
                                  initialText: monsters[selectedMonster].armor
                                      .toString(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Magic Power",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                ),
                                BSTextFormField(
                                  initialText: monsters[selectedMonster].mp
                                      .toString(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Speed",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                ),
                                BSTextFormField(
                                  initialText: monsters[selectedMonster].speed
                                      .toString(),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Luck",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                ),
                                BSTextFormField(
                                  initialText: monsters[selectedMonster].luck
                                      .toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Spell List
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 20,
                              children: [
                                Text(
                                  "Spell List",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Edit Spelllist",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineMedium,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 170,
                              width: 330,
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(10),
                                itemCount: spells.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    spacing: 10,
                                    children: [
                                      Icon(Icons.person),
                                      Text(
                                        spells[index].name,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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
        ],
      ),
    );
  }
}
