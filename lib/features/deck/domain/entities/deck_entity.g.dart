// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeckEntityAdapter extends TypeAdapter<DeckEntity> {
  @override
  final typeId = 2;

  @override
  DeckEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeckEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      ruleIds: (fields[2] as List).cast<String>(),
      shuffleSeed: (fields[3] as num).toInt(),
      createdAt: fields[4] as DateTime,
      updatedAt: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, DeckEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ruleIds)
      ..writeByte(3)
      ..write(obj.shuffleSeed)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeckEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeckEntity _$DeckEntityFromJson(Map<String, dynamic> json) => _DeckEntity(
  id: json['id'] as String,
  name: json['name'] as String,
  ruleIds: (json['ruleIds'] as List<dynamic>).map((e) => e as String).toList(),
  shuffleSeed: (json['shuffleSeed'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$DeckEntityToJson(_DeckEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ruleIds': instance.ruleIds,
      'shuffleSeed': instance.shuffleSeed,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
