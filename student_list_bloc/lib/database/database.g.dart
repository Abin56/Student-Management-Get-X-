// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DBStudentListAdapter extends TypeAdapter<DBStudentList> {
  @override
  final int typeId = 1;

  @override
  DBStudentList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DBStudentList(
      name: fields[0] as String,
      batch: fields[1] as String,
      domain: fields[2] as String,
      mobilenumber: fields[3] as String,
      image: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DBStudentList obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.batch)
      ..writeByte(2)
      ..write(obj.domain)
      ..writeByte(3)
      ..write(obj.mobilenumber)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DBStudentListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
