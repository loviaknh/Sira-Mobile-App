import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class PharmacyCartScreen extends StatelessWidget {
  const PharmacyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(title: const Text('Mon Panier'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCartItem('Paracétamol 500mg', '1 500 FCFA', 2),
            _buildCartItem('Vitamine C 1000mg', '2 000 FCFA', 1),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Total', style: TextStyle(fontSize: 18)), Text('5 000 FCFA', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary))],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.push('/order-tracking'),
                    child: const Text('Payer (MTN Momo)'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(String name, String price, int qty) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(price, style: const TextStyle(color: AppColors.primary)),
            ],
          ),
          Row(
            children: [
              IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () {}),
              Text('$qty', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
