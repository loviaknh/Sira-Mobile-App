import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class PharmacyHomeScreen extends StatelessWidget {
  const PharmacyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        title: Text('Pharmacie Numérique', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: AppColors.textMain),
            onPressed: () => context.push('/pharmacy-cart'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher un médicament...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.document_scanner_outlined, color: AppColors.primary),
                  onPressed: () => context.push('/pharmacy/scan'),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 32),
            Text('Catégories', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryCard('Douleur', Icons.healing, Colors.red),
                  _buildCategoryCard('Digestion', Icons.restaurant, Colors.orange),
                  _buildCategoryCard('Vitamines', Icons.wb_sunny, Colors.yellow.shade700),
                  _buildCategoryCard('Bébé', Icons.child_care, Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Populaires', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildProductCard(context, 'Paracétamol 500mg', 'Boîte de 20 comprimés', '1 500 FCFA'),
            _buildProductCard(context, 'Vitamine C 1000mg', 'Tube de 15 effervescents', '2 000 FCFA'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String name, String details, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(color: AppColors.backgroundSecondary, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.medication, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(details, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 8),
                Text(price, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle, color: AppColors.primary, size: 32),
            onPressed: () => context.push('/pharmacy/medication'),
          ),
        ],
      ),
    );
  }
}
