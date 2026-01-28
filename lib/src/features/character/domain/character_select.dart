import 'package:battle_simulation/src/common/providers/character/character_providers.dart';
import 'package:battle_simulation/src/common/widgets/b_s_battle_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSelect extends ConsumerWidget {
  const CharacterSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(charactersProvider);
    final charactersNotifier = ref.read(charactersProvider.notifier);

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
              ],
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(width: 5),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final isInParty = characters[index].inBattle;

                return ConstrainedBox(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Fighting",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                BSBattleCheckbox(
                                  value: isInParty,
                                  selectedCount: characters
                                      .where((c) => c.inBattle)
                                      .length,
                                  maxSelected: 4,
                                  type: 'Character',
                                  onChanged: () {
                                    charactersNotifier.setInBattle(
                                      index,
                                      !isInParty,
                                    );
                                  },
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(index),
                              child: SizedBox(
                                height: 64,
                                child: Image.asset(
                                  characters[index].image,
                                  fit: BoxFit.contain,
                                ),
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
