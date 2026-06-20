import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class BiometricSetupScreen extends StatelessWidget {
  const BiometricSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textMain),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Vérification biométrique',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Empreinte digitale ou reconnaissance faciale pour sécuriser votre compte.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const Spacer(),
            Center(
              child: Container(
                padding: const EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.fingerprint, size: 100, color: AppColors.primary),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.push('/kyc/pin'),
              child: const Text('Scanner l\'empreinte'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () => context.push('/kyc/pin'),
              child: const Text(
                'Passer cette étape',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
