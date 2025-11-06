import 'package:battle_simulation/src/common/models/spell.dart';

List<Spell> spells = [
  Spell(name: "Fire", cd: 12, delay: 10, element: SpellType.Fire.name, dmg: 10),
  Spell(name: "Ice", cd: 5, delay: 10, element: SpellType.Ice.name, dmg: 10),
  Spell(
    name: "Bolt",
    cd: 5,
    delay: 10,
    element: SpellType.Lightning.name,
    dmg: 10,
  ),
  Spell(name: "Heal", cd: 5, delay: 10, element: SpellType.Heal.name, dmg: 10),
];
