import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class LabResultsScreen extends StatelessWidget {
  const LabResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résultats d\'Analyses', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildLabItem('Bilan Sanguin Complet', '14 Octobre 2026 - Laboratoire BioSanté', Colors.purple),
          const SizedBox(height: 16),
          _buildLabItem('Echographie Abdominale', '02 Juin 2026 - Clinique Saint-Jean', Colors.blue),
        ],
      ),
    );
  }

  Widget _buildLabItem(String name, String details, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.science, color: color)),
        trailing: IconButton(icon: const Icon(Icons.download_rounded), onPressed: () {}),
      ),
    );
  }
}
