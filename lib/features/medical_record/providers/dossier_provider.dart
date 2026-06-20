import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dossier_repository.dart';

final dossierRepositoryProvider = Provider((ref) => DossierRepository());

final dossierProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repository = ref.watch(dossierRepositoryProvider);
  return repository.getMyDossier();
});
