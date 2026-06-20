import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Mon Profil', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text('Ahouefa H.', style: Theme.of(context).textTheme.headlineMedium),
                Text('NPI: 1234 5678 9012', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
              ],
            ),
          ),
          const SizedBox(height: 48),
          _buildListTile(context, Icons.person_outline, 'Informations personnelles'),
          _buildListTile(context, Icons.health_and_safety_outlined, 'Mon profil sanitaire'),
          _buildListTile(context, Icons.shield_outlined, 'Ma Mutuelle'),
          _buildListTile(context, Icons.payment_outlined, 'Moyens de paiement'),
          _buildListTile(context, Icons.settings_outlined, 'Paramètres'),
          const SizedBox(height: 24),
          ListTile(
            onTap: () => context.go('/login'),
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Se déconnecter', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
        trailing: const Icon(Icons.chevron_right, color: AppColors.textSecondary),
        onTap: () {},
      ),
    );
  }
}
