import 'package:flutter/material.dart';

class BSBattleCharacter extends StatelessWidget {
  const BSBattleCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
                    style: Theme.of(context).textTheme.headlineSmall,
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
                    style: Theme.of(context).textTheme.headlineSmall,
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
                    style: Theme.of(context).textTheme.headlineSmall,
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
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
