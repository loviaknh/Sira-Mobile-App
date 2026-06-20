import '../../../core/network/api_client.dart';

class DossierRepository {
  Future<Map<String, dynamic>> getMyDossier() async {
    try {
      final response = await ApiClient.instance.get('/dossiers/me');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
