class Character {
  final int maxHP, currentHP, armor, mp, speed, luck;
  final String name, image;

  Character({
    required this.name,
    required this.maxHP,
    required this.currentHP,
    required this.armor,
    required this.mp,
    required this.luck,
    required this.speed,
    required this.image,
  });
}

List<Character> characters = [
  Character(
    name: "Character A",
    maxHP: 1000,
    currentHP: 100,
    armor: 10,
    luck: 10,
    mp: 10,
    speed: 10,
    image: "lib/assets/characters/character_a.png",
  ),
  Character(
    name: "Character B",
    maxHP: 1000,
    currentHP: 500,
    armor: 10,
    luck: 10,
    mp: 10,
    speed: 10,
    image: "lib/assets/characters/character_b.png",
  ),
  Character(
    name: "Character C",
    maxHP: 1000,
    currentHP: 700,
    armor: 10,
    luck: 34,
    mp: 10,
    speed: 10,
    image: "lib/assets/characters/character_c.png",
  ),
  Character(
    name: "Character D",
    maxHP: 1200,
    currentHP: 1000,
    armor: 10,
    luck: 10,
    mp: 10,
    speed: 10,
    image: "lib/assets/characters/character_d.png",
  ),
];
