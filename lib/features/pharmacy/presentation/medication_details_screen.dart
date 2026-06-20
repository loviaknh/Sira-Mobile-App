import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class MedicationDetailsScreen extends StatelessWidget {
  const MedicationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200,
            color: Colors.white,
            child: const Center(child: Icon(Icons.medication, size: 100, color: AppColors.primary)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Paracétamol 500mg', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Boîte de 20 comprimés', style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 24),
                  const Text('1 500 FCFA', style: TextStyle(fontSize: 28, color: AppColors.primary, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () => context.push('/pharmacy-cart'),
                    child: const Text('Ajouter au panier'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
