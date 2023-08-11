import 'dart:developer';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/database/functions/hired_coach/hired_coach.dart';
import 'package:coach_seek/services/payments/razorpay.dart';
import 'package:coach_seek/services/payments/stripe_payment.dart';
import 'package:coach_seek/view/core/colors.dart';
import 'package:coach_seek/services/payments/googlepay.dart';
import 'package:coach_seek/view/core/snack_bar.dart';
import 'package:coach_seek/view/widgets/app_bar_widgets.dart';
import 'package:coach_seek/view/widgets/profile_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay/pay.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final id = FirebaseAuth.instance.currentUser?.uid;

  late Razorpay _razorpay;
  late String amount;
  late String userId;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  final _paymentItems = <PaymentItem>[];

  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthBloc>().state.user;
    log("State at payment screen: ${state['userId']}");
    final profileImg = state['profileImg'];
    final coachName = state['name'];
    final coachRole = state['role'];
    final coachLocation = state['location'];
    userId = state['userId'];
    amount = state['amount'];
    _paymentItems.add(PaymentItem(amount: amount, label: coachName));
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(title: "Payment"),
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(48), // Image radius
                    child: Image.network(profileImg),
                  ),
                ),
                // Coach Name
                titleWidget(
                  text: coachName,
                  color: AppColors.lightbluecolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                // Coach Role
                titleWidget(
                  text: coachRole,
                  color: AppColors.lightbluecolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
                // Coach Location
                titleWidget(
                  text: coachLocation,
                  color: AppColors.greycolor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
                profileActionButton(
                  text: "\$$amount",
                  color: AppColors.lightbluecolor,
                ),
                GooglePayButton(
                  width: 300,
                  paymentConfiguration:
                      PaymentConfiguration.fromJsonString(defaultGooglePay),
                  paymentItems: _paymentItems,
                  type: GooglePayButtonType.pay,
                  margin: const EdgeInsets.only(top: 15.0),
                  onPaymentResult: (result) {
                    log("Google pay Result: $result");
                  },
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    const StripePayment().makePayment(
                        context, amount, paymentIntentData, userId);
                  },
                  child: profileActionButton(
                    width: 300,
                    height: 50,
                    text: "Pay with card ",
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    RazorPayPayment(
                            context: context,
                            userId: userId,
                            razorpay: _razorpay)
                        .openCheckout(amount);
                  },
                  child: profileActionButton(
                    width: 300,
                    height: 50,
                    text: "Razorpay",
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("response ${response.paymentId}");
    final paymentId = response.paymentId;
    log("response ${response.orderId}");
    HiredCoachDb.completePayment(userId, paymentId);
    snackBar(context: context, msg: "Payment Completed Successfully");
  }

  void handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    log("response ${response.message}");
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet
    log(response.toString());
    log("response ${response.walletName}");
  }
}
