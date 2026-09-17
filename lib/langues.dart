import 'package:flutter/material.dart';
import 'constants.dart';
import 'presentation.dart';

class LanguesPage extends StatefulWidget {
  final bool isProfileCreated;

  const LanguesPage({super.key, required this.isProfileCreated});

  @override
  State<LanguesPage> createState() => _LanguesPageState();
}

class _LanguesPageState extends State<LanguesPage> {
  String _selectedCode = 'fr';

  void _confirmSelection() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PresentationScreen(languageCode: _selectedCode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguagesList = localizedLanguagesData[_selectedCode] ?? localizedLanguagesData['fr']!;
    final selectedLangItem = currentLanguagesList.firstWhere(
          (element) => element['code'] == _selectedCode,
      orElse: () => currentLanguagesList.first,
    );
    final String currentQuestion = selectedLangItem['question'] ?? '';

    final uiText = localizedUi[_selectedCode] ?? localizedUi['fr'] ?? {};
    final String welcomeMessage = uiText['welcome'] ?? 'Bienvenue !';
    final String validateText = uiText['validate'] ?? 'Valider';

    return Directionality(
      textDirection: _selectedCode == 'ar' ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: BubbleTheme.primaryGradientStart.withOpacity(0.12),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: SizedBox(
                      height: 70,
                      child: Text(
                        currentQuestion,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: BubbleTheme.textLight,
                          height: 1.35,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: currentLanguagesList.map((item) {
                            final String code = item['code'] ?? 'fr';
                            final String name = item['name'] ?? '';
                            final Color color = item['color'] ?? BubbleTheme.coral;
                            final IconData icon = item['icon'] ?? Icons.language;
                            final bool isSelected = (code == _selectedCode);

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(22),
                                onTap: () {
                                  setState(() {
                                    _selectedCode = code;
                                  });
                                },
                                child: Container(
                                  height: 78,
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    color: isSelected ? color.withOpacity(0.12) : BubbleTheme.cardDark,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: isSelected ? color : Colors.white.withOpacity(0.06),
                                      width: isSelected ? 2.0 : 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected ? color.withOpacity(0.25) : Colors.white.withOpacity(0.05),
                                        ),
                                        child: Icon(
                                          icon,
                                          color: isSelected ? color : Colors.white70,
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected ? color : Colors.white24,
                                            width: 2,
                                          ),
                                          color: isSelected ? color : Colors.transparent,
                                        ),
                                        child: isSelected
                                            ? const Center(
                                          child: Icon(
                                            Icons.check_rounded,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        )
                                            : null,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: BubbleTheme.cardDark,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: BubbleTheme.primaryGradientStart.withOpacity(0.4), width: 1.5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              welcomeMessage,
                              style: const TextStyle(
                                color: BubbleTheme.textLight,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              selectedLangItem['name'] ?? '',
                              style: TextStyle(
                                color: selectedLangItem['color'] ?? BubbleTheme.accentGold,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [BubbleTheme.primaryGradientStart, BubbleTheme.primaryGradientEnd],
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          onPressed: _confirmSelection,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                validateText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                _selectedCode == 'ar' ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}