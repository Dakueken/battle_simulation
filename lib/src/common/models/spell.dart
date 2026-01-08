class Spell {
  String name;
  String element;

  double cd;
  double delay;
  double dmg;

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

extension SpellTypeExtension on SpellType {
  String get name {
    switch (this) {
      case SpellType.Fire:
        return 'Fire';
      case SpellType.Ice:
        return 'Ice';
      case SpellType.Lightning:
        return 'Lightning';
      case SpellType.Heal:
        return 'Heal';
    }
  }
}
