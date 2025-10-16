import 'package:battle_simulation/shared/b_s_textformfield.dart';
import 'package:battle_simulation/shared/mock_data/spell.dart';
import 'package:battle_simulation/spells/spell_select.dart';
import 'package:flutter/material.dart';

class SpellScreen extends StatefulWidget {
  const SpellScreen({super.key});

  @override
  State<SpellScreen> createState() => _SpellScreenState();
}

class _SpellScreenState extends State<SpellScreen> {
  final List<String> spellTypes = ['Fire', 'Ice', 'Lightning', 'Heal'];
  String selectedType = 'Fire';
  int selectedSpell = 0;

  final _spellKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Spell Editor",
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

          //rest des screens
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Form(
              key: _spellKey,
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Spell Name
                  Text(
                    spells[selectedSpell].name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  SizedBox(height: 5),

                  //Stats
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Damage Modfier",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      BSTextFormField(
                        initialText: spells[selectedSpell].dmg.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Cooldown",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      BSTextFormField(
                        initialText: spells[selectedSpell].cd.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Delay",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      BSTextFormField(
                        initialText: spells[selectedSpell].delay.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          "Element",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      DropdownButton(
                        dropdownColor: Color.fromARGB(180, 47, 0, 117),
                        value: selectedType,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedType = newValue!;
                          });
                        },
                        items: spellTypes.map((String spell) {
                          return DropdownMenuItem<String>(
                            value: spell,
                            child: Text(
                              spell,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  //Botton Buttons
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final selectedIndex =
                                await showModalBottomSheet<int>(
                                  backgroundColor: Color.fromARGB(0, 0, 0, 0),
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return SpellSelect();
                                  },
                                );

                            if (selectedIndex != null) {
                              setState(() {
                                selectedSpell = selectedIndex;
                                selectedType = spells[selectedSpell].element;
                              });
                            }
                          },

                          child: Text(
                            "Select Spell",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _spellKey.currentState?.reset();
                          },
                          child: Text(
                            "Abort Changes",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_spellKey.currentState!.validate()) {
                              _spellKey.currentState!.save();
                              // TODO: Save logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  duration: Duration(seconds: 1),
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
