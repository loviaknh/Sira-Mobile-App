import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              // En-tête (Logo)
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.health_and_safety, color: AppColors.primary, size: 32),
                    const SizedBox(width: 8),
                    Text(
                      'Sira',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Bienvenue sur Sira',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Connectez-vous pour accéder à vos services de santé.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 40),

              // Formulaire
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Téléphone', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: 'phone',
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: '+229 01 23 45 67 89',
                        prefixIcon: Icon(Icons.phone_outlined),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text('Mot de passe', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: 'password',
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: '••••••••',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            color: AppColors.textSecondary,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Mot de passe oublié ?',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Bouton principal
              ElevatedButton(
                onPressed: () {
                  // TODO: Authentication logic
                },
                child: const Text('Se connecter'),
              ),
              const SizedBox(height: 24),

              // Alternative Biométrie
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('ou', style: Theme.of(context).textTheme.bodySmall),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.fingerprint, color: AppColors.textMain),
                label: const Text(
                  'Se connecter avec biométrie',
                  style: TextStyle(color: AppColors.textMain, fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  side: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
              ),
              const SizedBox(height: 32),

              // Lien Inscription
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Pas de compte ? ', style: Theme.of(context).textTheme.bodyMedium),
                  GestureDetector(
                    onTap: () {
                      context.push('/register');
                    },
                    child: Text(
                      'Créer mon compte',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
