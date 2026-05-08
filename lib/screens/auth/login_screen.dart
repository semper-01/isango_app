import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_radii.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _submit() {
    if (_formKey.currentState?.validate() != true) {
      return;
    }

    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  InputDecoration _buildDecoration({required String label, required String hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: AppColors.cardWhite,
      contentPadding: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.lg,
      ),
      labelStyle: AppTextStyles.title.copyWith(color: AppColors.mutedOperationalInk),
      hintStyle: AppTextStyles.bodyMuted,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: const BorderSide(color: AppColors.softBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: const BorderSide(color: AppColors.commandBlue, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: const BorderSide(color: AppColors.criticalRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadii.input),
        borderSide: const BorderSide(color: AppColors.criticalRed, width: 1.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mistBackground,
      appBar: AppBar(
        backgroundColor: AppColors.cardWhite,
        foregroundColor: AppColors.logisticsNavy,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text('Login'),
        centerTitle: true,
      ),
      bottomNavigationBar: const IsangoBottomNavigation(currentIndex: 0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page, vertical: AppSpacing.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(AppRadii.card),
                  border: Border.all(color: AppColors.softBorder),
                ),
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text('Create Account', style: AppTextStyles.headline.copyWith(color: AppColors.logisticsNavy)),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Center(
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: AppColors.commandBlue,
                        child: const Icon(
                          Icons.person,
                          size: 32,
                          color: AppColors.cardWhite,
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Center(
                      child: Text(
                        'Login',
                        style: AppTextStyles.display,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Join your Campus Community To Never Miss An Event.',
                      style: AppTextStyles.bodyMuted,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _buildDecoration(
                              label: 'University Email',
                              hint: 'Enter your UR email',
                            ).copyWith(
                              prefixIcon: const Icon(Icons.email_outlined, color: AppColors.mutedOperationalInk),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email is required.';
                              }
                              if (!value.contains('@')) {
                                return 'Enter a valid email address.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: _buildDecoration(
                              label: 'Password',
                              hint: 'Enter password',
                            ).copyWith(
                              prefixIcon: const Icon(Icons.lock_outline, color: AppColors.mutedOperationalInk),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                  color: AppColors.mutedOperationalInk,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required.';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.forgotPassword);
                              },
                              child: Text('Forgot Password?', style: AppTextStyles.body.copyWith(color: AppColors.commandBlue)),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: AppColors.commandBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadii.button),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                            ),
                            onPressed: _submit,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Log In'),
                                SizedBox(width: AppSpacing.sm),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                style: AppTextStyles.bodyMuted,
                                children: [
                                  const TextSpan(text: "Don't have an account? "),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: AppTextStyles.body.copyWith(color: AppColors.commandBlue, fontWeight: FontWeight.w600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, AppRoutes.signUp);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Center(
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.commandBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppRadii.button),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSpacing.lg,
                                  horizontal: AppSpacing.xl,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.verifyEmail);
                              },
                              child: const Text('Verify Email'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      'Official University of Rwanda operational event management system.',
                      style: AppTextStyles.bodyMuted.copyWith(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
