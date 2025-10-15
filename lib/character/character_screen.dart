import 'package:battle_simulation/character/character_selector.dart';
import 'package:battle_simulation/shared/b_s_textfield.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});
  static List<String> spellList = [
    "Fire",
    "Ice",
    "Bolt",
    "Heal",
    "Bolt2",
    "Bolt3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Editor"),
        backgroundColor: Colors.amber,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Character Name
                Text(
                  "Character A",
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
                              BSTextfield(),
                              Text(
                                "/",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              BSTextfield(),
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
                              BSTextfield(),
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
                              BSTextfield(),
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
                              BSTextfield(),
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
                              BSTextfield(),
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
                              itemCount: spellList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  spacing: 10,
                                  children: [
                                    Icon(Icons.person),
                                    Text(
                                      spellList[index],
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

                //Bottom Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          backgroundColor: Color.fromARGB(0, 0, 0, 0),
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return CharacterSelect();
                          },
                        );
                      },
                      child: Text(
                        "Change Character",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Abort Changes",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
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
        ],
      ),
    );
  }
}
