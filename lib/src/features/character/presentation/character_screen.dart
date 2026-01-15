import 'package:battle_simulation/src/common/widgets/b_s_back_button.dart';
import 'package:battle_simulation/src/common/widgets/b_s_save_abort.dart';
import 'package:battle_simulation/src/common/widgets/b_s_spell_list.dart';
import 'package:battle_simulation/src/common/widgets/b_s_stats_column.dart';
import 'package:battle_simulation/src/common/providers/selected_character_provider.dart';
import 'package:battle_simulation/src/common/providers/character_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterScreen extends ConsumerWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChar = ref.watch(selectedCharacterProvider);
    final characters = ref.watch(charactersProvider);
    final character = characters[selectedChar];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "lib/assets/backgrounds/tavern_background.jpg",
            fit: BoxFit.fill,
          ),
          SafeArea(
            bottom: false,
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: ValueKey('form_$selectedChar'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Header row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          character.name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const BSBackButton(),
                      ],
                    ),

                    const SizedBox(height: 5),

                    // Stats + Spells (ORIGINAL LAYOUT)
                    Row(
                      children: [
                        BSStatsColumn(selectedChar: selectedChar, isChar: true),
                        const BSSpellList(),
                      ],
                    ),

                    // Save / Abort / Change Character
                    Builder(
                      builder: (context) {
                        return BSSaveAbort(
                          monster: false,
                          selectedChar: selectedChar,
                          onCharacterChange: (index) {
                            ref
                                .read(selectedCharacterProvider.notifier)
                                .select(index);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
