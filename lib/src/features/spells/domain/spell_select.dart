import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpellSelect extends ConsumerWidget {
  const SpellSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
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
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "back",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      "create new Spell",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(width: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: spells.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 120),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(180, 47, 0, 117),
                          border: Border.all(
                            width: 5,
                            color: const Color.fromARGB(180, 255, 193, 7),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(index),
                          child: Text(
                            spells[index].name,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
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
