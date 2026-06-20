import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class NpiInputScreen extends StatefulWidget {
  const NpiInputScreen({super.key});

  @override
  State<NpiInputScreen> createState() => _NpiInputScreenState();
}

class _NpiInputScreenState extends State<NpiInputScreen> {
  final _nipController = TextEditingController();

  @override
  void dispose() {
    _nipController.dispose();
    super.dispose();
  }

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Votre NPI',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Numéro Personnel d\'Identification. Indispensable pour accéder à vos données de santé.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 48),
              FormBuilderTextField(
                name: 'npi',
                controller: _nipController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 24, letterSpacing: 4),
                decoration: const InputDecoration(
                  hintText: '1234 5678 9012',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.help_outline, size: 16, color: AppColors.primary),
                  label: Text(
                    'Où trouver mon NPI ?',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  final nip = _nipController.text.trim();
                  if (nip.isNotEmpty) {
                    context.push('/kyc/npi-verify', extra: nip);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Veuillez entrer votre NPI')),
                    );
                  }
                },
                child: const Text('Continuer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
