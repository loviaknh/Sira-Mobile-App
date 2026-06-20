import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Dossier Médical', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(24.0),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          _buildRecordCard(context, Icons.person, 'Résumé Médical', 'Groupe Sanguin, Allergies', Colors.teal, '/medical-summary'),
          _buildRecordCard(context, Icons.medication, 'Ordonnances', '12 documents', Colors.blue, '/prescriptions'),
          _buildRecordCard(context, Icons.science, 'Analyses', '4 résultats', Colors.purple, '/lab-results'),
          _buildRecordCard(context, Icons.vaccines, 'Vaccins', 'À jour', AppColors.primary, '/vaccinations'),
          _buildRecordCard(context, Icons.history, 'Antécédents', 'Consultations, Opérations', Colors.orange, '/medical-history'),
        ],
      ),
    );
  }

  Widget _buildRecordCard(BuildContext context, IconData icon, String title, String subtitle, Color color, String route) {
    return GestureDetector(
      onTap: () => context.push(route),
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
    );
  }
}
