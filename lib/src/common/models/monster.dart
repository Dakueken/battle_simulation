class Monster {
  final int maxHP, armor, mp, speed, luck;
  final String name, image;
  final bool inBattle;
  final double haste;

  Monster({
    required this.name,
    required this.maxHP,
    required this.armor,
    required this.mp,
    required this.luck,
    required this.speed,
    required this.image,
    required this.inBattle,
    this.haste = 1,
  });
}
