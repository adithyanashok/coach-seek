import 'dart:developer';
import 'package:coach_seek/database/functions/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RazorPayPayment {
  RazorPayPayment({this.userId, this.context, this.razorpay});
  final context;
  final userId;
  final id = FirebaseAuth.instance.currentUser?.uid;
  final razorpay;

  void openCheckout(amount) async {
    final user = await UserDb.getCurrentUser(id!);
    log("User at razorpay: $user");
    var options = {
      'key': dotenv.env['RAZORPAYKEY'], // Replace with your Razorpay Key ID
      'amount': calculateAmount(
          amount), // amount in paise (e.g., for INR 100, it's 100 * 100)
      'name': user.name,
      'description': 'Test Payment',
      'prefill': {
        'contact': user.phone,
        'email': user.email,
        'prefillEmail': user.email
      },
    };

    try {
      razorpay.open(options);
    } catch (e) {
      log('Error: $e');
    }
  }

  calculateAmount(String amount) {
    final data = int.parse(amount) * 100;
    return data.toString();
  }
}
