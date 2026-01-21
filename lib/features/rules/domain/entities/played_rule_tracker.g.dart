// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'played_rule_tracker.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayedRuleTrackerAdapter extends TypeAdapter<PlayedRuleTracker> {
  @override
  final typeId = 3;

  @override
  PlayedRuleTracker read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayedRuleTracker(
      deckId: fields[0] as String,
      playedRuleIds: (fields[1] as Set).cast<String>(),
      sessionStarted: fields[2] as DateTime,
      lastUpdated: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, PlayedRuleTracker obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.deckId)
      ..writeByte(1)
      ..write(obj.playedRuleIds)
      ..writeByte(2)
      ..write(obj.sessionStarted)
      ..writeByte(3)
      ..write(obj.lastUpdated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayedRuleTrackerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayedRuleTracker _$PlayedRuleTrackerFromJson(Map<String, dynamic> json) =>
    _PlayedRuleTracker(
      deckId: json['deckId'] as String,
      playedRuleIds: (json['playedRuleIds'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      sessionStarted: DateTime.parse(json['sessionStarted'] as String),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$PlayedRuleTrackerToJson(_PlayedRuleTracker instance) =>
    <String, dynamic>{
      'deckId': instance.deckId,
      'playedRuleIds': instance.playedRuleIds.toList(),
      'sessionStarted': instance.sessionStarted.toIso8601String(),
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };
