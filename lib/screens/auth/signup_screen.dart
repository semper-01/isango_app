import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_radii.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';
import 'package:isango_app/widgets/isango_bottom_navigation.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _acceptedTerms = false;

  String get _passwordStrength {
    final length = _passwordController.text.length;
    if (length >= 10) {
      return 'Strong';
    }
    if (length >= 7) {
      return 'Medium';
    }
    if (length > 0) {
      return 'Weak';
    }
    return '';
  }

  void _submit() {
    if (!_acceptedTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept the Terms & Conditions to continue.')),
      );
      return;
    }

    if (_formKey.currentState?.validate() != true) {
      return;
    }

    Navigator.pushReplacementNamed(context, AppRoutes.verifyEmail);
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
                        'Sign Up',
                        style: AppTextStyles.display,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Join your campus community to never miss an event.',
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
                            controller: _nameController,
                            decoration: _buildDecoration(
                              label: 'Full Name',
                              hint: 'John Doe',
                            ).copyWith(
                              prefixIcon: const Icon(Icons.person, color: AppColors.mutedOperationalInk),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Full name is required.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: _buildDecoration(label: 'University Email', hint: 'student@ur.ac.rw').copyWith(
                              prefixIcon: const Icon(Icons.email_outlined, color: AppColors.mutedOperationalInk),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'University email is required.';
                              }
                              if (!value.contains('@')) {
                                return 'Please use a valid university email address.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            decoration: _buildDecoration(label: 'Password', hint: 'Create a password').copyWith(
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            onChanged: (_) => setState(() {}),
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
                          const SizedBox(height: AppSpacing.xs),
                          if (_passwordStrength.isNotEmpty)
                            Text(
                              'Password strength: $_passwordStrength',
                              style: AppTextStyles.body.copyWith(
                                color: _passwordStrength == 'Strong'
                                    ? Colors.green.shade700
                                    : _passwordStrength == 'Medium'
                                        ? AppColors.commandBlue
                                        : AppColors.criticalRed,
                              ),
                            ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            decoration: _buildDecoration(label: 'Confirm Password', hint: 'Re-enter password').copyWith(
                              prefixIcon: const Icon(Icons.lock, color: AppColors.mutedOperationalInk),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                                  color: AppColors.mutedOperationalInk,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureConfirmPassword = !_obscureConfirmPassword;
                                  });
                                },
                              ),
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password.';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _acceptedTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _acceptedTerms = value ?? false;
                                  });
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: AppTextStyles.body.copyWith(color: AppColors.mutedOperationalInk),
                                    children: [
                                      const TextSpan(text: 'I agree to the '),
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.commandBlue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context, AppRoutes.terms);
                                          },
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.commandBlue,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context, AppRoutes.privacy);
                                          },
                                      ),
                                      const TextSpan(text: ' of the University of Rwanda.'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                                Text('Create Account'),
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
                                  const TextSpan(text: 'Already have an account? '),
                                  TextSpan(
                                    text: 'Log In',
                                    style: AppTextStyles.body.copyWith(color: AppColors.commandBlue, fontWeight: FontWeight.w600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacementNamed(context, AppRoutes.login);
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
