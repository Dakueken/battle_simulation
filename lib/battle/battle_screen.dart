import 'package:flutter/material.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen({super.key});

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> initiativeList = [
      "lib/assets/characters/character_a.png",
      "lib/assets/characters/character_b.png",
      "lib/assets/monster/orange/idle/frame-1.png",
      "lib/assets/characters/character_c.png",
      "lib/assets/characters/character_d.png",
      "lib/assets/monster/green/idle/frame-1.png",
      "lib/assets/characters/character_a.png",
      "lib/assets/characters/character_b.png",
      "lib/assets/characters/character_d.png",
      "lib/assets/monster/green/idle/frame-1.png",
      "lib/assets/monster/orange/idle/frame-1.png",
      "lib/assets/characters/character_c.png",
      "lib/assets/characters/character_a.png",
      "lib/assets/monster/green/idle/frame-1.png",
    ];
    List<String> messages = [
      "Character A dealt 20 dmg to Monster A",
      "Character B dealt 30 dmg to Monster A",
      "Monster A dealt 20 dmg to Character B",
      "Character A dealt 20 dmg to Monster A",
      "Character B dealt 30 dmg to Monster A",
      "Monster A dealt 20 dmg to Character B",
      "Character A dealt 20 dmg to Monster A",
      "Character B dealt 30 dmg to Monster A",
      "Monster A dealt 20 dmg to Character B",
      "Character A dealt 20 dmg to Monster A",
      "Character B dealt 30 dmg to Monster A",
      "Monster A dealt 20 dmg to Character B",
    ];

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
                          color: Color.fromARGB(100, 0, 0, 0),
                          border: Border.all(
                            color: const Color.fromARGB(150, 255, 255, 255),
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
                            height: 140,
                            width: 200,
                            child: Image.asset(
                              "lib/assets/monster/orange/idle/frame-1.png",
                              fit: BoxFit.contain,
                            ),
                          ),
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
                            height: 140,
                            width: 200,
                            child: Image.asset(
                              "lib/assets/monster/green/idle/frame-1.png",
                              fit: BoxFit.contain,
                            ),
                          ),
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
                      spacing: 20,
                      children: [
                        Column(
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        Column(
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        Column(
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                        Column(
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
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //right Log
          /* SafeArea(
            child: Align(
              alignment: Alignment.topRight,

              child: Expanded(
                child: Container(
                  color: Color.fromARGB(152, 0, 0, 0),
                  width: 250,

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
            ),
          ), */
        ],
      ),
    );
  }
}
