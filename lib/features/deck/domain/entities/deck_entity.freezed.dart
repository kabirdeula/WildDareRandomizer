// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeckEntity {

@HiveField(0) String get id;@HiveField(1) String get name;@HiveField(2) List<String> get ruleIds;@HiveField(3) int get shuffleSeed;@HiveField(4) DateTime get createdAt;@HiveField(5) DateTime get updatedAt;
/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckEntityCopyWith<DeckEntity> get copyWith => _$DeckEntityCopyWithImpl<DeckEntity>(this as DeckEntity, _$identity);

  /// Serializes this DeckEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.ruleIds, ruleIds)&&(identical(other.shuffleSeed, shuffleSeed) || other.shuffleSeed == shuffleSeed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(ruleIds),shuffleSeed,createdAt,updatedAt);

@override
String toString() {
  return 'DeckEntity(id: $id, name: $name, ruleIds: $ruleIds, shuffleSeed: $shuffleSeed, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DeckEntityCopyWith<$Res>  {
  factory $DeckEntityCopyWith(DeckEntity value, $Res Function(DeckEntity) _then) = _$DeckEntityCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String name,@HiveField(2) List<String> ruleIds,@HiveField(3) int shuffleSeed,@HiveField(4) DateTime createdAt,@HiveField(5) DateTime updatedAt
});




}
/// @nodoc
class _$DeckEntityCopyWithImpl<$Res>
    implements $DeckEntityCopyWith<$Res> {
  _$DeckEntityCopyWithImpl(this._self, this._then);

  final DeckEntity _self;
  final $Res Function(DeckEntity) _then;

/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ruleIds = null,Object? shuffleSeed = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ruleIds: null == ruleIds ? _self.ruleIds : ruleIds // ignore: cast_nullable_to_non_nullable
as List<String>,shuffleSeed: null == shuffleSeed ? _self.shuffleSeed : shuffleSeed // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DeckEntity].
extension DeckEntityPatterns on DeckEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeckEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeckEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeckEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeckEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeckEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeckEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String name, @HiveField(2)  List<String> ruleIds, @HiveField(3)  int shuffleSeed, @HiveField(4)  DateTime createdAt, @HiveField(5)  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeckEntity() when $default != null:
return $default(_that.id,_that.name,_that.ruleIds,_that.shuffleSeed,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String name, @HiveField(2)  List<String> ruleIds, @HiveField(3)  int shuffleSeed, @HiveField(4)  DateTime createdAt, @HiveField(5)  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeckEntity():
return $default(_that.id,_that.name,_that.ruleIds,_that.shuffleSeed,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String name, @HiveField(2)  List<String> ruleIds, @HiveField(3)  int shuffleSeed, @HiveField(4)  DateTime createdAt, @HiveField(5)  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeckEntity() when $default != null:
return $default(_that.id,_that.name,_that.ruleIds,_that.shuffleSeed,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeckEntity implements DeckEntity {
  const _DeckEntity({@HiveField(0) required this.id, @HiveField(1) required this.name, @HiveField(2) required final  List<String> ruleIds, @HiveField(3) required this.shuffleSeed, @HiveField(4) required this.createdAt, @HiveField(5) required this.updatedAt}): _ruleIds = ruleIds;
  factory _DeckEntity.fromJson(Map<String, dynamic> json) => _$DeckEntityFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String name;
 final  List<String> _ruleIds;
@override@HiveField(2) List<String> get ruleIds {
  if (_ruleIds is EqualUnmodifiableListView) return _ruleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ruleIds);
}

@override@HiveField(3) final  int shuffleSeed;
@override@HiveField(4) final  DateTime createdAt;
@override@HiveField(5) final  DateTime updatedAt;

/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeckEntityCopyWith<_DeckEntity> get copyWith => __$DeckEntityCopyWithImpl<_DeckEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeckEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeckEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._ruleIds, _ruleIds)&&(identical(other.shuffleSeed, shuffleSeed) || other.shuffleSeed == shuffleSeed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,const DeepCollectionEquality().hash(_ruleIds),shuffleSeed,createdAt,updatedAt);

@override
String toString() {
  return 'DeckEntity(id: $id, name: $name, ruleIds: $ruleIds, shuffleSeed: $shuffleSeed, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeckEntityCopyWith<$Res> implements $DeckEntityCopyWith<$Res> {
  factory _$DeckEntityCopyWith(_DeckEntity value, $Res Function(_DeckEntity) _then) = __$DeckEntityCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String name,@HiveField(2) List<String> ruleIds,@HiveField(3) int shuffleSeed,@HiveField(4) DateTime createdAt,@HiveField(5) DateTime updatedAt
});




}
/// @nodoc
class __$DeckEntityCopyWithImpl<$Res>
    implements _$DeckEntityCopyWith<$Res> {
  __$DeckEntityCopyWithImpl(this._self, this._then);

  final _DeckEntity _self;
  final $Res Function(_DeckEntity) _then;

/// Create a copy of DeckEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ruleIds = null,Object? shuffleSeed = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DeckEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ruleIds: null == ruleIds ? _self._ruleIds : ruleIds // ignore: cast_nullable_to_non_nullable
as List<String>,shuffleSeed: null == shuffleSeed ? _self.shuffleSeed : shuffleSeed // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
