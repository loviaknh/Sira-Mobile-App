import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                'Vérifiez votre numéro',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Nous avons envoyé un code OTP à +229 01 23 45 67 89',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 48),

              // Placeholder pour l'entrée OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 65,
                    height: 75,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundSecondary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        '0', 
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.w600, 
                          color: AppColors.textSecondary
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 48),

              ElevatedButton(
                onPressed: () {
                  context.go('/kyc/npi'); 
                },
                child: const Text('Vérifier'),
              ),
              const Spacer(),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Renvoyer le code (00:45)',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
