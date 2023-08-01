import 'package:freezed_annotation/freezed_annotation.dart';
part 'experiences.freezed.dart';
part 'experiences.g.dart';

@freezed
class ExperienceModel with _$ExperienceModel {
  factory ExperienceModel({
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'desc') String? desc,
    @JsonKey(name: 'id') String? id,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);
}
