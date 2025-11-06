class Character {
  final int maxHP, currentHP, armor, mp, speed, luck;
  final String name, image;
  final double haste;
  final bool inBattle;

  Character({
    required this.name,
    required this.maxHP,
    required this.currentHP,
    required this.armor,
    required this.mp,
    required this.luck,
    required this.speed,
    required this.image,
    required this.inBattle,
    this.haste = 1.0,
  });
}
