import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class MedicalSummaryScreen extends StatelessWidget {
  const MedicalSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résumé Médical', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildInfoCard('Groupe Sanguin', 'O+', Icons.bloodtype, Colors.red),
            const SizedBox(height: 16),
            _buildInfoCard('Allergies', 'Pénicilline', Icons.warning, Colors.orange),
            const SizedBox(height: 16),
            _buildInfoCard('Maladies Chroniques', 'Asthme léger', Icons.healing, AppColors.primary),
            const SizedBox(height: 16),
            _buildInfoCard('Traitements', 'Ventoline (au besoin)', Icons.medication, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(icon, color: color)),
          const SizedBox(width: 16),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ]),
        ],
      ),
    );
  }
}
