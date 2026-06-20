import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class PremiumPaymentScreen extends StatelessWidget {
  const PremiumPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paiement Cotisation'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Montant à payer', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 8),
            const Text('8 000 FCFA', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 48),
            Text('Moyen de paiement', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildPaymentMethod('MTN Mobile Money', Icons.phone_android, AppColors.emergency, true),
            const SizedBox(height: 16),
            _buildPaymentMethod('Moov Money', Icons.phone_android, Colors.blue, false),
            const SizedBox(height: 16),
            _buildPaymentMethod('Carte Bancaire', Icons.credit_card, Colors.black, false),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Paiement réussi !')));
                context.pop();
              },
              child: const Text('Confirmer le paiement'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String name, IconData icon, Color color, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? AppColors.primary : Colors.grey.shade300, width: isSelected ? 2 : 1),
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? AppColors.primary.withOpacity(0.05) : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: isSelected ? const Icon(Icons.check_circle, color: AppColors.primary) : null,
      ),
    );
  }
}
