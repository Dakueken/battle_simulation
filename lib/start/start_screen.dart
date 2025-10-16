import 'package:battle_simulation/battle/battle_screen.dart';
import 'package:battle_simulation/character/character_screen.dart';
import 'package:battle_simulation/spells/spell_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text("Battle Simulator" ,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: Color.fromARGB(180, 255, 193, 7),),
       */
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/backgrounds/arena_background.jpg",
            fit: BoxFit.cover,
          ),
          Positioned(
            right: 150,
            bottom: 75,
            child: SizedBox(
              height: 250,
              child: Image.asset(
                "lib/assets/monster/green/idle/frame-1.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: 170,
            bottom: 50,
            child: SizedBox(
              height: 200,
              child: Image.asset(
                "lib/assets/images/wizard.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BattleScreen()),
                  );
                },
                child: Text(
                  "Start Battle",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CharacterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Character",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  /* ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Party",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ), */
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SpellScreen()),
                      );
                    },
                    child: Text(
                      "Edit Spells",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Edit Monster",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
