// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExperienceModel _$ExperienceModelFromJson(Map<String, dynamic> json) {
  return _ExperienceModel.fromJson(json);
}

/// @nodoc
mixin _$ExperienceModel {
  String? get userId => throw _privateConstructorUsedError;
  String? get role => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperienceModelCopyWith<ExperienceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceModelCopyWith<$Res> {
  factory $ExperienceModelCopyWith(
          ExperienceModel value, $Res Function(ExperienceModel) then) =
      _$ExperienceModelCopyWithImpl<$Res, ExperienceModel>;
  @useResult
  $Res call({String? userId, String? role, String? desc, String? id});
}

/// @nodoc
class _$ExperienceModelCopyWithImpl<$Res, $Val extends ExperienceModel>
    implements $ExperienceModelCopyWith<$Res> {
  _$ExperienceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? role = freezed,
    Object? desc = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExperienceModelCopyWith<$Res>
    implements $ExperienceModelCopyWith<$Res> {
  factory _$$_ExperienceModelCopyWith(
          _$_ExperienceModel value, $Res Function(_$_ExperienceModel) then) =
      __$$_ExperienceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? userId, String? role, String? desc, String? id});
}

/// @nodoc
class __$$_ExperienceModelCopyWithImpl<$Res>
    extends _$ExperienceModelCopyWithImpl<$Res, _$_ExperienceModel>
    implements _$$_ExperienceModelCopyWith<$Res> {
  __$$_ExperienceModelCopyWithImpl(
      _$_ExperienceModel _value, $Res Function(_$_ExperienceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? role = freezed,
    Object? desc = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_ExperienceModel(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExperienceModel implements _ExperienceModel {
  _$_ExperienceModel({this.userId, this.role, this.desc, this.id});

  factory _$_ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExperienceModelFromJson(json);

  @override
  final String? userId;
  @override
  final String? role;
  @override
  final String? desc;
  @override
  final String? id;

  @override
  String toString() {
    return 'ExperienceModel(userId: $userId, role: $role, desc: $desc, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExperienceModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, role, desc, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExperienceModelCopyWith<_$_ExperienceModel> get copyWith =>
      __$$_ExperienceModelCopyWithImpl<_$_ExperienceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExperienceModelToJson(
      this,
    );
  }
}

abstract class _ExperienceModel implements ExperienceModel {
  factory _ExperienceModel(
      {final String? userId,
      final String? role,
      final String? desc,
      final String? id}) = _$_ExperienceModel;

  factory _ExperienceModel.fromJson(Map<String, dynamic> json) =
      _$_ExperienceModel.fromJson;

  @override
  String? get userId;
  @override
  String? get role;
  @override
  String? get desc;
  @override
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ExperienceModelCopyWith<_$_ExperienceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
