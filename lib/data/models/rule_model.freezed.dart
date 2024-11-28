// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RuleModel _$RuleModelFromJson(Map<String, dynamic> json) {
  return _RuleModel.fromJson(json);
}

/// @nodoc
mixin _$RuleModel {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RuleModelCopyWith<RuleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RuleModelCopyWith<$Res> {
  factory $RuleModelCopyWith(RuleModel value, $Res Function(RuleModel) then) =
      _$RuleModelCopyWithImpl<$Res, RuleModel>;
  @useResult
  $Res call({String title, String description, String level});
}

/// @nodoc
class _$RuleModelCopyWithImpl<$Res, $Val extends RuleModel>
    implements $RuleModelCopyWith<$Res> {
  _$RuleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RuleModelImplCopyWith<$Res>
    implements $RuleModelCopyWith<$Res> {
  factory _$$RuleModelImplCopyWith(
          _$RuleModelImpl value, $Res Function(_$RuleModelImpl) then) =
      __$$RuleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String level});
}

/// @nodoc
class __$$RuleModelImplCopyWithImpl<$Res>
    extends _$RuleModelCopyWithImpl<$Res, _$RuleModelImpl>
    implements _$$RuleModelImplCopyWith<$Res> {
  __$$RuleModelImplCopyWithImpl(
      _$RuleModelImpl _value, $Res Function(_$RuleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? level = null,
  }) {
    return _then(_$RuleModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RuleModelImpl implements _RuleModel {
  const _$RuleModelImpl(
      {required this.title, required this.description, required this.level});

  factory _$RuleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RuleModelImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String level;

  @override
  String toString() {
    return 'RuleModel(title: $title, description: $description, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RuleModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RuleModelImplCopyWith<_$RuleModelImpl> get copyWith =>
      __$$RuleModelImplCopyWithImpl<_$RuleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RuleModelImplToJson(
      this,
    );
  }
}

abstract class _RuleModel implements RuleModel {
  const factory _RuleModel(
      {required final String title,
      required final String description,
      required final String level}) = _$RuleModelImpl;

  factory _RuleModel.fromJson(Map<String, dynamic> json) =
      _$RuleModelImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get level;
  @override
  @JsonKey(ignore: true)
  _$$RuleModelImplCopyWith<_$RuleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
