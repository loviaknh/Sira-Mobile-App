import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Ordonnances', style: Theme.of(context).textTheme.titleLarge),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: AppColors.backgroundSecondary,
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildPrescriptionItem('Ordonnance Dr. Sylla', '05 Novembre 2026 - Généraliste', Colors.blue),
          const SizedBox(height: 16),
          _buildPrescriptionItem('Ordonnance Dr. Dupont', '12 Octobre 2026 - Cardiologue', AppColors.primary),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPrescriptionItem(String title, String details, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(details),
        leading: CircleAvatar(backgroundColor: color.withOpacity(0.1), child: Icon(Icons.receipt_long, color: color)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(icon: const Icon(Icons.share, size: 20), onPressed: () {}),
            IconButton(icon: const Icon(Icons.download_rounded, size: 20), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
