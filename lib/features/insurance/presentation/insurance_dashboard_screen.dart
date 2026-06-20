import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class InsuranceDashboardScreen extends StatelessWidget {
  const InsuranceDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        title: Text('Ma Mutuelle', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppColors.primary, Color(0xFF0D8C49)]),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pack Famille', style: TextStyle(color: Colors.white70, fontSize: 16)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(12)),
                        child: const Text('Actif', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Couverture 80%', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text('Prochaine échéance : 15 Nov 2026', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => context.push('/insurance/payment'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primary),
                          child: const Text('Payer'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => context.push('/insurance/packages'),
                          style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.white), foregroundColor: Colors.white),
                          child: const Text('Modifier'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Mes services', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildServiceTile(context, Icons.history, 'Historique des cotisations', '/insurance/contributions'),
            _buildServiceTile(context, Icons.account_balance_wallet, 'Mes remboursements', '/insurance/reimbursements'),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceTile(BuildContext context, IconData icon, String title, String route) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: () => context.push(route),
      ),
    );
  }
}
