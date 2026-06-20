import 'package:flutter/material.dart';

class ContributionsHistoryScreen extends StatelessWidget {
  const ContributionsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Historique cotisations')),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: const [
          ListTile(title: Text('Octobre 2026'), subtitle: Text('Payé via MTN Momo'), trailing: Text('8 000 FCFA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))),
          ListTile(title: Text('Septembre 2026'), subtitle: Text('Payé via Carte'), trailing: Text('8 000 FCFA', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green))),
        ],
      ),
    );
  }
}
