import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../auth/data/auth_repository.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomController = TextEditingController();
  final _prenomController = TextEditingController();
  final _phoneController = TextEditingController();
  final _authRepo = AuthRepository();
  bool _isLoading = false;

  Future<void> _register() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) return;
    setState(() => _isLoading = true);
    try {
      await _authRepo.registerWithEmail(_emailController.text, _passwordController.text);
      await _authRepo.syncUserWithBackend(
        nom: _nomController.text,
        prenom: _prenomController.text,
        telephone: _phoneController.text,
      );
      if (mounted) context.push('/otp');
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur: ${e.toString()}')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Créer un compte', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary)),
            const SizedBox(height: 32),
            TextField(controller: _nomController, decoration: InputDecoration(labelText: 'Nom', prefixIcon: const Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
            const SizedBox(height: 16),
            TextField(controller: _prenomController, decoration: InputDecoration(labelText: 'Prénoms', prefixIcon: const Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
            const SizedBox(height: 16),
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Téléphone', prefixIcon: const Icon(Icons.phone), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
            const SizedBox(height: 16),
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email', prefixIcon: const Icon(Icons.email), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
            const SizedBox(height: 16),
            TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Mot de passe', prefixIcon: const Icon(Icons.lock), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)))),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isLoading ? null : _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              ),
              child: _isLoading 
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('S\'inscrire', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
