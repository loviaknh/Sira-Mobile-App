import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class PrescriptionScanScreen extends StatelessWidget {
  const PrescriptionScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanner Ordonnance'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.document_scanner, color: Colors.white54, size: 80),
                      SizedBox(height: 16),
                      Text('Cadrez votre ordonnance', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.push('/pharmacy-cart'),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Prendre en photo'),
            ),
          ],
        ),
      ),
    );
  }
}
