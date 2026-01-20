// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DeckState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeckState()';
}


}

/// @nodoc
class $DeckStateCopyWith<$Res>  {
$DeckStateCopyWith(DeckState _, $Res Function(DeckState) __);
}


/// Adds pattern-matching-related methods to [DeckState].
extension DeckStatePatterns on DeckState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DeckLoading value)?  loading,TResult Function( DeckLoaded value)?  loaded,TResult Function( DeckFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DeckLoading() when loading != null:
return loading(_that);case DeckLoaded() when loaded != null:
return loaded(_that);case DeckFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DeckLoading value)  loading,required TResult Function( DeckLoaded value)  loaded,required TResult Function( DeckFailure value)  failure,}){
final _that = this;
switch (_that) {
case DeckLoading():
return loading(_that);case DeckLoaded():
return loaded(_that);case DeckFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DeckLoading value)?  loading,TResult? Function( DeckLoaded value)?  loaded,TResult? Function( DeckFailure value)?  failure,}){
final _that = this;
switch (_that) {
case DeckLoading() when loading != null:
return loading(_that);case DeckLoaded() when loaded != null:
return loaded(_that);case DeckFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<RuleEntity> allRules,  List<DeckEntity> decks,  DeckEntity currentDeck,  List<RuleEntity> displayedRules,  Set<String> playedRuleIds,  DateTime sessionStarted)?  loaded,TResult Function( Object error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DeckLoading() when loading != null:
return loading();case DeckLoaded() when loaded != null:
return loaded(_that.allRules,_that.decks,_that.currentDeck,_that.displayedRules,_that.playedRuleIds,_that.sessionStarted);case DeckFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<RuleEntity> allRules,  List<DeckEntity> decks,  DeckEntity currentDeck,  List<RuleEntity> displayedRules,  Set<String> playedRuleIds,  DateTime sessionStarted)  loaded,required TResult Function( Object error)  failure,}) {final _that = this;
switch (_that) {
case DeckLoading():
return loading();case DeckLoaded():
return loaded(_that.allRules,_that.decks,_that.currentDeck,_that.displayedRules,_that.playedRuleIds,_that.sessionStarted);case DeckFailure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<RuleEntity> allRules,  List<DeckEntity> decks,  DeckEntity currentDeck,  List<RuleEntity> displayedRules,  Set<String> playedRuleIds,  DateTime sessionStarted)?  loaded,TResult? Function( Object error)?  failure,}) {final _that = this;
switch (_that) {
case DeckLoading() when loading != null:
return loading();case DeckLoaded() when loaded != null:
return loaded(_that.allRules,_that.decks,_that.currentDeck,_that.displayedRules,_that.playedRuleIds,_that.sessionStarted);case DeckFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class DeckLoading implements DeckState {
  const DeckLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DeckState.loading()';
}


}




/// @nodoc


class DeckLoaded implements DeckState {
  const DeckLoaded({required final  List<RuleEntity> allRules, required final  List<DeckEntity> decks, required this.currentDeck, required final  List<RuleEntity> displayedRules, required final  Set<String> playedRuleIds, required this.sessionStarted}): _allRules = allRules,_decks = decks,_displayedRules = displayedRules,_playedRuleIds = playedRuleIds;
  

 final  List<RuleEntity> _allRules;
 List<RuleEntity> get allRules {
  if (_allRules is EqualUnmodifiableListView) return _allRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allRules);
}

 final  List<DeckEntity> _decks;
 List<DeckEntity> get decks {
  if (_decks is EqualUnmodifiableListView) return _decks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_decks);
}

 final  DeckEntity currentDeck;
 final  List<RuleEntity> _displayedRules;
 List<RuleEntity> get displayedRules {
  if (_displayedRules is EqualUnmodifiableListView) return _displayedRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_displayedRules);
}

 final  Set<String> _playedRuleIds;
 Set<String> get playedRuleIds {
  if (_playedRuleIds is EqualUnmodifiableSetView) return _playedRuleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_playedRuleIds);
}

 final  DateTime sessionStarted;

/// Create a copy of DeckState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckLoadedCopyWith<DeckLoaded> get copyWith => _$DeckLoadedCopyWithImpl<DeckLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckLoaded&&const DeepCollectionEquality().equals(other._allRules, _allRules)&&const DeepCollectionEquality().equals(other._decks, _decks)&&(identical(other.currentDeck, currentDeck) || other.currentDeck == currentDeck)&&const DeepCollectionEquality().equals(other._displayedRules, _displayedRules)&&const DeepCollectionEquality().equals(other._playedRuleIds, _playedRuleIds)&&(identical(other.sessionStarted, sessionStarted) || other.sessionStarted == sessionStarted));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allRules),const DeepCollectionEquality().hash(_decks),currentDeck,const DeepCollectionEquality().hash(_displayedRules),const DeepCollectionEquality().hash(_playedRuleIds),sessionStarted);

@override
String toString() {
  return 'DeckState.loaded(allRules: $allRules, decks: $decks, currentDeck: $currentDeck, displayedRules: $displayedRules, playedRuleIds: $playedRuleIds, sessionStarted: $sessionStarted)';
}


}

/// @nodoc
abstract mixin class $DeckLoadedCopyWith<$Res> implements $DeckStateCopyWith<$Res> {
  factory $DeckLoadedCopyWith(DeckLoaded value, $Res Function(DeckLoaded) _then) = _$DeckLoadedCopyWithImpl;
@useResult
$Res call({
 List<RuleEntity> allRules, List<DeckEntity> decks, DeckEntity currentDeck, List<RuleEntity> displayedRules, Set<String> playedRuleIds, DateTime sessionStarted
});


$DeckEntityCopyWith<$Res> get currentDeck;

}
/// @nodoc
class _$DeckLoadedCopyWithImpl<$Res>
    implements $DeckLoadedCopyWith<$Res> {
  _$DeckLoadedCopyWithImpl(this._self, this._then);

  final DeckLoaded _self;
  final $Res Function(DeckLoaded) _then;

/// Create a copy of DeckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allRules = null,Object? decks = null,Object? currentDeck = null,Object? displayedRules = null,Object? playedRuleIds = null,Object? sessionStarted = null,}) {
  return _then(DeckLoaded(
allRules: null == allRules ? _self._allRules : allRules // ignore: cast_nullable_to_non_nullable
as List<RuleEntity>,decks: null == decks ? _self._decks : decks // ignore: cast_nullable_to_non_nullable
as List<DeckEntity>,currentDeck: null == currentDeck ? _self.currentDeck : currentDeck // ignore: cast_nullable_to_non_nullable
as DeckEntity,displayedRules: null == displayedRules ? _self._displayedRules : displayedRules // ignore: cast_nullable_to_non_nullable
as List<RuleEntity>,playedRuleIds: null == playedRuleIds ? _self._playedRuleIds : playedRuleIds // ignore: cast_nullable_to_non_nullable
as Set<String>,sessionStarted: null == sessionStarted ? _self.sessionStarted : sessionStarted // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DeckState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeckEntityCopyWith<$Res> get currentDeck {
  
  return $DeckEntityCopyWith<$Res>(_self.currentDeck, (value) {
    return _then(_self.copyWith(currentDeck: value));
  });
}
}

/// @nodoc


class DeckFailure implements DeckState {
  const DeckFailure({required this.error});
  

 final  Object error;

/// Create a copy of DeckState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeckFailureCopyWith<DeckFailure> get copyWith => _$DeckFailureCopyWithImpl<DeckFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeckFailure&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'DeckState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $DeckFailureCopyWith<$Res> implements $DeckStateCopyWith<$Res> {
  factory $DeckFailureCopyWith(DeckFailure value, $Res Function(DeckFailure) _then) = _$DeckFailureCopyWithImpl;
@useResult
$Res call({
 Object error
});




}
/// @nodoc
class _$DeckFailureCopyWithImpl<$Res>
    implements $DeckFailureCopyWith<$Res> {
  _$DeckFailureCopyWithImpl(this._self, this._then);

  final DeckFailure _self;
  final $Res Function(DeckFailure) _then;

/// Create a copy of DeckState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DeckFailure(
error: null == error ? _self.error : error ,
  ));
}


}

// dart format on
