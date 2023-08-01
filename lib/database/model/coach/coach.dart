import 'package:freezed_annotation/freezed_annotation.dart';
part 'coach.freezed.dart';
part 'coach.g.dart';

@freezed
class CoachModel with _$CoachModel {
  const factory CoachModel({
    required List coach,
  }) = _CoachModel;

  factory CoachModel.fromJson(Map<String, dynamic> json) =>
      _$CoachModelFromJson(json);
}
