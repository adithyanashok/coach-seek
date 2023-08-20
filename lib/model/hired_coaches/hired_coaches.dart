import 'package:freezed_annotation/freezed_annotation.dart';
part 'hired_coaches.freezed.dart';
part 'hired_coaches.g.dart';

@freezed
class HiredCoacheModel with _$HiredCoacheModel {
  const factory HiredCoacheModel({
    required String name,
    required String recruterId,
    required String email,
    required String role,
    required String location,
    required String amount,
    required String desc,
    bool? available,
    required String phone,
    required String userId,
    required String profileImg,
    bool? isPaymentCompleted,
    required bool isCoach,
    String? paymentId,
    String? id,
  }) = _HiredCoacheModel;

  factory HiredCoacheModel.fromJson(Map<String, dynamic> json) =>
      _$HiredCoacheModelFromJson(json);
}
