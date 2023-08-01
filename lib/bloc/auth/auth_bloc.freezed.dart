// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic>? user) signInEvent,
    required TResult Function(bool loading) updateEvent,
    required TResult Function(bool loading) loadingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic>? user)? signInEvent,
    TResult? Function(bool loading)? updateEvent,
    TResult? Function(bool loading)? loadingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic>? user)? signInEvent,
    TResult Function(bool loading)? updateEvent,
    TResult Function(bool loading)? loadingEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(UpdateEvent value) updateEvent,
    required TResult Function(LoadingEvent value) loadingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(UpdateEvent value)? updateEvent,
    TResult? Function(LoadingEvent value)? loadingEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(UpdateEvent value)? updateEvent,
    TResult Function(LoadingEvent value)? loadingEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic>? user) signInEvent,
    required TResult Function(bool loading) updateEvent,
    required TResult Function(bool loading) loadingEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic>? user)? signInEvent,
    TResult? Function(bool loading)? updateEvent,
    TResult? Function(bool loading)? loadingEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic>? user)? signInEvent,
    TResult Function(bool loading)? updateEvent,
    TResult Function(bool loading)? loadingEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(UpdateEvent value) updateEvent,
    required TResult Function(LoadingEvent value) loadingEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(UpdateEvent value)? updateEvent,
    TResult? Function(LoadingEvent value)? loadingEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(UpdateEvent value)? updateEvent,
    TResult Function(LoadingEvent value)? loadingEvent,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$SignInEventCopyWith<$Res> {
  factory _$$SignInEventCopyWith(
          _$SignInEvent value, $Res Function(_$SignInEvent) then) =
      __$$SignInEventCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic>? user});
}

/// @nodoc
class __$$SignInEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInEvent>
    implements _$$SignInEventCopyWith<$Res> {
  __$$SignInEventCopyWithImpl(
      _$SignInEvent _value, $Res Function(_$SignInEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$SignInEvent(
      user: freezed == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$SignInEvent implements SignInEvent {
  const _$SignInEvent({required final Map<String, dynamic>? user})
      : _user = user;

  final Map<String, dynamic>? _user;
  @override
  Map<String, dynamic>? get user {
    final value = _user;
    if (value == null) return null;
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AuthEvent.signInEvent(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInEvent &&
            const DeepCollectionEquality().equals(other._user, _user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInEventCopyWith<_$SignInEvent> get copyWith =>
      __$$SignInEventCopyWithImpl<_$SignInEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic>? user) signInEvent,
    required TResult Function(bool loading) updateEvent,
    required TResult Function(bool loading) loadingEvent,
  }) {
    return signInEvent(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic>? user)? signInEvent,
    TResult? Function(bool loading)? updateEvent,
    TResult? Function(bool loading)? loadingEvent,
  }) {
    return signInEvent?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic>? user)? signInEvent,
    TResult Function(bool loading)? updateEvent,
    TResult Function(bool loading)? loadingEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(UpdateEvent value) updateEvent,
    required TResult Function(LoadingEvent value) loadingEvent,
  }) {
    return signInEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(UpdateEvent value)? updateEvent,
    TResult? Function(LoadingEvent value)? loadingEvent,
  }) {
    return signInEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(UpdateEvent value)? updateEvent,
    TResult Function(LoadingEvent value)? loadingEvent,
    required TResult orElse(),
  }) {
    if (signInEvent != null) {
      return signInEvent(this);
    }
    return orElse();
  }
}

abstract class SignInEvent implements AuthEvent {
  const factory SignInEvent({required final Map<String, dynamic>? user}) =
      _$SignInEvent;

  Map<String, dynamic>? get user;
  @JsonKey(ignore: true)
  _$$SignInEventCopyWith<_$SignInEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateEventCopyWith<$Res> {
  factory _$$UpdateEventCopyWith(
          _$UpdateEvent value, $Res Function(_$UpdateEvent) then) =
      __$$UpdateEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading});
}

/// @nodoc
class __$$UpdateEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$UpdateEvent>
    implements _$$UpdateEventCopyWith<$Res> {
  __$$UpdateEventCopyWithImpl(
      _$UpdateEvent _value, $Res Function(_$UpdateEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
  }) {
    return _then(_$UpdateEvent(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UpdateEvent implements UpdateEvent {
  const _$UpdateEvent({required this.loading});

  @override
  final bool loading;

  @override
  String toString() {
    return 'AuthEvent.updateEvent(loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEvent &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEventCopyWith<_$UpdateEvent> get copyWith =>
      __$$UpdateEventCopyWithImpl<_$UpdateEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic>? user) signInEvent,
    required TResult Function(bool loading) updateEvent,
    required TResult Function(bool loading) loadingEvent,
  }) {
    return updateEvent(loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic>? user)? signInEvent,
    TResult? Function(bool loading)? updateEvent,
    TResult? Function(bool loading)? loadingEvent,
  }) {
    return updateEvent?.call(loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic>? user)? signInEvent,
    TResult Function(bool loading)? updateEvent,
    TResult Function(bool loading)? loadingEvent,
    required TResult orElse(),
  }) {
    if (updateEvent != null) {
      return updateEvent(loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(UpdateEvent value) updateEvent,
    required TResult Function(LoadingEvent value) loadingEvent,
  }) {
    return updateEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(UpdateEvent value)? updateEvent,
    TResult? Function(LoadingEvent value)? loadingEvent,
  }) {
    return updateEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(UpdateEvent value)? updateEvent,
    TResult Function(LoadingEvent value)? loadingEvent,
    required TResult orElse(),
  }) {
    if (updateEvent != null) {
      return updateEvent(this);
    }
    return orElse();
  }
}

abstract class UpdateEvent implements AuthEvent {
  const factory UpdateEvent({required final bool loading}) = _$UpdateEvent;

  bool get loading;
  @JsonKey(ignore: true)
  _$$UpdateEventCopyWith<_$UpdateEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingEventCopyWith<$Res> {
  factory _$$LoadingEventCopyWith(
          _$LoadingEvent value, $Res Function(_$LoadingEvent) then) =
      __$$LoadingEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loading});
}

/// @nodoc
class __$$LoadingEventCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoadingEvent>
    implements _$$LoadingEventCopyWith<$Res> {
  __$$LoadingEventCopyWithImpl(
      _$LoadingEvent _value, $Res Function(_$LoadingEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
  }) {
    return _then(_$LoadingEvent(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadingEvent implements LoadingEvent {
  const _$LoadingEvent({required this.loading});

  @override
  final bool loading;

  @override
  String toString() {
    return 'AuthEvent.loadingEvent(loading: $loading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingEvent &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingEventCopyWith<_$LoadingEvent> get copyWith =>
      __$$LoadingEventCopyWithImpl<_$LoadingEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic>? user) signInEvent,
    required TResult Function(bool loading) updateEvent,
    required TResult Function(bool loading) loadingEvent,
  }) {
    return loadingEvent(loading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic>? user)? signInEvent,
    TResult? Function(bool loading)? updateEvent,
    TResult? Function(bool loading)? loadingEvent,
  }) {
    return loadingEvent?.call(loading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic>? user)? signInEvent,
    TResult Function(bool loading)? updateEvent,
    TResult Function(bool loading)? loadingEvent,
    required TResult orElse(),
  }) {
    if (loadingEvent != null) {
      return loadingEvent(loading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SignInEvent value) signInEvent,
    required TResult Function(UpdateEvent value) updateEvent,
    required TResult Function(LoadingEvent value) loadingEvent,
  }) {
    return loadingEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SignInEvent value)? signInEvent,
    TResult? Function(UpdateEvent value)? updateEvent,
    TResult? Function(LoadingEvent value)? loadingEvent,
  }) {
    return loadingEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SignInEvent value)? signInEvent,
    TResult Function(UpdateEvent value)? updateEvent,
    TResult Function(LoadingEvent value)? loadingEvent,
    required TResult orElse(),
  }) {
    if (loadingEvent != null) {
      return loadingEvent(this);
    }
    return orElse();
  }
}

abstract class LoadingEvent implements AuthEvent {
  const factory LoadingEvent({required final bool loading}) = _$LoadingEvent;

  bool get loading;
  @JsonKey(ignore: true)
  _$$LoadingEventCopyWith<_$LoadingEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  bool get loading => throw _privateConstructorUsedError;
  Map<String, dynamic> get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call({bool loading, Map<String, dynamic> user});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$$_AuthStateCopyWith(
          _$_AuthState value, $Res Function(_$_AuthState) then) =
      __$$_AuthStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, Map<String, dynamic> user});
}

/// @nodoc
class __$$_AuthStateCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_AuthState>
    implements _$$_AuthStateCopyWith<$Res> {
  __$$_AuthStateCopyWithImpl(
      _$_AuthState _value, $Res Function(_$_AuthState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? user = null,
  }) {
    return _then(_$_AuthState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_AuthState implements _AuthState {
  const _$_AuthState(
      {required this.loading, final Map<String, dynamic> user = const {}})
      : _user = user;

  @override
  final bool loading;
  final Map<String, dynamic> _user;
  @override
  @JsonKey()
  Map<String, dynamic> get user {
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

  @override
  String toString() {
    return 'AuthState(loading: $loading, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._user, _user));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_user));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      __$$_AuthStateCopyWithImpl<_$_AuthState>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {required final bool loading,
      final Map<String, dynamic> user}) = _$_AuthState;

  @override
  bool get loading;
  @override
  Map<String, dynamic> get user;
  @override
  @JsonKey(ignore: true)
  _$$_AuthStateCopyWith<_$_AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}
