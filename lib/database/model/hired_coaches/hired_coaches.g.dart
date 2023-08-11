// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hired_coaches.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HiredCoacheModel _$$_HiredCoacheModelFromJson(Map<String, dynamic> json) =>
    _$_HiredCoacheModel(
      name: json['name'] as String,
      recruterId: json['recruterId'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      location: json['location'] as String,
      amount: json['amount'] as String,
      desc: json['desc'] as String,
      available: json['available'] as bool?,
      phone: json['phone'] as String,
      userId: json['userId'] as String,
      profileImg: json['profileImg'] as String,
      isPaymentCompleted: json['isPaymentCompleted'] as bool?,
      paymentId: json['paymentId'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_HiredCoacheModelToJson(_$_HiredCoacheModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'recruterId': instance.recruterId,
      'email': instance.email,
      'role': instance.role,
      'location': instance.location,
      'amount': instance.amount,
      'desc': instance.desc,
      'available': instance.available,
      'phone': instance.phone,
      'userId': instance.userId,
      'profileImg': instance.profileImg,
      'isPaymentCompleted': instance.isPaymentCompleted,
      'paymentId': instance.paymentId,
      'id': instance.id,
    };
