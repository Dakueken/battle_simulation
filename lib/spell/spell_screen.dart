import 'package:battle_simulation/shared/b_s_textfield.dart';
import 'package:flutter/material.dart';

class SpellScreen extends StatefulWidget {
  const SpellScreen({super.key});

  @override
  State<SpellScreen> createState() => _SpellScreenState();
}

class _SpellScreenState extends State<SpellScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> spellTypes = ['Fire', 'Ice', 'Lightning', 'Heal'];
    String selectedSpell = 'Fire';

    return Scaffold(
      appBar: AppBar(
        title: Text("Spell Editor"),
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

          //rest des screens
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Character Name
                Text("Fire", style: Theme.of(context).textTheme.headlineLarge),
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
                    BSTextfield(),
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
                    BSTextfield(),
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
                    BSTextfield(),
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
                      value: selectedSpell,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSpell = newValue!;
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
                SizedBox(height: 20),

                //Botton Buttons
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Change Spell",
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
