import 'dart:convert';
import 'dart:developer';
import 'package:coach_seek/controller/db/hired_coach/hired_coach.dart';
import 'package:coach_seek/view/core/stripe_key.dart';
import 'package:http/http.dart' as http;
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePayment {
  const StripePayment();

  // Function to initiate the payment process using Stripe
  Future<void> makePayment(context, amount, paymentIntentData, userId) async {
    try {
      // Create a payment intent using Stripe API
      paymentIntentData = await createPaymentIntent(amount, "USD");

      // Initialize the Stripe payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
          merchantDisplayName: 'T',
          style: ThemeMode.system,
        ),
      );

      // Display the payment sheet to the user
      displayPaymentSheet(context, paymentIntentData, userId);
    } catch (e) {
      log("Exception at makePayment(): ${e.toString()}");
    }
  }

  // Function to display the Stripe payment sheet to the user
  displayPaymentSheet(context, paymentIntentData, userId) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        final paymentId = paymentIntentData!['id'];
        log('payment intentsss ${paymentIntentData!['id']}');
        log('payment intent $paymentIntentData');
        HiredCoachDb.completePayment(userId, paymentId);
        snackBar(context: context, msg: "Payment Completed");

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        log('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
        snackBar(context: context, msg: "Cancelled");
      });
    } on StripeException catch (e) {
      log('Exception/DISPLAYPAYMENTSHEET==> $e');
      snackBar(context: context, msg: "Cancelled");
    } catch (e) {
      log('$e');
    }
  }

  // Function to create a payment intent using the Stripe API
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer ${StripeKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      log('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("Exception at createPaymentIntent(): ${e.toString()}");
    }
  }

  // Function to convert the amount to the format expected by Stripe
  calculateAmount(String amount) {
    final data = int.parse(amount) * 100;
    return data.toString();
  }
}
