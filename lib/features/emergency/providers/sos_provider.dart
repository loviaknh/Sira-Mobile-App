import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/sos_repository.dart';

final sosRepositoryProvider = Provider((ref) => SosRepository());

enum SosState { inactive, loading, sent, error }

class SosNotifier extends Notifier<SosState> {
  String? errorMessage;
  
  @override
  SosState build() {
    return SosState.inactive;
  }

  Future<void> triggerSos() async {
    state = SosState.loading;
    try {
      final repository = ref.read(sosRepositoryProvider);
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

final sosProvider = NotifierProvider<SosNotifier, SosState>(SosNotifier.new);

final currentAlertProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.watch(sosRepositoryProvider);
  return repository.getCurrentAlert();
});
