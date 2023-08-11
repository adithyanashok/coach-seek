import 'dart:convert';
import 'dart:developer';
import 'package:coach_seek/bloc/hired_coach/hired_coach_bloc.dart';
import 'package:coach_seek/database/functions/hired_coach/hired_coach.dart';
import 'package:coach_seek/view/core/stripe_key.dart';
import 'package:coach_seek/view/widgets/profile/proficient_tag.dart';
import 'package:http/http.dart' as http;
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class StripePayment {
  const StripePayment();

  Future<void> makePayment(context, amount, paymentIntentData, userId) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, "USD");
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            googlePay: const PaymentSheetGooglePay(merchantCountryCode: 'US'),
            merchantDisplayName: 'T',
            style: ThemeMode.system),
      );
      displayPaymentSheet(context, paymentIntentData, userId);
    } catch (e) {
      log("Exception at makePayment(): ${e.toString()}");
    }
  }

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
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      log('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body.toString());
    } catch (e) {
      log("Exception at createPaymentIntent(): ${e.toString()}");
    }
  }

  calculateAmount(String amount) {
    final data = int.parse(amount) * 100;
    return data.toString();
  }
}
