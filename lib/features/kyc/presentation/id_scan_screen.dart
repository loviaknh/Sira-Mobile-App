import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class IdScanScreen extends StatelessWidget {
  const IdScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Étape KYC & Identité', style: Theme.of(context).textTheme.titleMedium),
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
              'Photographiez votre pièce d\'identité',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Placez le document dans le cadre',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.document_scanner_outlined, color: Colors.white54, size: 80),
                      const SizedBox(height: 16),
                      Text(
                        'Aperçu Caméra',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () => context.push('/kyc/selfie'),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Scanner le document'),
            ),
          ],
        ),
      ),
    );
  }
}
