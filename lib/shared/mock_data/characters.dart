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
    armor: 1,
    luck: 2,
    mp: 3,
    speed: 4,
    image: "lib/assets/characters/character_a.png",
  ),
  Character(
    name: "Character B",
    maxHP: 1000,
    currentHP: 500,
    armor: 5,
    luck: 6,
    mp: 7,
    speed: 8,
    image: "lib/assets/characters/character_b.png",
  ),
  Character(
    name: "Character C",
    maxHP: 1000,
    currentHP: 700,
    armor: 9,
    luck: 1,
    mp: 2,
    speed: 3,
    image: "lib/assets/characters/character_c.png",
  ),
  Character(
    name: "Character D",
    maxHP: 1200,
    currentHP: 1000,
    armor: 4,
    luck: 5,
    mp: 6,
    speed: 7,
    image: "lib/assets/characters/character_d.png",
  ),
];
