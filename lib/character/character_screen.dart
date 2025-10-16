import 'package:battle_simulation/character/character_selector.dart';
import 'package:battle_simulation/shared/b_s_textformfield.dart';
import 'package:battle_simulation/shared/mock_data/characters.dart';
import 'package:battle_simulation/shared/mock_data/spell.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  int selectedChar = 0;
  final _charKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Character Editor",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Color.fromARGB(180, 255, 193, 7),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Hintergrundbild
          Image.asset(
            "lib/assets/backgrounds/tavern_background.jpg",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
            child: Form(
              key: _charKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Character Name
                  Text(
                    characters[selectedChar].name,
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
                                  initialText: characters[selectedChar]
                                      .currentHP
                                      .toString(),
                                ),
                                Text(
                                  "/",
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                BSTextFormField(
                                  initialText: characters[selectedChar].maxHP
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
                                  initialText: characters[selectedChar].armor
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
                                  initialText: characters[selectedChar].mp
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
                                  initialText: characters[selectedChar].speed
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
                                  initialText: characters[selectedChar].luck
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

                  /// BOTTOM BUTTONS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final selectedIndex = await showModalBottomSheet<int>(
                            backgroundColor: Color.fromARGB(0, 0, 0, 0),
                            context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return CharacterSelect();
                            },
                          );

                          if (selectedIndex != null) {
                            setState(() {
                              selectedChar = selectedIndex;
                            });
                          }
                        },

                        child: Text(
                          "Change Character",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          _charKey.currentState?.reset();
                        },
                        child: Text(
                          "Abort Changes",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_charKey.currentState!.validate()) {
                            _charKey.currentState!.save();
                            // TODO: Save logic
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(milliseconds: 10),
                                backgroundColor: Color.fromARGB(
                                  180,
                                  255,
                                  193,
                                  7,
                                ),
                                content: Text(
                                  'Änderungen gespeichert',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Save Changes",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ],
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
