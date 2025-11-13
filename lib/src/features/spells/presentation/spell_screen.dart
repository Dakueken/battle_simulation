import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:battle_simulation/src/common/widgets/b_s_back_button.dart';
import 'package:battle_simulation/src/common/data/mock_data/spells.dart';
import 'package:battle_simulation/src/features/spells/presentation/widgets/b_s_spell_element.dart';
import 'package:battle_simulation/src/features/spells/presentation/widgets/b_s_spell_save.dart';
import 'package:battle_simulation/src/features/spells/presentation/widgets/b_s_spell_stat.dart';
import 'package:flutter/material.dart';

class SpellScreen extends StatefulWidget {
  const SpellScreen({super.key});

  @override
  State<SpellScreen> createState() => _SpellScreenState();
}

class _SpellScreenState extends State<SpellScreen> {
  final _spellKey = GlobalKey<FormState>();
  int selectedSpell = 0;
  SpellType selectedType = SpellType.Fire;

  void _onSpellChanged(int newSpell, SpellType newType) {
    setState(() {
      selectedSpell = newSpell;
      selectedType = newType;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Form(
                key: _spellKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          spells[selectedSpell].name,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        BSBackButton(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    BSSpellStat(
                      selectedSpell: selectedSpell,
                      statName: "Damage Modifier",
                      stat: spells[selectedSpell].dmg.toString(),
                    ),
                    BSSpellStat(
                      selectedSpell: selectedSpell,
                      statName: "Cooldown",
                      stat: spells[selectedSpell].cd.toString(),
                    ),
                    BSSpellStat(
                      selectedSpell: selectedSpell,
                      statName: "Delay",
                      stat: spells[selectedSpell].delay.toString(),
                    ),
                    BSSpellElement(
                      selectedType: selectedType,
                      onTypeChanged: (newType) {
                        setState(() {
                          selectedType = newType;
                        });
                      },
                    ),
                    BSSpellSave(
                      spellKey: _spellKey,
                      selectedSpell: selectedSpell,
                      selectedType: selectedType,
                      onSpellChanged: _onSpellChanged,
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
