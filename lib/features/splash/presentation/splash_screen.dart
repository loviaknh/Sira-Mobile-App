import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading, then go to onboarding
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Basé sur l'image de référence : fond blanc, logo vert
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icône provisoire en attendant le vrai logo SVG
            const Icon(
              Icons.health_and_safety,
              size: 80,
              color: AppColors.primary,
            )
                .animate()
                .fade(duration: 800.ms)
                .scale(curve: Curves.easeOutBack, duration: 800.ms),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sira',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: AppColors.textMain,
                        fontWeight: FontWeight.bold,
                        fontSize: 48,
                      ),
                ),
              ],
            ).animate().fade(delay: 400.ms).slideY(begin: 0.5, end: 0),
            const SizedBox(height: 16),
            Text(
              'Votre santé, notre mission.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                  ),
            ).animate().fade(delay: 800.ms),
          ],
        ),
      ),
    );
  }
}
