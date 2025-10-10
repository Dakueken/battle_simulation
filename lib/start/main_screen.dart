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
      appBar: AppBar(title: Text("Battle Simulator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Kampf starten")),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CharacterScreen()),
                  );
                },
                child: Text("Character bearbeiten"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Monster bearbeiten"),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {}, child: Text("Zauber bearbeiten")),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
