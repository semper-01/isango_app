import 'package:flutter/material.dart';
import 'package:isango_app/core/theme/app_colors.dart';
import 'package:isango_app/core/theme/app_radii.dart';
import 'package:isango_app/core/theme/app_spacing.dart';
import 'package:isango_app/core/theme/app_text_styles.dart';

class AuthInfoScreen extends StatelessWidget {
  const AuthInfoScreen({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mistBackground,
      appBar: AppBar(
        backgroundColor: AppColors.cardWhite,
        foregroundColor: AppColors.logisticsNavy,
        title: Text(title, style: AppTextStyles.title),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page, vertical: AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.cardWhite,
                  borderRadius: BorderRadius.circular(AppRadii.card),
                  border: Border.all(color: AppColors.softBorder),
                ),
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Text(body, style: AppTextStyles.body.copyWith(height: 1.7)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
