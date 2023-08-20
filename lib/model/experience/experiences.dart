import 'package:freezed_annotation/freezed_annotation.dart';
part 'experiences.freezed.dart';
part 'experiences.g.dart';

@freezed
class ExperienceModel with _$ExperienceModel {
  factory ExperienceModel({
    String? userId,
    String? role,
    String? desc,
    String? id,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);
}
