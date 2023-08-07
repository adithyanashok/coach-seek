// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_coach_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchCoachEvent {
  String? get query => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query) getSearchedCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? query)? getSearchedCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query)? getSearchedCoaches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchedCoaches value) getSearchedCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchedCoaches value)? getSearchedCoaches,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchedCoaches value)? getSearchedCoaches,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchCoachEventCopyWith<SearchCoachEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCoachEventCopyWith<$Res> {
  factory $SearchCoachEventCopyWith(
          SearchCoachEvent value, $Res Function(SearchCoachEvent) then) =
      _$SearchCoachEventCopyWithImpl<$Res, SearchCoachEvent>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class _$SearchCoachEventCopyWithImpl<$Res, $Val extends SearchCoachEvent>
    implements $SearchCoachEventCopyWith<$Res> {
  _$SearchCoachEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSearchedCoachesCopyWith<$Res>
    implements $SearchCoachEventCopyWith<$Res> {
  factory _$$GetSearchedCoachesCopyWith(_$GetSearchedCoaches value,
          $Res Function(_$GetSearchedCoaches) then) =
      __$$GetSearchedCoachesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$GetSearchedCoachesCopyWithImpl<$Res>
    extends _$SearchCoachEventCopyWithImpl<$Res, _$GetSearchedCoaches>
    implements _$$GetSearchedCoachesCopyWith<$Res> {
  __$$GetSearchedCoachesCopyWithImpl(
      _$GetSearchedCoaches _value, $Res Function(_$GetSearchedCoaches) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$GetSearchedCoaches(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$GetSearchedCoaches implements GetSearchedCoaches {
  const _$GetSearchedCoaches({this.query});

  @override
  final String? query;

  @override
  String toString() {
    return 'SearchCoachEvent.getSearchedCoaches(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSearchedCoaches &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSearchedCoachesCopyWith<_$GetSearchedCoaches> get copyWith =>
      __$$GetSearchedCoachesCopyWithImpl<_$GetSearchedCoaches>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? query) getSearchedCoaches,
  }) {
    return getSearchedCoaches(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? query)? getSearchedCoaches,
  }) {
    return getSearchedCoaches?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? query)? getSearchedCoaches,
    required TResult orElse(),
  }) {
    if (getSearchedCoaches != null) {
      return getSearchedCoaches(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetSearchedCoaches value) getSearchedCoaches,
  }) {
    return getSearchedCoaches(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetSearchedCoaches value)? getSearchedCoaches,
  }) {
    return getSearchedCoaches?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetSearchedCoaches value)? getSearchedCoaches,
    required TResult orElse(),
  }) {
    if (getSearchedCoaches != null) {
      return getSearchedCoaches(this);
    }
    return orElse();
  }
}

abstract class GetSearchedCoaches implements SearchCoachEvent {
  const factory GetSearchedCoaches({final String? query}) =
      _$GetSearchedCoaches;

  @override
  String? get query;
  @override
  @JsonKey(ignore: true)
  _$$GetSearchedCoachesCopyWith<_$GetSearchedCoaches> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SearchCoachState {
  bool get loading => throw _privateConstructorUsedError;
  List<UserModel> get coach => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchCoachStateCopyWith<SearchCoachState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchCoachStateCopyWith<$Res> {
  factory $SearchCoachStateCopyWith(
          SearchCoachState value, $Res Function(SearchCoachState) then) =
      _$SearchCoachStateCopyWithImpl<$Res, SearchCoachState>;
  @useResult
  $Res call({bool loading, List<UserModel> coach});
}

/// @nodoc
class _$SearchCoachStateCopyWithImpl<$Res, $Val extends SearchCoachState>
    implements $SearchCoachStateCopyWith<$Res> {
  _$SearchCoachStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_SearchCoachStateCopyWith<$Res>
    implements $SearchCoachStateCopyWith<$Res> {
  factory _$$_SearchCoachStateCopyWith(
          _$_SearchCoachState value, $Res Function(_$_SearchCoachState) then) =
      __$$_SearchCoachStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, List<UserModel> coach});
}

/// @nodoc
class __$$_SearchCoachStateCopyWithImpl<$Res>
    extends _$SearchCoachStateCopyWithImpl<$Res, _$_SearchCoachState>
    implements _$$_SearchCoachStateCopyWith<$Res> {
  __$$_SearchCoachStateCopyWithImpl(
      _$_SearchCoachState _value, $Res Function(_$_SearchCoachState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? coach = null,
  }) {
    return _then(_$_SearchCoachState(
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

class _$_SearchCoachState implements _SearchCoachState {
  const _$_SearchCoachState(
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
    return 'SearchCoachState(loading: $loading, coach: $coach)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchCoachState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality().equals(other._coach, _coach));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loading, const DeepCollectionEquality().hash(_coach));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchCoachStateCopyWith<_$_SearchCoachState> get copyWith =>
      __$$_SearchCoachStateCopyWithImpl<_$_SearchCoachState>(this, _$identity);
}

abstract class _SearchCoachState implements SearchCoachState {
  const factory _SearchCoachState(
      {required final bool loading,
      required final List<UserModel> coach}) = _$_SearchCoachState;

  @override
  bool get loading;
  @override
  List<UserModel> get coach;
  @override
  @JsonKey(ignore: true)
  _$$_SearchCoachStateCopyWith<_$_SearchCoachState> get copyWith =>
      throw _privateConstructorUsedError;
}
