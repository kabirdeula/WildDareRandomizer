// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'played_rule_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayedRuleTracker {

@HiveField(0) String get deckId;@HiveField(1) Set<String> get playedRuleIds;@HiveField(2) DateTime get sessionStarted;@HiveField(3) DateTime get lastUpdated;
/// Create a copy of PlayedRuleTracker
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayedRuleTrackerCopyWith<PlayedRuleTracker> get copyWith => _$PlayedRuleTrackerCopyWithImpl<PlayedRuleTracker>(this as PlayedRuleTracker, _$identity);

  /// Serializes this PlayedRuleTracker to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayedRuleTracker&&(identical(other.deckId, deckId) || other.deckId == deckId)&&const DeepCollectionEquality().equals(other.playedRuleIds, playedRuleIds)&&(identical(other.sessionStarted, sessionStarted) || other.sessionStarted == sessionStarted)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deckId,const DeepCollectionEquality().hash(playedRuleIds),sessionStarted,lastUpdated);

@override
String toString() {
  return 'PlayedRuleTracker(deckId: $deckId, playedRuleIds: $playedRuleIds, sessionStarted: $sessionStarted, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $PlayedRuleTrackerCopyWith<$Res>  {
  factory $PlayedRuleTrackerCopyWith(PlayedRuleTracker value, $Res Function(PlayedRuleTracker) _then) = _$PlayedRuleTrackerCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String deckId,@HiveField(1) Set<String> playedRuleIds,@HiveField(2) DateTime sessionStarted,@HiveField(3) DateTime lastUpdated
});




}
/// @nodoc
class _$PlayedRuleTrackerCopyWithImpl<$Res>
    implements $PlayedRuleTrackerCopyWith<$Res> {
  _$PlayedRuleTrackerCopyWithImpl(this._self, this._then);

  final PlayedRuleTracker _self;
  final $Res Function(PlayedRuleTracker) _then;

/// Create a copy of PlayedRuleTracker
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deckId = null,Object? playedRuleIds = null,Object? sessionStarted = null,Object? lastUpdated = null,}) {
  return _then(_self.copyWith(
deckId: null == deckId ? _self.deckId : deckId // ignore: cast_nullable_to_non_nullable
as String,playedRuleIds: null == playedRuleIds ? _self.playedRuleIds : playedRuleIds // ignore: cast_nullable_to_non_nullable
as Set<String>,sessionStarted: null == sessionStarted ? _self.sessionStarted : sessionStarted // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayedRuleTracker].
extension PlayedRuleTrackerPatterns on PlayedRuleTracker {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayedRuleTracker value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayedRuleTracker() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayedRuleTracker value)  $default,){
final _that = this;
switch (_that) {
case _PlayedRuleTracker():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayedRuleTracker value)?  $default,){
final _that = this;
switch (_that) {
case _PlayedRuleTracker() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String deckId, @HiveField(1)  Set<String> playedRuleIds, @HiveField(2)  DateTime sessionStarted, @HiveField(3)  DateTime lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayedRuleTracker() when $default != null:
return $default(_that.deckId,_that.playedRuleIds,_that.sessionStarted,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String deckId, @HiveField(1)  Set<String> playedRuleIds, @HiveField(2)  DateTime sessionStarted, @HiveField(3)  DateTime lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _PlayedRuleTracker():
return $default(_that.deckId,_that.playedRuleIds,_that.sessionStarted,_that.lastUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String deckId, @HiveField(1)  Set<String> playedRuleIds, @HiveField(2)  DateTime sessionStarted, @HiveField(3)  DateTime lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _PlayedRuleTracker() when $default != null:
return $default(_that.deckId,_that.playedRuleIds,_that.sessionStarted,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayedRuleTracker implements PlayedRuleTracker {
  const _PlayedRuleTracker({@HiveField(0) required this.deckId, @HiveField(1) required final  Set<String> playedRuleIds, @HiveField(2) required this.sessionStarted, @HiveField(3) required this.lastUpdated}): _playedRuleIds = playedRuleIds;
  factory _PlayedRuleTracker.fromJson(Map<String, dynamic> json) => _$PlayedRuleTrackerFromJson(json);

@override@HiveField(0) final  String deckId;
 final  Set<String> _playedRuleIds;
@override@HiveField(1) Set<String> get playedRuleIds {
  if (_playedRuleIds is EqualUnmodifiableSetView) return _playedRuleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_playedRuleIds);
}

@override@HiveField(2) final  DateTime sessionStarted;
@override@HiveField(3) final  DateTime lastUpdated;

/// Create a copy of PlayedRuleTracker
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayedRuleTrackerCopyWith<_PlayedRuleTracker> get copyWith => __$PlayedRuleTrackerCopyWithImpl<_PlayedRuleTracker>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayedRuleTrackerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayedRuleTracker&&(identical(other.deckId, deckId) || other.deckId == deckId)&&const DeepCollectionEquality().equals(other._playedRuleIds, _playedRuleIds)&&(identical(other.sessionStarted, sessionStarted) || other.sessionStarted == sessionStarted)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deckId,const DeepCollectionEquality().hash(_playedRuleIds),sessionStarted,lastUpdated);

@override
String toString() {
  return 'PlayedRuleTracker(deckId: $deckId, playedRuleIds: $playedRuleIds, sessionStarted: $sessionStarted, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$PlayedRuleTrackerCopyWith<$Res> implements $PlayedRuleTrackerCopyWith<$Res> {
  factory _$PlayedRuleTrackerCopyWith(_PlayedRuleTracker value, $Res Function(_PlayedRuleTracker) _then) = __$PlayedRuleTrackerCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String deckId,@HiveField(1) Set<String> playedRuleIds,@HiveField(2) DateTime sessionStarted,@HiveField(3) DateTime lastUpdated
});




}
/// @nodoc
class __$PlayedRuleTrackerCopyWithImpl<$Res>
    implements _$PlayedRuleTrackerCopyWith<$Res> {
  __$PlayedRuleTrackerCopyWithImpl(this._self, this._then);

  final _PlayedRuleTracker _self;
  final $Res Function(_PlayedRuleTracker) _then;

/// Create a copy of PlayedRuleTracker
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deckId = null,Object? playedRuleIds = null,Object? sessionStarted = null,Object? lastUpdated = null,}) {
  return _then(_PlayedRuleTracker(
deckId: null == deckId ? _self.deckId : deckId // ignore: cast_nullable_to_non_nullable
as String,playedRuleIds: null == playedRuleIds ? _self._playedRuleIds : playedRuleIds // ignore: cast_nullable_to_non_nullable
as Set<String>,sessionStarted: null == sessionStarted ? _self.sessionStarted : sessionStarted // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
