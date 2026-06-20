import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../providers/payment_provider.dart';

class PremiumPaymentScreen extends ConsumerStatefulWidget {
  const PremiumPaymentScreen({super.key});

  @override
  ConsumerState<PremiumPaymentScreen> createState() => _PremiumPaymentScreenState();
}

class _PremiumPaymentScreenState extends ConsumerState<PremiumPaymentScreen> {
  String _selectedMethod = 'MTN_MOMO';

  @override
  Widget build(BuildContext context) {
    final paymentState = ref.watch(paymentProvider);

    ref.listen<PaymentStateData>(paymentProvider, (previous, next) {
      if (next.state == PaymentState.awaitingPin) {
        _showPinDialog();
      } else if (next.state == PaymentState.success) {
        _showSuccessDialog(next.receipt);
      } else if (next.state == PaymentState.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Échec: ${next.errorMessage}'), backgroundColor: Colors.red),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Paiement Cotisation'), backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Montant à payer', style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 8),
            const Text('5 000 FCFA', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 48),
            Text('Moyen de paiement', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildPaymentMethod('MTN Mobile Money', 'MTN_MOMO', Icons.phone_android, AppColors.emergency),
            const SizedBox(height: 16),
            _buildPaymentMethod('Moov Money', 'MOOV_MONEY', Icons.phone_android, Colors.blue),
            const SizedBox(height: 16),
            _buildPaymentMethod('Carte Bancaire', 'BANK_CARD', Icons.credit_card, Colors.black),
            const Spacer(),
            ElevatedButton(
              onPressed: paymentState.state == PaymentState.initializing || paymentState.state == PaymentState.processing
                  ? null
                  : () {
                      ref.read(paymentProvider.notifier).initiatePayment(amount: 5000, method: _selectedMethod);
                    },
              child: paymentState.state == PaymentState.initializing
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Text('Confirmer le paiement'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod(String name, String methodValue, IconData icon, Color color) {
    final isSelected = _selectedMethod == methodValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = methodValue;
        });
      },
      child: Container(
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
      ),
    );
  }

  void _showPinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                color: AppColors.emergency,
                child: const Text('MTN', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              const Text('Mobile Money'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Montant : 5 000 FCFA'),
              const Text('Sira Mutuelle', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              const Text('Entrez votre code PIN :'),
              const SizedBox(height: 8),
              TextField(
                obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '••••',
                ),
                onSubmitted: (pin) {
                  Navigator.of(context).pop();
                  ref.read(paymentProvider.notifier).confirmPin(pin);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(paymentProvider.notifier).cancelPayment();
              },
              child: const Text('Annuler', style: TextStyle(color: Colors.grey)),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(Map<String, dynamic>? receipt) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 80),
              const SizedBox(height: 16),
              const Text('Paiement réussi !', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text('Réf: ${receipt?['transactionId'] ?? 'Inconnue'}'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  context.pop(); // Go back to previous screen
                },
                child: const Text('Fermer'),
              ),
            ],
          ),
        );
      },
    );
  }
}
