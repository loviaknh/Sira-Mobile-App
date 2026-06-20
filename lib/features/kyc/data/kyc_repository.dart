import '../../../core/network/api_client.dart';

class KycRepository {
  Future<Map<String, dynamic>> verifyNip(String nip) async {
    try {
      final response = await ApiClient.instance.post('/patients/kyc', data: {
        'nip': nip,
      });
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
