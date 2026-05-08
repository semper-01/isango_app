import 'package:flutter/material.dart';
import 'package:isango_app/screens/auth/info_screen.dart';
import 'package:isango_app/screens/auth/login_screen.dart';
import 'package:isango_app/screens/auth/signup_screen.dart';
import 'package:isango_app/screens/auth/verify_email_screen.dart';
import 'package:isango_app/screens/home/home_screen.dart';
import 'package:isango_app/screens/saved/saved_screen.dart';
import 'package:isango_app/screens/settings/settings_screen.dart';
import 'package:isango_app/screens/submit/submit_screen.dart';

import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';

class IsangoApp extends StatelessWidget {
  const IsangoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isango',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signUp: (context) => const SignupScreen(),
        AppRoutes.verifyEmail: (context) => const VerifyEmailScreen(),
        AppRoutes.forgotPassword: (context) => const AuthInfoScreen(
              title: 'Forgot Password',
              body:
                  'To reset your password, use the link sent to your email or contact your University of Rwanda administrator for support.',
            ),
        AppRoutes.terms: (context) => const AuthInfoScreen(
              title: 'Terms & Conditions',
              body:
                  'This service is provided by the University of Rwanda to manage official campus events. Use of the app is subject to UR policies and event participation rules.',
            ),
        AppRoutes.privacy: (context) => const AuthInfoScreen(
              title: 'Privacy Policy',
              body:
                  'We collect and process event registration and notification data to deliver timely event updates. UR protects your information in accordance with its privacy standards.',
            ),
        AppRoutes.home: (context) => const HomeScreen(),
        AppRoutes.saved: (context) => const SavedScreen(),
        AppRoutes.submitEvent: (context) => const SubmitScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
      },
    );
  }
}