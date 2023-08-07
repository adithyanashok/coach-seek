// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hired_coach_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HiredCoachEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getHiredCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getHiredCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getHiredCoaches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHiredCoaches value) getHiredCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHiredCoaches value)? getHiredCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHiredCoaches value)? getHiredCoaches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HiredCoachEventCopyWith<HiredCoachEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiredCoachEventCopyWith<$Res> {
  factory $HiredCoachEventCopyWith(
          HiredCoachEvent value, $Res Function(HiredCoachEvent) then) =
      _$HiredCoachEventCopyWithImpl<$Res, HiredCoachEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$HiredCoachEventCopyWithImpl<$Res, $Val extends HiredCoachEvent>
    implements $HiredCoachEventCopyWith<$Res> {
  _$HiredCoachEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetHiredCoachesCopyWith<$Res>
    implements $HiredCoachEventCopyWith<$Res> {
  factory _$$GetHiredCoachesCopyWith(
          _$GetHiredCoaches value, $Res Function(_$GetHiredCoaches) then) =
      __$$GetHiredCoachesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetHiredCoachesCopyWithImpl<$Res>
    extends _$HiredCoachEventCopyWithImpl<$Res, _$GetHiredCoaches>
    implements _$$GetHiredCoachesCopyWith<$Res> {
  __$$GetHiredCoachesCopyWithImpl(
      _$GetHiredCoaches _value, $Res Function(_$GetHiredCoaches) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetHiredCoaches(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetHiredCoaches implements GetHiredCoaches {
  const _$GetHiredCoaches({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'HiredCoachEvent.getHiredCoaches(userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHiredCoaches &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHiredCoachesCopyWith<_$GetHiredCoaches> get copyWith =>
      __$$GetHiredCoachesCopyWithImpl<_$GetHiredCoaches>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) getHiredCoaches,
  }) {
    return getHiredCoaches(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? getHiredCoaches,
  }) {
    return getHiredCoaches?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? getHiredCoaches,
    required TResult orElse(),
  }) {
    if (getHiredCoaches != null) {
      return getHiredCoaches(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetHiredCoaches value) getHiredCoaches,
  }) {
    return getHiredCoaches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetHiredCoaches value)? getHiredCoaches,
  }) {
    return getHiredCoaches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetHiredCoaches value)? getHiredCoaches,
    required TResult orElse(),
  }) {
    if (getHiredCoaches != null) {
      return getHiredCoaches(this);
    }
    return orElse();
  }
}

abstract class GetHiredCoaches implements HiredCoachEvent {
  const factory GetHiredCoaches({required final String userId}) =
      _$GetHiredCoaches;

  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$GetHiredCoachesCopyWith<_$GetHiredCoaches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HiredCoachState {
  bool get loading => throw _privateConstructorUsedError;
  List<UserModel> get coach => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HiredCoachStateCopyWith<HiredCoachState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HiredCoachStateCopyWith<$Res> {
  factory $HiredCoachStateCopyWith(
          HiredCoachState value, $Res Function(HiredCoachState) then) =
      _$HiredCoachStateCopyWithImpl<$Res, HiredCoachState>;
  @useResult
  $Res call({bool loading, List<UserModel> coach});
}

/// @nodoc
class _$HiredCoachStateCopyWithImpl<$Res, $Val extends HiredCoachState>
    implements $HiredCoachStateCopyWith<$Res> {
  _$HiredCoachStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? coach = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      coach: null == coach
          ? _value.coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HiredCoachStateCopyWith<$Res>
    implements $HiredCoachStateCopyWith<$Res> {
  factory _$$_HiredCoachStateCopyWith(
          _$_HiredCoachState value, $Res Function(_$_HiredCoachState) then) =
      __$$_HiredCoachStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<UserModel> coach});
}

/// @nodoc
class __$$_HiredCoachStateCopyWithImpl<$Res>
    extends _$HiredCoachStateCopyWithImpl<$Res, _$_HiredCoachState>
    implements _$$_HiredCoachStateCopyWith<$Res> {
  __$$_HiredCoachStateCopyWithImpl(
      _$_HiredCoachState _value, $Res Function(_$_HiredCoachState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? coach = null,
  }) {
    return _then(_$_HiredCoachState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      coach: null == coach
          ? _value._coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
    ));
  }
}

/// @nodoc

class _$_HiredCoachState implements _HiredCoachState {
  const _$_HiredCoachState(
      {required this.loading, required final List<UserModel> coach})
      : _coach = coach;

  @override
  final bool loading;
  final List<UserModel> _coach;
  @override
  List<UserModel> get coach {
    if (_coach is EqualUnmodifiableListView) return _coach;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coach);
  }

  @override
  String toString() {
    return 'HiredCoachState(loading: $loading, coach: $coach)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HiredCoachState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._coach, _coach));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_coach));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HiredCoachStateCopyWith<_$_HiredCoachState> get copyWith =>
      __$$_HiredCoachStateCopyWithImpl<_$_HiredCoachState>(this, _$identity);
}

abstract class _HiredCoachState implements HiredCoachState {
  const factory _HiredCoachState(
      {required final bool loading,
      required final List<UserModel> coach}) = _$_HiredCoachState;

  @override
  bool get loading;
  @override
  List<UserModel> get coach;
  @override
  @JsonKey(ignore: true)
  _$$_HiredCoachStateCopyWith<_$_HiredCoachState> get copyWith =>
      throw _privateConstructorUsedError;
}
