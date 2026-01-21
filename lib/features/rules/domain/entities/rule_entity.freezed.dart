// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rule_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RuleAssetFile {

 int get version; Map<String, String> get definitions; List<RuleEntity> get rules;
/// Create a copy of RuleAssetFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleAssetFileCopyWith<RuleAssetFile> get copyWith => _$RuleAssetFileCopyWithImpl<RuleAssetFile>(this as RuleAssetFile, _$identity);

  /// Serializes this RuleAssetFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleAssetFile&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other.definitions, definitions)&&const DeepCollectionEquality().equals(other.rules, rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(definitions),const DeepCollectionEquality().hash(rules));

@override
String toString() {
  return 'RuleAssetFile(version: $version, definitions: $definitions, rules: $rules)';
}


}

/// @nodoc
abstract mixin class $RuleAssetFileCopyWith<$Res>  {
  factory $RuleAssetFileCopyWith(RuleAssetFile value, $Res Function(RuleAssetFile) _then) = _$RuleAssetFileCopyWithImpl;
@useResult
$Res call({
 int version, Map<String, String> definitions, List<RuleEntity> rules
});




}
/// @nodoc
class _$RuleAssetFileCopyWithImpl<$Res>
    implements $RuleAssetFileCopyWith<$Res> {
  _$RuleAssetFileCopyWithImpl(this._self, this._then);

  final RuleAssetFile _self;
  final $Res Function(RuleAssetFile) _then;

/// Create a copy of RuleAssetFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,Object? definitions = null,Object? rules = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,definitions: null == definitions ? _self.definitions : definitions // ignore: cast_nullable_to_non_nullable
as Map<String, String>,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as List<RuleEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleAssetFile].
extension RuleAssetFilePatterns on RuleAssetFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleAssetFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleAssetFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleAssetFile value)  $default,){
final _that = this;
switch (_that) {
case _RuleAssetFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleAssetFile value)?  $default,){
final _that = this;
switch (_that) {
case _RuleAssetFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int version,  Map<String, String> definitions,  List<RuleEntity> rules)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleAssetFile() when $default != null:
return $default(_that.version,_that.definitions,_that.rules);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int version,  Map<String, String> definitions,  List<RuleEntity> rules)  $default,) {final _that = this;
switch (_that) {
case _RuleAssetFile():
return $default(_that.version,_that.definitions,_that.rules);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int version,  Map<String, String> definitions,  List<RuleEntity> rules)?  $default,) {final _that = this;
switch (_that) {
case _RuleAssetFile() when $default != null:
return $default(_that.version,_that.definitions,_that.rules);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleAssetFile implements RuleAssetFile {
  const _RuleAssetFile({required this.version, required final  Map<String, String> definitions, required final  List<RuleEntity> rules}): _definitions = definitions,_rules = rules;
  factory _RuleAssetFile.fromJson(Map<String, dynamic> json) => _$RuleAssetFileFromJson(json);

@override final  int version;
 final  Map<String, String> _definitions;
@override Map<String, String> get definitions {
  if (_definitions is EqualUnmodifiableMapView) return _definitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_definitions);
}

 final  List<RuleEntity> _rules;
@override List<RuleEntity> get rules {
  if (_rules is EqualUnmodifiableListView) return _rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rules);
}


/// Create a copy of RuleAssetFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleAssetFileCopyWith<_RuleAssetFile> get copyWith => __$RuleAssetFileCopyWithImpl<_RuleAssetFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleAssetFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleAssetFile&&(identical(other.version, version) || other.version == version)&&const DeepCollectionEquality().equals(other._definitions, _definitions)&&const DeepCollectionEquality().equals(other._rules, _rules));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,const DeepCollectionEquality().hash(_definitions),const DeepCollectionEquality().hash(_rules));

@override
String toString() {
  return 'RuleAssetFile(version: $version, definitions: $definitions, rules: $rules)';
}


}

/// @nodoc
abstract mixin class _$RuleAssetFileCopyWith<$Res> implements $RuleAssetFileCopyWith<$Res> {
  factory _$RuleAssetFileCopyWith(_RuleAssetFile value, $Res Function(_RuleAssetFile) _then) = __$RuleAssetFileCopyWithImpl;
@override @useResult
$Res call({
 int version, Map<String, String> definitions, List<RuleEntity> rules
});




}
/// @nodoc
class __$RuleAssetFileCopyWithImpl<$Res>
    implements _$RuleAssetFileCopyWith<$Res> {
  __$RuleAssetFileCopyWithImpl(this._self, this._then);

  final _RuleAssetFile _self;
  final $Res Function(_RuleAssetFile) _then;

/// Create a copy of RuleAssetFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,Object? definitions = null,Object? rules = null,}) {
  return _then(_RuleAssetFile(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,definitions: null == definitions ? _self._definitions : definitions // ignore: cast_nullable_to_non_nullable
as Map<String, String>,rules: null == rules ? _self._rules : rules // ignore: cast_nullable_to_non_nullable
as List<RuleEntity>,
  ));
}


}


/// @nodoc
mixin _$RuleEntity {

@HiveField(0) String get id;@HiveField(1) String get title;@HiveField(2) String get description;@HiveField(3) String get level;@HiveField(4) List<String> get tags;@HiveField(5) List<String> get flags;@HiveField(6) Map<String, RandomValue>? get random;@HiveField(7) String? get clarification;
/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RuleEntityCopyWith<RuleEntity> get copyWith => _$RuleEntityCopyWithImpl<RuleEntity>(this as RuleEntity, _$identity);

  /// Serializes this RuleEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.flags, flags)&&const DeepCollectionEquality().equals(other.random, random)&&(identical(other.clarification, clarification) || other.clarification == clarification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,level,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(flags),const DeepCollectionEquality().hash(random),clarification);

@override
String toString() {
  return 'RuleEntity(id: $id, title: $title, description: $description, level: $level, tags: $tags, flags: $flags, random: $random, clarification: $clarification)';
}


}

/// @nodoc
abstract mixin class $RuleEntityCopyWith<$Res>  {
  factory $RuleEntityCopyWith(RuleEntity value, $Res Function(RuleEntity) _then) = _$RuleEntityCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) String level,@HiveField(4) List<String> tags,@HiveField(5) List<String> flags,@HiveField(6) Map<String, RandomValue>? random,@HiveField(7) String? clarification
});




}
/// @nodoc
class _$RuleEntityCopyWithImpl<$Res>
    implements $RuleEntityCopyWith<$Res> {
  _$RuleEntityCopyWithImpl(this._self, this._then);

  final RuleEntity _self;
  final $Res Function(RuleEntity) _then;

/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? level = null,Object? tags = null,Object? flags = null,Object? random = freezed,Object? clarification = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,flags: null == flags ? _self.flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,random: freezed == random ? _self.random : random // ignore: cast_nullable_to_non_nullable
as Map<String, RandomValue>?,clarification: freezed == clarification ? _self.clarification : clarification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RuleEntity].
extension RuleEntityPatterns on RuleEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RuleEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RuleEntity value)  $default,){
final _that = this;
switch (_that) {
case _RuleEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RuleEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  String level, @HiveField(4)  List<String> tags, @HiveField(5)  List<String> flags, @HiveField(6)  Map<String, RandomValue>? random, @HiveField(7)  String? clarification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.level,_that.tags,_that.flags,_that.random,_that.clarification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  String level, @HiveField(4)  List<String> tags, @HiveField(5)  List<String> flags, @HiveField(6)  Map<String, RandomValue>? random, @HiveField(7)  String? clarification)  $default,) {final _that = this;
switch (_that) {
case _RuleEntity():
return $default(_that.id,_that.title,_that.description,_that.level,_that.tags,_that.flags,_that.random,_that.clarification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String id, @HiveField(1)  String title, @HiveField(2)  String description, @HiveField(3)  String level, @HiveField(4)  List<String> tags, @HiveField(5)  List<String> flags, @HiveField(6)  Map<String, RandomValue>? random, @HiveField(7)  String? clarification)?  $default,) {final _that = this;
switch (_that) {
case _RuleEntity() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.level,_that.tags,_that.flags,_that.random,_that.clarification);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RuleEntity implements RuleEntity {
  const _RuleEntity({@HiveField(0) required this.id, @HiveField(1) required this.title, @HiveField(2) required this.description, @HiveField(3) required this.level, @HiveField(4) final  List<String> tags = const [], @HiveField(5) final  List<String> flags = const [], @HiveField(6) final  Map<String, RandomValue>? random, @HiveField(7) this.clarification}): _tags = tags,_flags = flags,_random = random;
  factory _RuleEntity.fromJson(Map<String, dynamic> json) => _$RuleEntityFromJson(json);

@override@HiveField(0) final  String id;
@override@HiveField(1) final  String title;
@override@HiveField(2) final  String description;
@override@HiveField(3) final  String level;
 final  List<String> _tags;
@override@JsonKey()@HiveField(4) List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _flags;
@override@JsonKey()@HiveField(5) List<String> get flags {
  if (_flags is EqualUnmodifiableListView) return _flags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flags);
}

 final  Map<String, RandomValue>? _random;
@override@HiveField(6) Map<String, RandomValue>? get random {
  final value = _random;
  if (value == null) return null;
  if (_random is EqualUnmodifiableMapView) return _random;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@HiveField(7) final  String? clarification;

/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RuleEntityCopyWith<_RuleEntity> get copyWith => __$RuleEntityCopyWithImpl<_RuleEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RuleEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RuleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._flags, _flags)&&const DeepCollectionEquality().equals(other._random, _random)&&(identical(other.clarification, clarification) || other.clarification == clarification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,level,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_flags),const DeepCollectionEquality().hash(_random),clarification);

@override
String toString() {
  return 'RuleEntity(id: $id, title: $title, description: $description, level: $level, tags: $tags, flags: $flags, random: $random, clarification: $clarification)';
}


}

/// @nodoc
abstract mixin class _$RuleEntityCopyWith<$Res> implements $RuleEntityCopyWith<$Res> {
  factory _$RuleEntityCopyWith(_RuleEntity value, $Res Function(_RuleEntity) _then) = __$RuleEntityCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String id,@HiveField(1) String title,@HiveField(2) String description,@HiveField(3) String level,@HiveField(4) List<String> tags,@HiveField(5) List<String> flags,@HiveField(6) Map<String, RandomValue>? random,@HiveField(7) String? clarification
});




}
/// @nodoc
class __$RuleEntityCopyWithImpl<$Res>
    implements _$RuleEntityCopyWith<$Res> {
  __$RuleEntityCopyWithImpl(this._self, this._then);

  final _RuleEntity _self;
  final $Res Function(_RuleEntity) _then;

/// Create a copy of RuleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? level = null,Object? tags = null,Object? flags = null,Object? random = freezed,Object? clarification = freezed,}) {
  return _then(_RuleEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,flags: null == flags ? _self._flags : flags // ignore: cast_nullable_to_non_nullable
as List<String>,random: freezed == random ? _self._random : random // ignore: cast_nullable_to_non_nullable
as Map<String, RandomValue>?,clarification: freezed == clarification ? _self.clarification : clarification // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RandomValue {

@HiveField(0) String get type;@HiveField(1) int? get min;@HiveField(2) int? get max;@HiveField(3) bool get reroll;@HiveField(4) List<String>? get choices;
/// Create a copy of RandomValue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomValueCopyWith<RandomValue> get copyWith => _$RandomValueCopyWithImpl<RandomValue>(this as RandomValue, _$identity);

  /// Serializes this RandomValue to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomValue&&(identical(other.type, type) || other.type == type)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.reroll, reroll) || other.reroll == reroll)&&const DeepCollectionEquality().equals(other.choices, choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,min,max,reroll,const DeepCollectionEquality().hash(choices));

@override
String toString() {
  return 'RandomValue(type: $type, min: $min, max: $max, reroll: $reroll, choices: $choices)';
}


}

/// @nodoc
abstract mixin class $RandomValueCopyWith<$Res>  {
  factory $RandomValueCopyWith(RandomValue value, $Res Function(RandomValue) _then) = _$RandomValueCopyWithImpl;
@useResult
$Res call({
@HiveField(0) String type,@HiveField(1) int? min,@HiveField(2) int? max,@HiveField(3) bool reroll,@HiveField(4) List<String>? choices
});




}
/// @nodoc
class _$RandomValueCopyWithImpl<$Res>
    implements $RandomValueCopyWith<$Res> {
  _$RandomValueCopyWithImpl(this._self, this._then);

  final RandomValue _self;
  final $Res Function(RandomValue) _then;

/// Create a copy of RandomValue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? min = freezed,Object? max = freezed,Object? reroll = null,Object? choices = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,reroll: null == reroll ? _self.reroll : reroll // ignore: cast_nullable_to_non_nullable
as bool,choices: freezed == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RandomValue].
extension RandomValuePatterns on RandomValue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RandomValue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RandomValue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RandomValue value)  $default,){
final _that = this;
switch (_that) {
case _RandomValue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RandomValue value)?  $default,){
final _that = this;
switch (_that) {
case _RandomValue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@HiveField(0)  String type, @HiveField(1)  int? min, @HiveField(2)  int? max, @HiveField(3)  bool reroll, @HiveField(4)  List<String>? choices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RandomValue() when $default != null:
return $default(_that.type,_that.min,_that.max,_that.reroll,_that.choices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@HiveField(0)  String type, @HiveField(1)  int? min, @HiveField(2)  int? max, @HiveField(3)  bool reroll, @HiveField(4)  List<String>? choices)  $default,) {final _that = this;
switch (_that) {
case _RandomValue():
return $default(_that.type,_that.min,_that.max,_that.reroll,_that.choices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@HiveField(0)  String type, @HiveField(1)  int? min, @HiveField(2)  int? max, @HiveField(3)  bool reroll, @HiveField(4)  List<String>? choices)?  $default,) {final _that = this;
switch (_that) {
case _RandomValue() when $default != null:
return $default(_that.type,_that.min,_that.max,_that.reroll,_that.choices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RandomValue implements RandomValue {
  const _RandomValue({@HiveField(0) required this.type, @HiveField(1) this.min, @HiveField(2) this.max, @HiveField(3) this.reroll = false, @HiveField(4) final  List<String>? choices}): _choices = choices;
  factory _RandomValue.fromJson(Map<String, dynamic> json) => _$RandomValueFromJson(json);

@override@HiveField(0) final  String type;
@override@HiveField(1) final  int? min;
@override@HiveField(2) final  int? max;
@override@JsonKey()@HiveField(3) final  bool reroll;
 final  List<String>? _choices;
@override@HiveField(4) List<String>? get choices {
  final value = _choices;
  if (value == null) return null;
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RandomValue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomValueCopyWith<_RandomValue> get copyWith => __$RandomValueCopyWithImpl<_RandomValue>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RandomValueToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomValue&&(identical(other.type, type) || other.type == type)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.reroll, reroll) || other.reroll == reroll)&&const DeepCollectionEquality().equals(other._choices, _choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,min,max,reroll,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'RandomValue(type: $type, min: $min, max: $max, reroll: $reroll, choices: $choices)';
}


}

/// @nodoc
abstract mixin class _$RandomValueCopyWith<$Res> implements $RandomValueCopyWith<$Res> {
  factory _$RandomValueCopyWith(_RandomValue value, $Res Function(_RandomValue) _then) = __$RandomValueCopyWithImpl;
@override @useResult
$Res call({
@HiveField(0) String type,@HiveField(1) int? min,@HiveField(2) int? max,@HiveField(3) bool reroll,@HiveField(4) List<String>? choices
});




}
/// @nodoc
class __$RandomValueCopyWithImpl<$Res>
    implements _$RandomValueCopyWith<$Res> {
  __$RandomValueCopyWithImpl(this._self, this._then);

  final _RandomValue _self;
  final $Res Function(_RandomValue) _then;

/// Create a copy of RandomValue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? min = freezed,Object? max = freezed,Object? reroll = null,Object? choices = freezed,}) {
  return _then(_RandomValue(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,reroll: null == reroll ? _self.reroll : reroll // ignore: cast_nullable_to_non_nullable
as bool,choices: freezed == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
