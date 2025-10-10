import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  CharacterScreen({super.key});
  final List<String> entries = <String>["A", "B", "C"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Character bearbeiten"),
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        children: [
          Image.asset(
            "lib/assets/backgrounds/tavern_backgorund.jpg",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Character A",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
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
                              SizedBox(
                                width: 80,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                  decoration: InputDecoration(),
                                ),
                              ),
                              Text(
                                "/",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              SizedBox(
                                width: 80,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                  decoration: InputDecoration(),
                                ),
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
                              SizedBox(
                                width: 80,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                  decoration: InputDecoration(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 200,
                            child: Text(
                              "Magic Power",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Text("Test"),
                          Text("Test"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Test",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
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
