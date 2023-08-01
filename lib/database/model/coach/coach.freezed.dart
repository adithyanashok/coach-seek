// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoachModel _$CoachModelFromJson(Map<String, dynamic> json) {
  return _CoachModel.fromJson(json);
}

/// @nodoc
mixin _$CoachModel {
  List<dynamic> get coach => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoachModelCopyWith<CoachModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachModelCopyWith<$Res> {
  factory $CoachModelCopyWith(
          CoachModel value, $Res Function(CoachModel) then) =
      _$CoachModelCopyWithImpl<$Res, CoachModel>;
  @useResult
  $Res call({List<dynamic> coach});
}

/// @nodoc
class _$CoachModelCopyWithImpl<$Res, $Val extends CoachModel>
    implements $CoachModelCopyWith<$Res> {
  _$CoachModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coach = null,
  }) {
    return _then(_value.copyWith(
      coach: null == coach
          ? _value.coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CoachModelCopyWith<$Res>
    implements $CoachModelCopyWith<$Res> {
  factory _$$_CoachModelCopyWith(
          _$_CoachModel value, $Res Function(_$_CoachModel) then) =
      __$$_CoachModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> coach});
}

/// @nodoc
class __$$_CoachModelCopyWithImpl<$Res>
    extends _$CoachModelCopyWithImpl<$Res, _$_CoachModel>
    implements _$$_CoachModelCopyWith<$Res> {
  __$$_CoachModelCopyWithImpl(
      _$_CoachModel _value, $Res Function(_$_CoachModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coach = null,
  }) {
    return _then(_$_CoachModel(
      coach: null == coach
          ? _value._coach
          : coach // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoachModel implements _CoachModel {
  const _$_CoachModel({required final List<dynamic> coach}) : _coach = coach;

  factory _$_CoachModel.fromJson(Map<String, dynamic> json) =>
      _$$_CoachModelFromJson(json);

  final List<dynamic> _coach;
  @override
  List<dynamic> get coach {
    if (_coach is EqualUnmodifiableListView) return _coach;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coach);
  }

  @override
  String toString() {
    return 'CoachModel(coach: $coach)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CoachModel &&
            const DeepCollectionEquality().equals(other._coach, _coach));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_coach));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CoachModelCopyWith<_$_CoachModel> get copyWith =>
      __$$_CoachModelCopyWithImpl<_$_CoachModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CoachModelToJson(
      this,
    );
  }
}

abstract class _CoachModel implements CoachModel {
  const factory _CoachModel({required final List<dynamic> coach}) =
      _$_CoachModel;

  factory _CoachModel.fromJson(Map<String, dynamic> json) =
      _$_CoachModel.fromJson;

  @override
  List<dynamic> get coach;
  @override
  @JsonKey(ignore: true)
  _$$_CoachModelCopyWith<_$_CoachModel> get copyWith =>
      throw _privateConstructorUsedError;
}
