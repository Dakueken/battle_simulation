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
