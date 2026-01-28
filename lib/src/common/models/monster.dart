import 'package:battle_simulation/src/common/models/spell.dart';

class Monster {
  int maxHP;
  int currentHP;
  int armor;
  int mp;
  int speed;
  int luck;

  String name;
  String image;

  double haste;
  bool inBattle;
  final List<Spell> monsterSpells;

  Monster({
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
    required this.monsterSpells,
  });

  Monster copyWith({
    int? maxHP,
    int? currentHP,
    int? armor,
    int? mp,
    int? speed,
    int? luck,
    String? name,
    String? image,
    double? haste,
    bool? inBattle,
    List<Spell>? monsterSpells,
  }) {
    return Monster(
      name: name ?? this.name,
      maxHP: maxHP ?? this.maxHP,
      currentHP: currentHP ?? this.currentHP,
      armor: armor ?? this.armor,
      mp: mp ?? this.mp,
      luck: luck ?? this.luck,
      speed: speed ?? this.speed,
      image: image ?? this.image,
      inBattle: inBattle ?? this.inBattle,
      haste: haste ?? this.haste,
      monsterSpells: monsterSpells ?? List.of(this.monsterSpells),
    );
  }
}
