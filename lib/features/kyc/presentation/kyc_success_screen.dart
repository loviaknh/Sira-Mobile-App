import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

class KycSuccessScreen extends StatelessWidget {
  const KycSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle, color: AppColors.primary, size: 100),
              ).animate().scale(curve: Curves.easeOutBack, duration: 800.ms),
              const SizedBox(height: 32),
              Text(
                'Compte validé !',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(color: AppColors.primary),
              ).animate().fade(delay: 400.ms).slideY(),
              const SizedBox(height: 16),
              Text(
                'Félicitations, votre identité a été vérifiée avec succès. Bienvenue sur Sira.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
              ).animate().fade(delay: 600.ms),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.go('/medical-profile'); 
                },
                child: const Text('Compléter mon profil médical'),
              ).animate().fade(delay: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}
