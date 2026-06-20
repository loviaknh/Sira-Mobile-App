import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textMain),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Créer votre compte',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Rejoignez Sira et gérez votre santé et celle de votre famille.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 40),

              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Nom complet', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: 'name',
                      decoration: const InputDecoration(
                        hintText: 'Ex: Ahouefa H.',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 24),
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
                    Text('Email (Optionnel)', style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 8),
                    FormBuilderTextField(
                      name: 'email',
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'ahouefa@exemple.com',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              ElevatedButton(
                onPressed: () {
                  context.push('/otp');
                },
                child: const Text('Créer mon compte'),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Déjà un compte ? ', style: Theme.of(context).textTheme.bodyMedium),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Text(
                      'Se connecter',
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
