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

List<Character> characters = [
  Character(
    name: "Character A",
    maxHP: 1000,
    currentHP: 100,
    armor: 1,
    luck: 2,
    mp: 3,
    speed: 60,
    image: "lib/assets/characters/character_a.png",
    inBattle: true,
    haste: 1,
  ),
  Character(
    name: "Character B",
    maxHP: 1000,
    currentHP: 500,
    armor: 5,
    luck: 6,
    mp: 7,
    speed: 70,
    image: "lib/assets/characters/character_b.png",
    inBattle: true,
    haste: 1,
  ),
  Character(
    name: "Character C",
    maxHP: 1000,
    currentHP: 700,
    armor: 9,
    luck: 1,
    mp: 2,
    speed: 50,
    image: "lib/assets/characters/character_c.png",
    inBattle: true,
    haste: 1,
  ),
  Character(
    name: "Character D",
    maxHP: 1200,
    currentHP: 1000,
    armor: 4,
    luck: 5,
    mp: 6,
    speed: 90,
    image: "lib/assets/characters/character_d.png",
    inBattle: true,
    haste: 1,
  ),
];
