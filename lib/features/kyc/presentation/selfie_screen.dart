import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class SelfieScreen extends StatelessWidget {
  const SelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selfie de vérification', style: Theme.of(context).textTheme.titleMedium),
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
              'Prenez un selfie',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Assurez-vous que votre visage est bien visible et bien éclairé.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary, width: 4),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.face_retouching_natural, color: Colors.white54, size: 80),
                        const SizedBox(height: 16),
                        Text(
                          'Placez votre visage ici',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () => context.push('/kyc/biometric'),
              icon: const Icon(Icons.camera_front),
              label: const Text('Prendre le selfie'),
            ),
          ],
        ),
      ),
    );
  }
}
