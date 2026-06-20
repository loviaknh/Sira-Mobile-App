import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

import '../data/kyc_repository.dart';

class NpiVerificationScreen extends StatefulWidget {
  final String? nip;
  const NpiVerificationScreen({super.key, this.nip});

  @override
  State<NpiVerificationScreen> createState() => _NpiVerificationScreenState();
}

class _NpiVerificationScreenState extends State<NpiVerificationScreen> {
  bool _isValidated = false;

  final _kycRepository = KycRepository();
  bool _hasError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _verifyNip();
  }

  Future<void> _verifyNip() async {
    try {
      if (widget.nip == null || widget.nip!.isEmpty) {
        throw Exception("NPI invalide");
      }
      await _kycRepository.verifyNip(widget.nip!);
      
      if (mounted) {
        setState(() => _isValidated = true);
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) context.go('/main');
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_hasError) ...[
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              Text(
                'Erreur de vérification',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red),
              ),
              const SizedBox(height: 8),
              Text(
                _errorMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Réessayer'),
              ),
            ] else if (!_isValidated) ...[
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
