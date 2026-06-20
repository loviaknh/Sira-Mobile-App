import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dossier_provider.dart';

class MedicalRecordScreen extends ConsumerWidget {
  const MedicalRecordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dossierAsync = ref.watch(dossierProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Dossier Médical', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: dossierAsync.when(
        data: (data) {
          final numeroDossier = data['numeroDossier'] ?? 'DM-XXX';
          final consultations = data['consultations'] as List<dynamic>? ?? [];
          final documents = data['documents'] as List<dynamic>? ?? [];

          return Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.folder_shared, color: AppColors.primary),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Numéro de dossier', style: Theme.of(context).textTheme.bodySmall),
                        Text(numeroDossier, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(24.0),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildRecordCard(context, Icons.person, 'Résumé Médical', 'Groupe Sanguin, Allergies', Colors.teal, '/medical-summary'),
                    _buildRecordCard(context, Icons.medication, 'Ordonnances', '${documents.length} documents', Colors.blue, '/prescriptions'),
                    _buildRecordCard(context, Icons.science, 'Analyses', '0 résultats', Colors.purple, '/lab-results'),
                    _buildRecordCard(context, Icons.vaccines, 'Vaccins', 'À jour', AppColors.primary, '/vaccinations'),
                    _buildRecordCard(context, Icons.history, 'Antécédents', '${consultations.length} Consultations', Colors.orange, '/medical-history'),
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 16),
              const Text('Impossible de charger le dossier médical'),
              TextButton(onPressed: () => ref.refresh(dossierProvider), child: const Text('Réessayer'))
            ],
          )
        ),
      ),
    );
  }

  Widget _buildRecordCard(BuildContext context, IconData icon, String title, String subtitle, Color color, String route) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const Spacer(),
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
        ],
      ),
      ),
    );
  }
}
