import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carnet de Vaccination', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildVaccineItem('Fièvre Jaune', 'Fait le 12/05/2023 - Valide 10 ans', Colors.green),
          const SizedBox(height: 16),
          _buildVaccineItem('Hépatite B (Rappel)', 'Prévu pour le 10/10/2026', Colors.orange),
          const SizedBox(height: 16),
          _buildVaccineItem('Tétanos', 'À jour', AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildVaccineItem(String name, String status, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(status),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.vaccines, color: color)),
      ),
    );
  }
}
