import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique Médical', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildHistoryItem('Consultation Générale', '12 Septembre 2026 - Dr. Sylla', Icons.history, Colors.blue),
          const SizedBox(height: 16),
          _buildHistoryItem('Vaccination Fièvre Jaune', '12 Mai 2023 - Centre de Santé', Icons.vaccines, Colors.green),
          const SizedBox(height: 16),
          _buildHistoryItem('Opération Appendicite', 'Mars 2018 - Clinique Les Oliviers', Icons.local_hospital, Colors.red),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(String title, String details, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
      ),
    );
  }
}
