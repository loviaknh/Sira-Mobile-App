import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';

class PinCreationScreen extends StatefulWidget {
  const PinCreationScreen({super.key});

  @override
  State<PinCreationScreen> createState() => _PinCreationScreenState();
}

class _PinCreationScreenState extends State<PinCreationScreen> {
  String _pin = '';

  void _onKeyPress(String key) {
    if (_pin.length < 6) {
      setState(() => _pin += key);
    }
  }

  void _onDelete() {
    if (_pin.isNotEmpty) {
      setState(() => _pin = _pin.substring(0, _pin.length - 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Création PIN',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Créez votre code PIN à 6 chiffres.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < _pin.length ? AppColors.primary : AppColors.backgroundSecondary,
                    border: Border.all(
                      color: index < _pin.length ? AppColors.primary : Colors.grey.shade300,
                    ),
                  ),
                );
              }),
            ),
            const Spacer(),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                for (int i = 1; i <= 9; i++)
                  _buildKeypadButton(i.toString(), () => _onKeyPress(i.toString())),
                const SizedBox(),
                _buildKeypadButton('0', () => _onKeyPress('0')),
                _buildKeypadButton('⌫', _onDelete, isIcon: true),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _pin.length == 6 ? () => context.push('/kyc/success') : null,
              child: const Text('Confirmer'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String label, VoidCallback onTap, {bool isIcon = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(32),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: isIcon ? AppColors.textSecondary : AppColors.textMain,
          ),
        ),
      ),
    );
  }
}
