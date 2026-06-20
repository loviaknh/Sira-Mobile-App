import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class MedicalProfileWizardScreen extends StatefulWidget {
  const MedicalProfileWizardScreen({super.key});

  @override
  State<MedicalProfileWizardScreen> createState() => _MedicalProfileWizardScreenState();
}

class _MedicalProfileWizardScreenState extends State<MedicalProfileWizardScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  final int _totalPages = 6;

  void _nextPage() {
    if (_currentIndex < _totalPages - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      // Fin du wizard, redirection vers l'application principale
      context.go('/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: LinearProgressIndicator(
          value: (_currentIndex + 1) / _totalPages,
          backgroundColor: AppColors.backgroundSecondary,
          color: AppColors.primary,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textMain),
          onPressed: () {
            if (_currentIndex > 0) {
              _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            } else {
              context.pop();
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => context.go('/main'),
            child: Text('Ignorer', style: TextStyle(color: AppColors.textSecondary)),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(), // Empêche le swipe manuel pour forcer la validation
                  onPageChanged: (index) => setState(() => _currentIndex = index),
                  children: [
                    _buildStep(
                      title: 'Groupe sanguin',
                      subtitle: 'Cette information est cruciale en cas d\'urgence.',
                      child: FormBuilderDropdown<String>(
                        name: 'blood_type',
                        decoration: const InputDecoration(labelText: 'Sélectionnez votre groupe'),
                        items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-', 'Je ne sais pas']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                      ),
                    ),
                    _buildStep(
                      title: 'Mensurations',
                      subtitle: 'Taille et Poids pour un suivi précis.',
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'height',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Taille (cm)', suffixText: 'cm'),
                          ),
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: 'weight',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(labelText: 'Poids (kg)', suffixText: 'kg'),
                          ),
                        ],
                      ),
                    ),
                    _buildStep(
                      title: 'Allergies connues',
                      subtitle: 'Médicamenteuses ou alimentaires.',
                      child: FormBuilderTextField(
                        name: 'allergies',
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Ex: Pénicilline, Arachides...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    _buildStep(
                      title: 'Maladies chroniques',
                      subtitle: 'Avez-vous des affections de longue durée ?',
                      child: FormBuilderTextField(
                        name: 'chronic',
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Ex: Diabète, Hypertension...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    _buildStep(
                      title: 'Traitements en cours',
                      subtitle: 'Médicaments pris régulièrement.',
                      child: FormBuilderTextField(
                        name: 'treatments',
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintText: 'Ex: Metformine 500mg...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    _buildStep(
                      title: 'Contact d\'urgence',
                      subtitle: 'Personne à prévenir en cas de besoin.',
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            name: 'emergency_name',
                            decoration: const InputDecoration(labelText: 'Nom complet'),
                          ),
                          const SizedBox(height: 16),
                          FormBuilderTextField(
                            name: 'emergency_phone',
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(labelText: 'Téléphone'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _nextPage,
                child: Text(_currentIndex == _totalPages - 1 ? 'Terminer' : 'Suivant'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({required String title, required String subtitle, required Widget child}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 8),
          Text(subtitle, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 48),
          child,
        ],
      ),
    );
  }
}
