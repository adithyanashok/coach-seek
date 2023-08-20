// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExperienceEvent {
  List<ExperienceModel> get experience => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ExperienceModel> experience) getExperience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ExperienceModel> experience)? getExperience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ExperienceModel> experience)? getExperience,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExperience value) getExperience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExperience value)? getExperience,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExperience value)? getExperience,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExperienceEventCopyWith<ExperienceEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceEventCopyWith<$Res> {
  factory $ExperienceEventCopyWith(
          ExperienceEvent value, $Res Function(ExperienceEvent) then) =
      _$ExperienceEventCopyWithImpl<$Res, ExperienceEvent>;
  @useResult
  $Res call({List<ExperienceModel> experience});
}

/// @nodoc
class _$ExperienceEventCopyWithImpl<$Res, $Val extends ExperienceEvent>
    implements $ExperienceEventCopyWith<$Res> {
  _$ExperienceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experience = null,
  }) {
    return _then(_value.copyWith(
      experience: null == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetExperienceCopyWith<$Res>
    implements $ExperienceEventCopyWith<$Res> {
  factory _$$GetExperienceCopyWith(
          _$GetExperience value, $Res Function(_$GetExperience) then) =
      __$$GetExperienceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ExperienceModel> experience});
}

/// @nodoc
class __$$GetExperienceCopyWithImpl<$Res>
    extends _$ExperienceEventCopyWithImpl<$Res, _$GetExperience>
    implements _$$GetExperienceCopyWith<$Res> {
  __$$GetExperienceCopyWithImpl(
      _$GetExperience _value, $Res Function(_$GetExperience) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experience = null,
  }) {
    return _then(_$GetExperience(
      null == experience
          ? _value._experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ));
  }
}

/// @nodoc

class _$GetExperience implements GetExperience {
  const _$GetExperience(final List<ExperienceModel> experience)
      : _experience = experience;

  final List<ExperienceModel> _experience;
  @override
  List<ExperienceModel> get experience {
    if (_experience is EqualUnmodifiableListView) return _experience;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experience);
  }

  @override
  String toString() {
    return 'ExperienceEvent.getExperience(experience: $experience)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExperience &&
            const DeepCollectionEquality()
                .equals(other._experience, _experience));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_experience));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExperienceCopyWith<_$GetExperience> get copyWith =>
      __$$GetExperienceCopyWithImpl<_$GetExperience>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ExperienceModel> experience) getExperience,
  }) {
    return getExperience(experience);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ExperienceModel> experience)? getExperience,
  }) {
    return getExperience?.call(experience);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ExperienceModel> experience)? getExperience,
    required TResult orElse(),
  }) {
    if (getExperience != null) {
      return getExperience(experience);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetExperience value) getExperience,
  }) {
    return getExperience(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetExperience value)? getExperience,
  }) {
    return getExperience?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetExperience value)? getExperience,
    required TResult orElse(),
  }) {
    if (getExperience != null) {
      return getExperience(this);
    }
    return orElse();
  }
}

abstract class GetExperience implements ExperienceEvent {
  const factory GetExperience(final List<ExperienceModel> experience) =
      _$GetExperience;

  @override
  List<ExperienceModel> get experience;
  @override
  @JsonKey(ignore: true)
  _$$GetExperienceCopyWith<_$GetExperience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExperienceState {
  List<ExperienceModel> get experiences => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExperienceStateCopyWith<ExperienceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceStateCopyWith<$Res> {
  factory $ExperienceStateCopyWith(
          ExperienceState value, $Res Function(ExperienceState) then) =
      _$ExperienceStateCopyWithImpl<$Res, ExperienceState>;
  @useResult
  $Res call({List<ExperienceModel> experiences});
}

/// @nodoc
class _$ExperienceStateCopyWithImpl<$Res, $Val extends ExperienceState>
    implements $ExperienceStateCopyWith<$Res> {
  _$ExperienceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experiences = null,
  }) {
    return _then(_value.copyWith(
      experiences: null == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExperienceStateCopyWith<$Res>
    implements $ExperienceStateCopyWith<$Res> {
  factory _$$_ExperienceStateCopyWith(
          _$_ExperienceState value, $Res Function(_$_ExperienceState) then) =
      __$$_ExperienceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ExperienceModel> experiences});
}

/// @nodoc
class __$$_ExperienceStateCopyWithImpl<$Res>
    extends _$ExperienceStateCopyWithImpl<$Res, _$_ExperienceState>
    implements _$$_ExperienceStateCopyWith<$Res> {
  __$$_ExperienceStateCopyWithImpl(
      _$_ExperienceState _value, $Res Function(_$_ExperienceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? experiences = null,
  }) {
    return _then(_$_ExperienceState(
      experiences: null == experiences
          ? _value._experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<ExperienceModel>,
    ));
  }
}

/// @nodoc

class _$_ExperienceState implements _ExperienceState {
  const _$_ExperienceState({required final List<ExperienceModel> experiences})
      : _experiences = experiences;

  final List<ExperienceModel> _experiences;
  @override
  List<ExperienceModel> get experiences {
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experiences);
  }

  @override
  String toString() {
    return 'ExperienceState(experiences: $experiences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExperienceState &&
            const DeepCollectionEquality()
                .equals(other._experiences, _experiences));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_experiences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExperienceStateCopyWith<_$_ExperienceState> get copyWith =>
      __$$_ExperienceStateCopyWithImpl<_$_ExperienceState>(this, _$identity);
}

abstract class _ExperienceState implements ExperienceState {
  const factory _ExperienceState(
      {required final List<ExperienceModel> experiences}) = _$_ExperienceState;

  @override
  List<ExperienceModel> get experiences;
  @override
  @JsonKey(ignore: true)
  _$$_ExperienceStateCopyWith<_$_ExperienceState> get copyWith =>
      throw _privateConstructorUsedError;
}
