import 'package:battle_simulation/src/common/models/spell.dart';
import 'package:hive_ce/hive_ce.dart';

class SpellAdapter extends TypeAdapter<Spell> {
  @override
  final int typeId = 0;

  @override
  Spell read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Spell(
      name: fields[0] as String,
      element: fields[1] as String,
      cd: fields[2] as double,
      delay: fields[3] as double,
      dmg: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Spell obj) {
    writer.writeByte(5);
    writer.writeByte(0);
    writer.write(obj.name);
    writer.writeByte(1);
    writer.write(obj.element);
    writer.writeByte(2);
    writer.write(obj.cd);
    writer.writeByte(3);
    writer.write(obj.delay);
    writer.writeByte(4);
    writer.write(obj.dmg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpellAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
