import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class NpiVerificationScreen extends StatefulWidget {
  const NpiVerificationScreen({super.key});

  @override
  State<NpiVerificationScreen> createState() => _NpiVerificationScreenState();
}

class _NpiVerificationScreenState extends State<NpiVerificationScreen> {
  bool _isValidated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() => _isValidated = true);
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) context.push('/kyc/id-scan');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isValidated) ...[
              const CircularProgressIndicator(color: AppColors.primary),
              const SizedBox(height: 32),
              Text(
                'Vérification en cours...',
                style: Theme.of(context).textTheme.titleLarge,
              ).animate().fade().slideY(),
              const SizedBox(height: 8),
              Text(
                'Connexion à la base nationale (ANIP)',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
              ).animate().fade(delay: 200.ms),
            ] else ...[
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 64),
              ).animate().scale(curve: Curves.easeOutBack),
              const SizedBox(height: 32),
              Text(
                'NPI vérifié avec succès',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ).animate().fade(),
            ],
          ],
        ),
      ),
    );
  }
}
