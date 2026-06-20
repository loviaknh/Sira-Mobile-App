import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class InsurancePackagesScreen extends StatelessWidget {
  const InsurancePackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(title: const Text('Nos Offres'), backgroundColor: Colors.transparent, elevation: 0),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildPackageCard(context, 'Pack Étudiant', '1 500 FCFA / mois', 'Couverture 60%', Colors.blue),
          const SizedBox(height: 16),
          _buildPackageCard(context, 'Pack Standard', '3 000 FCFA / mois', 'Couverture 80%', AppColors.primary, isPopular: true),
          const SizedBox(height: 16),
          _buildPackageCard(context, 'Pack Famille', '8 000 FCFA / mois', 'Couverture 90% - Jusqu\'à 5 personnes', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildPackageCard(BuildContext context, String title, String price, String details, Color color, {bool isPopular = false}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: isPopular ? Border.all(color: color, width: 2) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isPopular)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Text('POPULAIRE', style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(price, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 16),
          Text(details, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: color),
              child: const Text('Choisir cette offre'),
            ),
          ),
        ],
      ),
    );
  }
}
