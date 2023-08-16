import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/coach/coach_bloc.dart';
import 'package:coach_seek/bloc/experience/experience_bloc.dart';
import 'package:coach_seek/bloc/hired_coach/hired_coach_bloc.dart';
import 'package:coach_seek/bloc/search_coach/search_coach_bloc.dart';
import 'package:coach_seek/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/bloc/signin_in/sign_in_bloc.dart';

import 'package:coach_seek/database/functions/experiences/experiences.dart';
import 'package:coach_seek/database/functions/profiecient_tag/proficient_tag.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/services/firebase_notification/firebase_notification.dart';
import 'package:coach_seek/services/firebase_sign_up_method.dart';
import 'package:coach_seek/view/coaches/coaches.dart';
import 'package:coach_seek/view/core/stripe_key.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:coach_seek/view/main_page/main_page.dart';
import 'package:coach_seek/view/onboarding_screen/onboarding.dart';
import 'package:coach_seek/view/payment_screen/payment_screen.dart';
import 'package:coach_seek/view/profile_screen/profile_screen.dart';
import 'package:coach_seek/view/search_result/search_result.dart';
import 'package:coach_seek/view/sign_in/sign_in.dart';
import 'package:coach_seek/view/sign_up/sign_up.dart';
import 'package:coach_seek/view/sign_up/signup_as_user.dart';

// Global key for the navigator
final navigatorKey = GlobalKey<NavigatorState>();

// Entry point of the application
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  // Set Stripe publishable key
  Stripe.publishableKey = StripeKeys.publishableKey;

  await Firebase.initializeApp();
  final user = FirebaseAuth.instance.currentUser;
  log('$user');
  FirebaseMessaging.onBackgroundMessage(_firebaseNotificationBackgroundHandler);
  FirebaseNotificationClass().isTokenRefresh();

  runApp(const MyApp());
}

// Firebase notification background handler
Future<void> _firebaseNotificationBackgroundHandler(
    RemoteMessage message) async {
  await Firebase.initializeApp();
}

// Main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FirebaseSignUpMethod(context),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignInBloc()),
          BlocProvider(create: (context) => SignUpBloc()),
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => ExperienceBloc()),
          BlocProvider(create: (context) => CoachBloc()),
          BlocProvider(create: (context) => SearchCoachBloc()),
          BlocProvider(create: (context) => HiredCoachBloc()),
        ],
        child: MultiProvider(
          providers: [
            Provider<FireBaseAuthClass>(
              create: (_) => FireBaseAuthClass(),
            ),
            StreamProvider(
              create: (context) => context.read<FireBaseAuthClass>().authState,
              initialData: null,
            ),
            StreamProvider(
              create: (context) => ExperienceDb.getExperience(),
              initialData: null,
            ),
            StreamProvider(
              create: (context) => ProficientTag.getTag(),
              initialData: null,
            ),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
            ),
            home: const AuthWrapper(),
            routes: {
              "signin": (context) => const SignInScreen(),
              "signup": (context) => const SignUpScreen(),
              "home": (context) => const HomeScreen(),
              "profile": (context) => ProfileScreen(),
              "onboarding": (context) => const OnboardingScreen(),
              "search_result": (context) => const SearchResultScreen(),
              "coaches": (context) => Coaches(),
              "payment": (context) => const PaymentScreen(),
              "user-signup": (context) => const UserSignupScreen(),
              // "welcome": (context) => const OnboardingScreen(),
            },
          ),
        ),
      ),
    );
  }
}

// Wrapper widget to manage authentication state
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return MainScreen();
    } else {
      return const OnboardingScreen();
    }
  }
}
