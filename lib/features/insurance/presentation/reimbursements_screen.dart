import 'package:flutter/material.dart';

class ReimbursementsScreen extends StatelessWidget {
  const ReimbursementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes Remboursements')),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: const [
          ListTile(title: Text('Pharmacie La Paix'), subtitle: Text('12 Octobre 2026 - Traité'), trailing: Text('+ 2 400 FCFA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))),
          ListTile(title: Text('Consultation Dr. Sylla'), subtitle: Text('05 Novembre 2026 - En cours'), trailing: Text('En attente', style: TextStyle(color: Colors.orange))),
        ],
      ),
    );
  }
}
