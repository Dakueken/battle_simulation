import 'package:battle_simulation/shared/mock_data/characters.dart';
import 'package:battle_simulation/shared/spell.dart';
import 'package:flutter/material.dart';

class CharacterSelect extends StatefulWidget {
  const CharacterSelect({super.key});

  @override
  State<CharacterSelect> createState() => _CharacterSelectState();
}

class _CharacterSelectState extends State<CharacterSelect> {
  List<bool> checkboxValues = List.generate(characters.length, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(152, 0, 0, 0),
        borderRadius: BorderRadius.all(Radius.zero),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
            child: Row(
              spacing: 10,
              children: [
                SizedBox(
                  width: 150,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "back",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 120),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(180, 47, 0, 117),
                      border: Border.all(
                        width: 5,
                        color: Color.fromARGB(180, 255, 193, 7),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "in Party",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                Checkbox(
                                  value: checkboxValues[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checkboxValues[index] = value!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 64,
                              child: Image.asset(
                                characters[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),

                        Text(
                          characters[index].name,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
