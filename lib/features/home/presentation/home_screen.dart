import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bonjour,', style: Theme.of(context).textTheme.bodySmall),
                Text('Ahouefa 👋', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Badge(
              child: Icon(Icons.notifications_none, color: AppColors.textMain),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Mutuelle Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mutuelle active', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  const Text('Couverture 80%', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.push('/insurance'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                    ),
                    child: const Text('Voir mes garanties'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Mes services', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            // Services Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildServiceIcon(Icons.calendar_today, 'Rendez-vous'),
                _buildServiceIcon(Icons.video_call, 'Téléconsultation'),
                _buildServiceIcon(Icons.folder_shared, 'Dossier médical'),
                _buildServiceIcon(Icons.medication, 'Ordonnances'),
              ],
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12), textAlign: TextAlign.center),
      ],
    );
  }
}
