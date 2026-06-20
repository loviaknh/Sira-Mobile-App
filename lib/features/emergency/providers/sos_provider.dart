import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/sos_repository.dart';

final sosRepositoryProvider = Provider((ref) => SosRepository());

enum SosState { inactive, loading, sent, error }

class SosNotifier extends StateNotifier<SosState> {
  final SosRepository repository;
  String? errorMessage;
  
  SosNotifier(this.repository) : super(SosState.inactive);

  Future<void> triggerSos() async {
    state = SosState.loading;
    try {
      // Coordonnées GPS simulées (Cotonou) pour la phase 15
      await repository.createAlert(latitude: 6.3703, longitude: 2.3912, emergencyType: 'URGENCE_MEDICALE');
      state = SosState.sent;
    } catch (e) {
      errorMessage = e.toString();
      state = SosState.error;
    }
  }

  void reset() {
    state = SosState.inactive;
    errorMessage = null;
  }
}

final sosProvider = StateNotifierProvider<SosNotifier, SosState>((ref) {
  return SosNotifier(ref.watch(sosRepositoryProvider));
});

final currentAlertProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.watch(sosRepositoryProvider);
  return repository.getCurrentAlert();
});
