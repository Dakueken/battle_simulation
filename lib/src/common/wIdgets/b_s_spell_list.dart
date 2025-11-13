import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:flutter/material.dart';

class BSSpellList extends StatelessWidget {
  const BSSpellList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Edit Spelllist",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ],
          ),
          Container(
            color: Color.fromARGB(100, 0, 0, 0),
            height: 170,
            width: 330,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: spells.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Icon(Icons.person),
                    Text(
                      spells[index].name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
