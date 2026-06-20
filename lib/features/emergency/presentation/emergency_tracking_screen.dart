import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/socket_client.dart';
import '../providers/sos_provider.dart';

class EmergencyTrackingScreen extends ConsumerStatefulWidget {
  const EmergencyTrackingScreen({super.key});

  @override
  ConsumerState<EmergencyTrackingScreen> createState() => _EmergencyTrackingScreenState();
}

class _EmergencyTrackingScreenState extends ConsumerState<EmergencyTrackingScreen> {
  String _status = 'EN_ATTENTE';
  String _ambulanceInfo = 'Recherche en cours...';

  @override
  void initState() {
    super.initState();
    _initSocket();
  }

  Future<void> _initSocket() async {
    final client = SocketClient();
    await client.connect();

    client.socket?.on('sos_update', (data) {
      if (mounted) {
        setState(() {
          _status = data['alert']['statut'] ?? 'EN_ATTENTE';
          if (_status == 'EN_COURS') {
            _ambulanceInfo = 'SAMU Cotonou - Unité 4 (Arrivée estimée: 4 min)';
          }
        });

        if (_status == 'ANNULE' || _status == 'TERMINE') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Urgence terminée ou annulée')));
          context.go('/main');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final alertAsync = ref.watch(currentAlertProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Suivi de l\'Urgence'), backgroundColor: AppColors.emergency, foregroundColor: Colors.white),
      body: alertAsync.when(
        data: (alert) {
          if (alert != null && alert.isNotEmpty) {
             SocketClient().joinSosRoom(alert['id']);
          }

          return Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: const Center(child: Icon(Icons.map, size: 100, color: Colors.grey)),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
                child: Column(
                  children: [
                    Text('Statut', style: const TextStyle(color: Colors.grey)),
                    Text(
                      _status == 'EN_ATTENTE' ? 'Recherche d\'une ambulance...' : 'Ambulance en route',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.emergency),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ListTile(
                      leading: const CircleAvatar(backgroundColor: AppColors.backgroundSecondary, child: Icon(Icons.airport_shuttle, color: AppColors.primary)),
                      title: Text(_ambulanceInfo),
                      subtitle: const Text('Restez calme, les secours arrivent.'),
                      trailing: IconButton(icon: const Icon(Icons.phone, color: Colors.green), onPressed: () {}),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                         context.pop();
                      },
                      child: const Text('Fermer / Retour', style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.emergency)),
        error: (e, st) => Center(child: Text('Erreur: $e')),
      ),
    );
  }
}
