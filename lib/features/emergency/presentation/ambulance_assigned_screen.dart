import 'package:flutter/material.dart';

class AmbulanceAssignedScreen extends StatelessWidget {
  const AmbulanceAssignedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails Équipe')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 16),
            const Text('Chauffeur : Marc Dubois', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text('Unité SAMU 4', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 48),
            const ListTile(
              leading: Icon(Icons.medical_services, color: Colors.red),
              title: Text('Matériel à bord'),
              subtitle: Text('Défibrillateur, Oxygène'),
            ),
          ],
        ),
      ),
    );
  }
}
