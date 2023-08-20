// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String recruterId;
  String name;
  String email;
  String role;
  String location;
  String amount;
  String desc;
  bool available;
  String phone;
  String userId;
  String profileImg;
  bool isPaymentCompleted;
  String fcmToken;
  bool isCoach;
  UserModel({
    this.recruterId = '',
    this.name = '',
    this.email = '',
    this.role = '',
    this.location = '',
    this.amount = '',
    this.desc = '',
    this.available = true,
    this.isPaymentCompleted = false,
    this.isCoach = true,
    this.phone = '',
    this.fcmToken = '',
    this.userId = '',
    this.profileImg =
        'https://static.vecteezy.com/system/resources/previews/002/002/403/original/man-with-beard-avatar-character-isolated-icon-free-vector.jpg',
  });
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      recruterId: '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      location: map['location'] ?? '',
      amount: map['amount'] ?? '',
      desc: map['desc'] ?? '',
      available: map['available'] ?? true,
      isPaymentCompleted: map['isPaymentCompleted'] ?? false,
      isCoach: map['isCoach'] ?? true,
      phone: map['phone'] ?? '',
      userId: map['userId'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
      profileImg: map['profileImg'] ??
          'https://static.vecteezy.com/system/resources/previews/002/002/403/original/man-with-beard-avatar-character-isolated-icon-free-vector.jpg',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "recruterId": '',
      "name": name,
      "email": email,
      "role": role,
      "location": location,
      "amount": amount,
      "desc": desc,
      "available": available,
      "phone": phone,
      "userId": userId,
      "profileImg": profileImg,
      "fcmToken": fcmToken,
      "isCoach": isCoach,
    };
  }
}

class UserModelUtilities {
  static Map<String, dynamic> convertToMap(UserModel user) {
    return user.toMap();
  }
}
