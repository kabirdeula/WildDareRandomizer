// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RuleEntityAdapter extends TypeAdapter<RuleEntity> {
  @override
  final typeId = 0;

  @override
  RuleEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RuleEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      level: fields[3] as String,
      tags: fields[4] == null ? [] : (fields[4] as List).cast<String>(),
      flags: fields[5] == null ? [] : (fields[5] as List).cast<String>(),
      random: (fields[6] as Map?)?.cast<String, RandomValue>(),
      clarification: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RuleEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.level)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.flags)
      ..writeByte(6)
      ..write(obj.random)
      ..writeByte(7)
      ..write(obj.clarification);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RuleEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RandomValueAdapter extends TypeAdapter<RandomValue> {
  @override
  final typeId = 1;

  @override
  RandomValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomValue(
      type: fields[0] as String,
      min: (fields[1] as num).toInt(),
      max: (fields[2] as num).toInt(),
      reroll: fields[3] == null ? false : fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RandomValue obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.min)
      ..writeByte(2)
      ..write(obj.max)
      ..writeByte(3)
      ..write(obj.reroll);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RuleAssetFile _$RuleAssetFileFromJson(Map<String, dynamic> json) =>
    _RuleAssetFile(
      version: (json['version'] as num).toInt(),
      definitions: Map<String, String>.from(json['definitions'] as Map),
      rules: (json['rules'] as List<dynamic>)
          .map((e) => RuleEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RuleAssetFileToJson(_RuleAssetFile instance) =>
    <String, dynamic>{
      'version': instance.version,
      'definitions': instance.definitions,
      'rules': instance.rules,
    };

_RuleEntity _$RuleEntityFromJson(Map<String, dynamic> json) => _RuleEntity(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  level: json['level'] as String,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  flags:
      (json['flags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  random: (json['random'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, RandomValue.fromJson(e as Map<String, dynamic>)),
  ),
  clarification: json['clarification'] as String?,
);

Map<String, dynamic> _$RuleEntityToJson(_RuleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'level': instance.level,
      'tags': instance.tags,
      'flags': instance.flags,
      'random': instance.random,
      'clarification': instance.clarification,
    };

_RandomValue _$RandomValueFromJson(Map<String, dynamic> json) => _RandomValue(
  type: json['type'] as String,
  min: (json['min'] as num).toInt(),
  max: (json['max'] as num).toInt(),
  reroll: json['reroll'] as bool? ?? false,
);

Map<String, dynamic> _$RandomValueToJson(_RandomValue instance) =>
    <String, dynamic>{
      'type': instance.type,
      'min': instance.min,
      'max': instance.max,
      'reroll': instance.reroll,
    };
