import 'package:freezed_annotation/freezed_annotation.dart';
part 'proficient_tag.freezed.dart';
part 'proficient_tag.g.dart';

@freezed
class TagModel with _$TagModel {
  const factory TagModel({
    required String userId,
    required String text,
    required String id,
  }) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);
}
