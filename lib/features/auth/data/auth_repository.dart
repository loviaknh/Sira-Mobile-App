import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/network/api_client.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // 1. Inscription native sur Firebase
  Future<UserCredential> registerWithEmail(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // 2. Synchronisation du profil avec l'API NestJS
  Future<void> syncUserWithBackend({
    required String nom,
    required String prenom,
    required String telephone,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) throw Exception("Utilisateur non authentifié sur Firebase");

    // L'appel ApiClient va automatiquement ajouter le Bearer Token généré
    await ApiClient.instance.post('/auth/register', data: {
      'firebaseUid': user.uid,
      'email': user.email,
      'nom': nom,
      'prenom': prenom,
      'telephone': telephone,
      'role': 'PATIENT',
    });
  }

  // 3. Connexion classique
  Future<UserCredential> login(String email, String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  // 4. Déconnexion
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
