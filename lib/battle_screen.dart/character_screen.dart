import 'package:battle_simulation/battle_screen.dart/b_s_textfield.dart';
import 'package:flutter/material.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

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
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                    /* Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ), */
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 40,
            child: Row(
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
