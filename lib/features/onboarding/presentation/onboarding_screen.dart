import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Toute votre santé dans une seule application.',
      'description': 'Accédez à votre dossier médical, vos ordonnances et vos rendez-vous où que vous soyez.',
      'icon': 'health_and_safety', 
    },
    {
      'title': 'Consultez sans vous déplacer.',
      'description': 'Échangez avec un professionnel de santé directement depuis votre téléphone.',
      'icon': 'video_camera_front',
    },
    {
      'title': 'Une santé accessible partout au Bénin.',
      'description': 'Trouvez les établissements, pharmacies et services d\'urgence proches de vous.',
      'icon': 'map',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Bouton "Passer"
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 16.0),
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () => context.go('/login'),
                  child: Text(
                    'Passer',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
            
            // Zone de Slider
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  
                  // Mapping pour icône de remplacement
                  IconData iconData = Icons.health_and_safety_rounded;
                  if (page['icon'] == 'video_camera_front') iconData = Icons.video_chat_rounded;
                  if (page['icon'] == 'map') iconData = Icons.map_rounded;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Placeholder pour l'illustration réaliste (style premium)
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundSecondary,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Icon(
                              iconData,
                              size: 100,
                              color: AppColors.primary.withOpacity(0.5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                                fontSize: 28,
                                height: 1.2,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          page['description']!,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                                height: 1.5,
                              ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            
            // Zone inférieure : Indicateurs et Bouton
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: _pages.length,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                      activeDotColor: AppColors.primary,
                      dotColor: Color(0xFFE5E7EB),
                      expansionFactor: 4,
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _nextPage,
                      child: Text(
                        _currentPage == _pages.length - 1 ? 'Commencer' : 'Suivant',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
