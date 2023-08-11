// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CoachEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCoaches,
    required TResult Function(String recruterId, String userId) getWhoHiredMe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCoaches,
    TResult? Function(String recruterId, String userId)? getWhoHiredMe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCoaches,
    TResult Function(String recruterId, String userId)? getWhoHiredMe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCoaches value) getCoaches,
    required TResult Function(GetWhoHiredMe value) getWhoHiredMe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCoaches value)? getCoaches,
    TResult? Function(GetWhoHiredMe value)? getWhoHiredMe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCoaches value)? getCoaches,
    TResult Function(GetWhoHiredMe value)? getWhoHiredMe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachEventCopyWith<$Res> {
  factory $CoachEventCopyWith(
          CoachEvent value, $Res Function(CoachEvent) then) =
      _$CoachEventCopyWithImpl<$Res, CoachEvent>;
}

/// @nodoc
class _$CoachEventCopyWithImpl<$Res, $Val extends CoachEvent>
    implements $CoachEventCopyWith<$Res> {
  _$CoachEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCoachesCopyWith<$Res> {
  factory _$$GetCoachesCopyWith(
          _$GetCoaches value, $Res Function(_$GetCoaches) then) =
      __$$GetCoachesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCoachesCopyWithImpl<$Res>
    extends _$CoachEventCopyWithImpl<$Res, _$GetCoaches>
    implements _$$GetCoachesCopyWith<$Res> {
  __$$GetCoachesCopyWithImpl(
      _$GetCoaches _value, $Res Function(_$GetCoaches) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCoaches implements GetCoaches {
  const _$GetCoaches();

  @override
  String toString() {
    return 'CoachEvent.getCoaches()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCoaches);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCoaches,
    required TResult Function(String recruterId, String userId) getWhoHiredMe,
  }) {
    return getCoaches();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCoaches,
    TResult? Function(String recruterId, String userId)? getWhoHiredMe,
  }) {
    return getCoaches?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCoaches,
    TResult Function(String recruterId, String userId)? getWhoHiredMe,
    required TResult orElse(),
  }) {
    if (getCoaches != null) {
      return getCoaches();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCoaches value) getCoaches,
    required TResult Function(GetWhoHiredMe value) getWhoHiredMe,
  }) {
    return getCoaches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCoaches value)? getCoaches,
    TResult? Function(GetWhoHiredMe value)? getWhoHiredMe,
  }) {
    return getCoaches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCoaches value)? getCoaches,
    TResult Function(GetWhoHiredMe value)? getWhoHiredMe,
    required TResult orElse(),
  }) {
    if (getCoaches != null) {
      return getCoaches(this);
    }
    return orElse();
  }
}

abstract class GetCoaches implements CoachEvent {
  const factory GetCoaches() = _$GetCoaches;
}

/// @nodoc
abstract class _$$GetWhoHiredMeCopyWith<$Res> {
  factory _$$GetWhoHiredMeCopyWith(
          _$GetWhoHiredMe value, $Res Function(_$GetWhoHiredMe) then) =
      __$$GetWhoHiredMeCopyWithImpl<$Res>;
  @useResult
  $Res call({String recruterId, String userId});
}

/// @nodoc
class __$$GetWhoHiredMeCopyWithImpl<$Res>
    extends _$CoachEventCopyWithImpl<$Res, _$GetWhoHiredMe>
    implements _$$GetWhoHiredMeCopyWith<$Res> {
  __$$GetWhoHiredMeCopyWithImpl(
      _$GetWhoHiredMe _value, $Res Function(_$GetWhoHiredMe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recruterId = null,
    Object? userId = null,
  }) {
    return _then(_$GetWhoHiredMe(
      recruterId: null == recruterId
          ? _value.recruterId
          : recruterId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWhoHiredMe implements GetWhoHiredMe {
  const _$GetWhoHiredMe({required this.recruterId, required this.userId});

  @override
  final String recruterId;
  @override
  final String userId;

  @override
  String toString() {
    return 'CoachEvent.getWhoHiredMe(recruterId: $recruterId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWhoHiredMe &&
            (identical(other.recruterId, recruterId) ||
                other.recruterId == recruterId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, recruterId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWhoHiredMeCopyWith<_$GetWhoHiredMe> get copyWith =>
      __$$GetWhoHiredMeCopyWithImpl<_$GetWhoHiredMe>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCoaches,
    required TResult Function(String recruterId, String userId) getWhoHiredMe,
  }) {
    return getWhoHiredMe(recruterId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCoaches,
    TResult? Function(String recruterId, String userId)? getWhoHiredMe,
  }) {
    return getWhoHiredMe?.call(recruterId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCoaches,
    TResult Function(String recruterId, String userId)? getWhoHiredMe,
    required TResult orElse(),
  }) {
    if (getWhoHiredMe != null) {
      return getWhoHiredMe(recruterId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetCoaches value) getCoaches,
    required TResult Function(GetWhoHiredMe value) getWhoHiredMe,
  }) {
    return getWhoHiredMe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetCoaches value)? getCoaches,
    TResult? Function(GetWhoHiredMe value)? getWhoHiredMe,
  }) {
    return getWhoHiredMe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetCoaches value)? getCoaches,
    TResult Function(GetWhoHiredMe value)? getWhoHiredMe,
    required TResult orElse(),
  }) {
    if (getWhoHiredMe != null) {
      return getWhoHiredMe(this);
    }
    return orElse();
  }
}

abstract class GetWhoHiredMe implements CoachEvent {
  const factory GetWhoHiredMe(
      {required final String recruterId,
      required final String userId}) = _$GetWhoHiredMe;

  String get recruterId;
  String get userId;
  @JsonKey(ignore: true)
  _$$GetWhoHiredMeCopyWith<_$GetWhoHiredMe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CoachState {
  bool get loading => throw _privateConstructorUsedError;
  List<UserModel> get coach => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoachStateCopyWith<CoachState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachStateCopyWith<$Res> {
  factory $CoachStateCopyWith(
          CoachState value, $Res Function(CoachState) then) =
      _$CoachStateCopyWithImpl<$Res, CoachState>;
  @useResult
  $Res call({bool loading, List<UserModel> coach});
}

/// @nodoc
class _$CoachStateCopyWithImpl<$Res, $Val extends CoachState>
    implements $CoachStateCopyWith<$Res> {
  _$CoachStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_CoachStateCopyWith<$Res>
    implements $CoachStateCopyWith<$Res> {
  factory _$$_CoachStateCopyWith(
          _$_CoachState value, $Res Function(_$_CoachState) then) =
      __$$_CoachStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<UserModel> coach});
}

/// @nodoc
class __$$_CoachStateCopyWithImpl<$Res>
    extends _$CoachStateCopyWithImpl<$Res, _$_CoachState>
    implements _$$_CoachStateCopyWith<$Res> {
  __$$_CoachStateCopyWithImpl(
      _$_CoachState _value, $Res Function(_$_CoachState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? coach = null,
  }) {
    return _then(_$_CoachState(
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

class _$_CoachState implements _CoachState {
  const _$_CoachState(
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
    return 'CoachState(loading: $loading, coach: $coach)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoachState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._coach, _coach));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_coach));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoachStateCopyWith<_$_CoachState> get copyWith =>
      __$$_CoachStateCopyWithImpl<_$_CoachState>(this, _$identity);
}

abstract class _CoachState implements CoachState {
  const factory _CoachState(
      {required final bool loading,
      required final List<UserModel> coach}) = _$_CoachState;

  @override
  bool get loading;
  @override
  List<UserModel> get coach;
  @override
  @JsonKey(ignore: true)
  _$$_CoachStateCopyWith<_$_CoachState> get copyWith =>
      throw _privateConstructorUsedError;
}
