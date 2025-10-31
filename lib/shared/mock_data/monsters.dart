class Monster {
  final int maxHP, armor, mp, speed, luck;
  final String name, image;

  Monster({
    required this.name,
    required this.maxHP,
    required this.armor,
    required this.mp,
    required this.luck,
    required this.speed,
    required this.image,
  });
}

List<Monster> monsters = [
  Monster(
    name: "Monster A",
    maxHP: 1000,
    armor: 1,
    luck: 2,
    mp: 3,
    speed: 4,
    image: "lib/assets/monster/blue/idle/frame-1.png",
  ),
  Monster(
    name: "Monster B",
    maxHP: 1000,
    armor: 5,
    luck: 6,
    mp: 7,
    speed: 8,
    image: "lib/assets/monster/green/idle/frame-1.png",
  ),
  Monster(
    name: "Monster C",
    maxHP: 1000,
    armor: 9,
    luck: 1,
    mp: 2,
    speed: 3,
    image: "lib/assets/monster/orange/idle/frame-1.png",
  ),
];
