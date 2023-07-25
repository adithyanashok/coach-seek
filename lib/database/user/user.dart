class UserModel {
  String name;
  String email;
  String role;
  String location;
  String amount;
  String desc;
  String available;
  String phone;
  String userId;
  UserModel({
    this.name = '',
    this.email = '',
    this.role = '',
    this.location = '',
    this.amount = '',
    this.desc = '',
    this.available = "Available",
    this.phone = '',
    this.userId = '',
  });
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "role": role,
      "location": location,
      "amount": amount,
      "desc": desc,
      "available": available,
      "phone": phone,
      "userId": userId,
    };
  }
}

class UserModelUtilities {
  static Map<String, dynamic> convertToMap(UserModel user) {
    return user.toMap();
  }
}
