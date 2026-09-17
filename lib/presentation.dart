import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'profil.dart' hide BubbleTheme, localizedSlides, localizedUi, ArcDeTriomphePainter;

class PresentationScreen extends StatefulWidget {
  final String languageCode;
  const PresentationScreen({super.key, this.languageCode = 'fr'});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  late String _currentLanguage;

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.languageCode;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getSlideIcon(String? iconType) {
    switch (iconType) {
      case 'compass':
        return Icons.explore_rounded;
      case 'landscape':
        return Icons.landscape_rounded;
      case 'stars':
        return Icons.auto_awesome_rounded;
      case 'explore':
        return Icons.travel_explore_rounded;
      default:
        return Icons.location_on_rounded;
    }
  }

  void _cycleLanguage() {
    setState(() {
      if (_currentLanguage == 'fr') {
        _currentLanguage = 'en';
      } else if (_currentLanguage == 'en') {
        _currentLanguage = 'ar';
      } else {
        _currentLanguage = 'fr';
      }
    });
  }

  void _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(languageCode: _currentLanguage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final slides = localizedSlides[_currentLanguage] ?? localizedSlides['fr'] ?? [];
    final uiText = localizedUi[_currentLanguage] ?? localizedUi['fr'] ?? {};
    final isRtl = _currentLanguage == 'ar';

    final String nextLabel = uiText['next'] ?? 'Continuer';
    final String finishLabel = uiText['finish'] ?? 'Créer mon profil';
    final String countryLabel = uiText['country'] ?? 'France';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        body: Stack(
          children: [
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: BubbleTheme.primaryGradientStart.withOpacity(0.15),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: _cycleLanguage,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: BubbleTheme.cardDark,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: Colors.white.withOpacity(0.1)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.language_rounded, color: BubbleTheme.accentGold, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  _currentLanguage == 'fr'
                                      ? '🇫🇷 FR'
                                      : _currentLanguage == 'en'
                                      ? '🇬🇧 EN'
                                      : '🇸🇦 AR',
                                  style: const TextStyle(
                                    color: BubbleTheme.textLight,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 18,
                              height: 14,
                              child: CustomPaint(
                                painter: ArcDeTriomphePainter(color: BubbleTheme.accentGold),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              countryLabel,
                              style: const TextStyle(
                                color: BubbleTheme.textLight,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 75),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: slides.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        final slide = slides[index];
                        final tag = slide["tag"] ?? '';
                        final title = slide["title"] ?? '';
                        final highlight = slide["highlight"] ?? '';
                        final description = slide["description"] ?? '';
                        final iconType = slide["icon"];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          BubbleTheme.primaryGradientStart.withOpacity(0.2),
                                          BubbleTheme.primaryGradientEnd.withOpacity(0.2),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 88,
                                    height: 88,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: LinearGradient(
                                        colors: [
                                          BubbleTheme.primaryGradientStart,
                                          BubbleTheme.primaryGradientEnd,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Icon(
                                      _getSlideIcon(iconType),
                                      size: 38,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                                decoration: BoxDecoration(
                                  color: BubbleTheme.cardDark,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.06),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: BubbleTheme.primaryGradientStart.withOpacity(0.12),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        tag,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: BubbleTheme.primaryGradientStart,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Text(
                                      title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w800,
                                        color: BubbleTheme.textLight,
                                        letterSpacing: -0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      highlight,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: BubbleTheme.accentGold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      description,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: BubbleTheme.textMuted,
                                        height: 1.6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            slides.length,
                                (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentIndex == index ? 28 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? BubbleTheme.primaryGradientEnd
                                    : Colors.white.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                BubbleTheme.primaryGradientStart,
                                BubbleTheme.primaryGradientEnd,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                            onPressed: () {
                              if (_currentIndex == slides.length - 1) {
                                _finishOnboarding();
                              } else {
                                _controller.jumpToPage(_currentIndex + 1);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _currentIndex == slides.length - 1 ? finishLabel : nextLabel,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  isRtl ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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