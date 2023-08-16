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

  // Function to initiate the Razorpay payment process
  void openCheckout(amount) async {
    // Fetch user data
    final user = await UserDb.getCurrentUser(id!);
    log("User at razorpay: $user");

    // Prepare payment options
    var options = {
      'key': dotenv.env['RAZORPAYKEY'],
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
      // Open the Razorpay payment window with the provided options
      razorpay.open(options);
    } catch (e) {
      log('Error: $e');
    }
  }

  // Function to convert the amount to paise (Razorpay uses paise as the unit)
  calculateAmount(String amount) {
    final data = int.parse(amount) * 100;
    return data.toString();
  }
}
