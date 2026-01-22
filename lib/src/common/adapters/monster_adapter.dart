import 'package:battle_simulation/src/common/models/monster.dart';
import 'package:hive_ce/hive_ce.dart';

class MonsterAdapter extends TypeAdapter<Monster> {
  @override
  final int typeId = 1;

  @override
  Monster read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Monster(
      name: fields[0] as String,
      maxHP: fields[1] as int,
      currentHP: fields[2] as int,
      armor: fields[3] as int,
      mp: fields[4] as int,
      luck: fields[5] as int,
      speed: fields[6] as int,
      image: fields[7] as String,
      inBattle: fields[8] as bool,
      haste: fields[9] as double? ?? 1.0,
    );
  }

  @override
  void write(BinaryWriter writer, Monster obj) {
    writer.writeByte(10);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.maxHP);
    writer.writeByte(2);
    writer.write(obj.currentHP);
    writer.writeByte(3);
    writer.write(obj.armor);
    writer.writeByte(4);
    writer.write(obj.mp);
    writer.writeByte(5);
    writer.write(obj.luck);
    writer.writeByte(6);
    writer.write(obj.speed);
    writer.writeByte(7);
    writer.write(obj.image);
    writer.writeByte(8);
    writer.write(obj.inBattle);
    writer.writeByte(9);
    writer.write(obj.haste);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonsterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
