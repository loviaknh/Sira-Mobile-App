import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.emergency,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.white)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => context.push('/sos/map'),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, spreadRadius: 10)],
                ),
                child: const Center(
                  child: Text('SOS', style: TextStyle(color: AppColors.emergency, fontSize: 64, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 48),
            const Text('Appuyez pour appeler\nles urgences (SAMU)', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
