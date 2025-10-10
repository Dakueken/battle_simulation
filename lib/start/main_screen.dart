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
            "lib/assets/backgrounds/field_background.jpg",
            fit: BoxFit.fitWidth,
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
