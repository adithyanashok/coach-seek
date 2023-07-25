import 'package:coach_seek/bloc/auth/auth_bloc.dart';
import 'package:coach_seek/bloc/sign_up/sign_up_bloc.dart';
import 'package:coach_seek/bloc/signin_in/sign_in_bloc.dart';
import 'package:coach_seek/services/firebase_auth.dart';
import 'package:coach_seek/services/firebase_sign_up_method.dart';
import 'package:coach_seek/view/home/home_screen.dart';
import 'package:coach_seek/view/main_page/main_page.dart';
import 'package:coach_seek/view/onboarding_screen/onboarding.dart';
import 'package:coach_seek/view/profile/profile_screen.dart';
import 'package:coach_seek/view/sign_in/sign_in.dart';
import 'package:coach_seek/view/sign_up/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final id = FirebaseAuth.instance.currentUser?.uid;
  // log(id.toString());
  // UserDb().getAUser(id!);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final id = FirebaseAuth.instance.currentUser?.uid;

    return RepositoryProvider(
      create: (context) => FirebaseSignUpMethod(context),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignInBloc()),
          BlocProvider(create: (context) => SignUpBloc()),
          BlocProvider(create: (context) => SignUpBloc()),
          BlocProvider(create: (context) => AuthBloc()),
        ],
        child: MultiProvider(
          providers: [
            Provider<FireBaseAuthClass>(
              create: (_) => FireBaseAuthClass(),
            ),
            StreamProvider(
              create: (context) => context.read<FireBaseAuthClass>().authState,
              initialData: null,
            )
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(),
            home: const AuthWrapper(),
            routes: {
              "signin": (context) => const SignInScreen(),
              "signup": (context) => const SignUpScreen(),
              "home": (context) => const HomeScreen(),
              "profile": (context) => ProfileScreen(userId: id),
              "onboarding": (context) => const OnboardingScreen(),
              // "welcome": (context) => const OnboardingScreen(),
            },
          ),
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null) {
      return const MainScreen();
    } else {
      return const OnboardingScreen();
    }
  }
}
