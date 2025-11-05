class Spell {
  final String name, element;
  final double cd, delay, dmg;
  Spell({
    required this.name,
    required this.dmg,
    required this.cd,
    required this.delay,
    required this.element,
  });
}

// ignore: constant_identifier_names
enum SpellType { Fire, Ice, Lightning, Heal }

List<Spell> spells = [
  Spell(name: "Fire", cd: 12, delay: 13, element: SpellType.Fire.name, dmg: 10),
  Spell(name: "Ice", cd: 5, delay: 5, element: SpellType.Ice.name, dmg: 10),
  Spell(
    name: "Bolt",
    cd: 5,
    delay: 5,
    element: SpellType.Lightning.name,
    dmg: 10,
  ),
  Spell(name: "Heal", cd: 5, delay: 5, element: SpellType.Heal.name, dmg: 10),
];
