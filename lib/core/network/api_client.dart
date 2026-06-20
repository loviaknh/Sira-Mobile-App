import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static final Dio _dio = Dio(BaseOptions(
    // En développement, 10.0.2.2 est l'alias localhost pour l'émulateur Android.
    // IMPORTANT : Si vous testez sur un vrai téléphone physique en Wi-Fi, 
    // remplacez 10.0.2.2 par l'adresse IP locale de votre ordinateur (ex: 192.168.1.X:3000)
    baseUrl: kDebugMode ? 'http://10.0.2.2:3000' : 'https://api.sira.bj',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  static Dio get instance {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        try {
          // Injection automatique du token Firebase dans les headers de chaque requête
          User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            String? token = await user.getIdToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
        } catch (e) {
          debugPrint('Erreur lors de la récupération du token: $e');
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) {
        debugPrint('API Error: ${e.response?.statusCode} - ${e.response?.data}');
        return handler.next(e);
      },
    ));
    return _dio;
  }
}
