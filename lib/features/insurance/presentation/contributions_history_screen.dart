import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/payment_provider.dart';
import '../../../core/theme/app_colors.dart';

class ContributionsHistoryScreen extends ConsumerWidget {
  const ContributionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(paymentHistoryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Historique cotisations')),
      body: historyAsync.when(
        data: (history) {
          if (history.isEmpty) {
            return const Center(child: Text("Aucun paiement trouvé."));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.refresh(paymentHistoryProvider),
            child: ListView.builder(
              padding: const EdgeInsets.all(24.0),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final payment = history[index];
                final isSuccess = payment['statut'] == 'REUSSI';
                return ListTile(
                  leading: Icon(
                    isSuccess ? Icons.check_circle : Icons.error,
                    color: isSuccess ? Colors.green : Colors.red,
                  ),
                  title: Text(payment['description'] ?? 'Cotisation'),
                  subtitle: Text('Réf: ${payment['referenceExterne']}'),
                  trailing: Text(
                    '${payment['montant']} FCFA',
                    style: TextStyle(fontWeight: FontWeight.bold, color: isSuccess ? Colors.green : Colors.red),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (e, st) => Center(child: Text("Erreur: $e")),
      ),
    );
  }
}
