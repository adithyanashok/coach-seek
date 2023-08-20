import 'dart:developer';
import 'package:coach_seek/controller/db/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayPayment {
  RazorPayPayment(
      {required this.userId, required this.context, required this.razorpay});
  BuildContext context;
  String userId;
  String? id = FirebaseAuth.instance.currentUser?.uid;
  Razorpay razorpay;

  // Function to initiate the Razorpay payment process
  void openCheckout(amount) async {
    // Fetch user data
    final user = await UserDb.getCurrentUser(id!);

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
