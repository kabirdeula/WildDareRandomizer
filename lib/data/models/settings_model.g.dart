// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsModelImpl _$$SettingsModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingsModelImpl(
      isDarkMode: json['isDarkMode'] as bool? ?? false,
      isGridView: json['isGridView'] as bool? ?? true,
    );

Map<String, dynamic> _$$SettingsModelImplToJson(_$SettingsModelImpl instance) =>
    <String, dynamic>{
      'isDarkMode': instance.isDarkMode,
      'isGridView': instance.isGridView,
    };
