import 'package:battle_simulation/battle_screen.dart/character_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Battle Simulator"),
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/backgrounds/arena_background.jpg",
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            right: 100,
            child: SizedBox(
              height: 400,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CharacterScreen()),
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CharacterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Party",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CharacterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Monster",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CharacterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Edit Spells",
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
