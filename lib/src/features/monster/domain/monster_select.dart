import 'package:battle_simulation/src/data/mock_data/monsters.dart';
import 'package:flutter/material.dart';

class MonsterSelect extends StatefulWidget {
  const MonsterSelect({super.key});

  @override
  State<MonsterSelect> createState() => _MonsterSelectState();
}

class _MonsterSelectState extends State<MonsterSelect> {
  List<bool> checkboxValues = List.generate(monsters.length, (x) => false);

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
              itemCount: monsters.length,
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
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop(index);
                              },
                              child: SizedBox(
                                height: 64,
                                child: Image.asset(
                                  monsters[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Text(
                          monsters[index].name,
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
