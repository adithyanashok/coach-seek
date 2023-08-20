import 'dart:developer';
import 'package:coach_seek/controller/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/controller/db/hired_coach/hired_coach.dart';
import 'package:coach_seek/services/payments/razorpay.dart';
import 'package:coach_seek/services/payments/stripe_payment.dart';
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
  late String email;
  late String phone;

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
    // BlocProvider.of<AuthBloc>(context).add(UserEvent(userId: id));
    // Get user data from AuthBloc's state
    final state = context.read<AuthBloc>().state.user;
    final coachName = state['name'];
    userId = state['userId'];
    amount = state['amount'];
    email = state['email'];
    phone = state['phone'];
    // log("STATE==${state}");

    // Initialize payment items for Google Pay
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
                // Google Pay Button
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
                const SizedBox(height: 20),
                // Payment with Stripe
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
                const SizedBox(height: 20),
                // Payment with Razorpay
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

  // Handle successful payment response
  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("response ${response.paymentId}");
    final paymentId = response.paymentId;
    log("response ${response.orderId}");
    HiredCoachDb.completePayment(userId, paymentId);
    snackBar(context: context, msg: "Payment Completed Successfully");
  }

  // Handle payment failure response
  void handlePaymentError(PaymentFailureResponse response) {
    log("response ${response.message}");
    // Handle payment failure
  }

  // Handle external wallet response
  void handleExternalWallet(ExternalWalletResponse response) {
    log(response.toString());
    log("response ${response.walletName}");
    // Handle external wallet
  }
}
