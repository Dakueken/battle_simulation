class Spell {
  final String name;
  final int cooldown, delay;
  Spell(this.name, this.cooldown, this.delay);
}

List<Spell> spells = [
  Spell("Fire", 5, 5),
  Spell("Ice", 5, 5),
  Spell("Bolt", 5, 5),
  Spell("Heal", 5, 5),
];
