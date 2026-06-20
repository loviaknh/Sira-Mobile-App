import '../../../core/network/api_client.dart';

class SosRepository {
  Future<Map<String, dynamic>> createAlert({required double latitude, required double longitude, String? emergencyType}) async {
    final response = await ApiClient.instance.post('/sos/alert', data: {
      'latitude': latitude,
      'longitude': longitude,
      'emergencyType': emergencyType,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> getCurrentAlert() async {
    final response = await ApiClient.instance.get('/sos/me');
    return response.data;
  }

  Future<void> cancelAlert(String alertId) async {
    await ApiClient.instance.patch('/sos/$alertId/cancel');
  }
}
