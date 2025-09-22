import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Battle Simulator")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: Text("Kampf starten")),
              ElevatedButton(
                onPressed: () {},
                child: Text("Character bearbeiten"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Monster bearbeiten"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
