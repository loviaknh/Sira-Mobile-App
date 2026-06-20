import '../../../core/network/api_client.dart';

class PaymentRepository {
  Future<Map<String, dynamic>> initializePayment({required double amount, required String method, String? description}) async {
    final response = await ApiClient.instance.post('/payments/initialize', data: {
      'amount': amount,
      'method': method,
      'description': description,
    });
    return response.data;
  }

  Future<Map<String, dynamic>> confirmPayment(String paymentId) async {
    final response = await ApiClient.instance.post('/payments/$paymentId/confirm');
    return response.data;
  }

  Future<Map<String, dynamic>> cancelPayment(String paymentId) async {
    final response = await ApiClient.instance.patch('/payments/$paymentId/cancel');
    return response.data;
  }

  Future<List<dynamic>> getHistory() async {
    final response = await ApiClient.instance.get('/payments/history');
    return response.data;
  }

  Future<Map<String, dynamic>> getReceipt(String paymentId) async {
    final response = await ApiClient.instance.get('/payments/$paymentId/receipt');
    return response.data;
  }
}
