import 'package:flutter/material.dart';
import 'package:isango_app/core/constants/app_routes.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_radii.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

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
        title: const Text('Verify Email'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page, vertical: AppSpacing.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.cardWhite,
                      borderRadius: BorderRadius.circular(AppRadii.card),
                      border: Border.all(color: AppColors.softBorder),
                    ),
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.paleSignalBlue,
                          child: const Icon(
                            Icons.mark_email_read,
                            size: 28,
                            color: AppColors.commandBlue,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        Text('Verification Pending', style: AppTextStyles.headline.copyWith(color: AppColors.logisticsNavy)),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'We\'ve sent a verification link to your student email. Please check your inbox to activate your account.',
                          style: AppTextStyles.bodyMuted,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.mistBackground,
                      borderRadius: BorderRadius.circular(AppRadii.card),
                      border: Border.all(color: AppColors.softBorder),
                    ),
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.help_outline, color: AppColors.commandBlue),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Why verify your email?', style: AppTextStyles.title.copyWith(color: AppColors.logisticsNavy)),
                              const SizedBox(height: AppSpacing.xs),
                              Text(
                                'Verification helps unlock trusted account capabilities like RSVP’ing to exclusive events and receiving priority notifications.',
                                style: AppTextStyles.bodyMuted,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.commandBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadii.button),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Verification email resent.')),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.send, color: AppColors.cardWhite),
                        SizedBox(width: AppSpacing.sm),
                        Text('Resend Verification Email'),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    'Can’t find the email? Check your spam folder or try resending in 2 minutes.',
                    style: AppTextStyles.bodyMuted.copyWith(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
