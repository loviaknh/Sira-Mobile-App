import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Mes Rendez-vous', style: Theme.of(context).textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: AppColors.textMain),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildAppointmentCard(
            context: context,
            date: '12 Octobre 2026',
            time: '14:30',
            doctor: 'Dr. Jean Dupont',
            specialty: 'Cardiologue',
            status: 'Confirmé',
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          _buildAppointmentCard(
            context: context,
            date: '05 Novembre 2026',
            time: '09:00',
            doctor: 'Dr. Aminata Sylla',
            specialty: 'Généraliste',
            status: 'En attente',
            color: Colors.orange,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        icon: const Icon(Icons.add),
        label: const Text('Nouveau RDV'),
      ),
    );
  }

  Widget _buildAppointmentCard({
    required BuildContext context,
    required String date,
    required String time,
    required String doctor,
    required String specialty,
    required String status,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              Text('$date à $time', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.backgroundSecondary,
                radius: 24,
                child: Icon(Icons.person, color: AppColors.textSecondary),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctor, style: Theme.of(context).textTheme.titleMedium),
                  Text(specialty, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
