import 'package:battle_simulation/shared/mock_data/initiative_list.dart';
import 'package:battle_simulation/shared/mock_data/messages.dart';
import 'package:battle_simulation/shared/spell.dart';
import 'package:battle_simulation/start/main_screen.dart';
import 'package:flutter/material.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Background
          Image.asset(
            "lib/assets/backgrounds/arena_background.jpg",
            fit: BoxFit.cover,
          ),
          SafeArea(
            bottom: false,
            top: false,
            child: Stack(
              children: [
                // Initive List
                ListView.builder(
                  shrinkWrap: false,
                  itemCount: initiativeList.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        height: 48,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(180, 47, 0, 117),
                          border: Border.all(
                            width: 1,
                            color: Color.fromARGB(180, 255, 193, 7),
                          ),
                        ),
                        width: 72,
                        child: Image.asset(
                          initiativeList[index],
                          alignment: Alignment.center,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    );
                  },
                ),

                //Monster
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 350,
                      child: Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 20,
                            child: LinearProgressIndicator(
                              value: 10 / 120,
                              backgroundColor: Colors.red,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 140,
                            width: 200,
                            child: Image.asset(
                              "lib/assets/monster/orange/idle/frame-1.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 350,
                      child: Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 20,
                            child: LinearProgressIndicator(
                              value: 40 / 120,
                              backgroundColor: Colors.red,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 140,
                            width: 200,
                            child: Image.asset(
                              "lib/assets/monster/green/idle/frame-1.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                //Right Characters
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 120,
                    color: Color.fromARGB(100, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(180, 47, 0, 117),
                            border: Border.all(
                              width: 5,
                              color: Color.fromARGB(180, 255, 193, 7),
                            ),
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              SizedBox(
                                height: 48,
                                child: Image.asset(
                                  "lib/assets/characters/character_a.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "2000/2000",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(180, 47, 0, 117),
                            border: Border.all(
                              width: 5,
                              color: Color.fromARGB(180, 255, 193, 7),
                            ),
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              SizedBox(
                                height: 48,
                                child: Image.asset(
                                  "lib/assets/characters/character_b.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "2000/2000",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(180, 47, 0, 117),
                            border: Border.all(
                              width: 5,
                              color: Color.fromARGB(180, 255, 193, 7),
                            ),
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              SizedBox(
                                height: 48,
                                child: Image.asset(
                                  "lib/assets/characters/character_c.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "2000/2000",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(180, 47, 0, 117),
                            border: Border.all(
                              width: 5,
                              color: Color.fromARGB(180, 255, 193, 7),
                            ),
                          ),
                          child: Column(
                            spacing: 10,
                            children: [
                              SizedBox(
                                height: 48,
                                child: Image.asset(
                                  "lib/assets/characters/character_d.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                "2000/2000",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //right Log
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Color.fromARGB(152, 0, 0, 0),
                    width: 450,
                    height: 150,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(0, 5, 30, 5),
                      controller: ScrollController(),
                      child: Text(
                        messages.join('\n'),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ),

                //bottom Attack
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Color.fromARGB(152, 0, 0, 0),
                    height: 100,
                    width: 500,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => VerticalDivider(),
                      itemCount: spells.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(180, 47, 0, 117),
                            border: Border.all(
                              width: 5,
                              color: Color.fromARGB(180, 255, 193, 7),
                            ),
                          ),
                          width: 170,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                spells[index].name,
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              Text(
                                "CD: ${spells[index].cooldown}",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                              Text(
                                "Delay: ${spells[index].delay}",
                                style: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                //Back to MainScreen
                Align(
                  alignment: Alignment(-0.75, -1),
                  child: SizedBox(
                    width: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: Text(
                        "Abort Battle",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
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
