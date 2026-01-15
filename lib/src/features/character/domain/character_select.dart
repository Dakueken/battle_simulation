import 'package:battle_simulation/src/common/data/mock_data/characters.dart';
import 'package:battle_simulation/src/common/providers/character/character_editor_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSelect extends ConsumerWidget {
  const CharacterSelect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterState = ref.watch(characterEditorProvider);
    final characterNotifier = ref.read(characterEditorProvider.notifier);

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
                final isInParty = characterState.inParty[index];

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
                                  "in Party",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontSize: 10),
                                ),
                                Checkbox(
                                  value: isInParty,
                                  onChanged: (_) {
                                    characterNotifier.toggleCharacterInParty(
                                      index,
                                      context,
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
