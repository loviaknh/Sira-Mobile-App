import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  static final Dio _dio = Dio(BaseOptions(
    // En développement via CÂBLE USB physique :
    // Utilisez 'http://127.0.0.1:3000' ET exécutez la commande suivante dans votre terminal PC :
    // adb reverse tcp:3000 tcp:3000
    //
    // En production : l'API sera hébergée sur Render (ex: https://sira-backend-api.onrender.com)
    baseUrl: kDebugMode ? 'http://127.0.0.1:3000' : 'https://sira-backend-api.onrender.com',
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
