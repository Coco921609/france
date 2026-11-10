import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'accueil.dart';

// ==========================================
// 1. THEME & DESIGN SYSTEM PREMIUM
// ==========================================
class BubbleTheme {
  static const Color background = Color(0xFF0B0E17);
  static const Color cardDark = Color(0xFF161B26);
  static const Color cardBorder = Color(0xFF232B3E);
  static const Color primaryGradientStart = Color(0xFF6366F1);
  static const Color primaryGradientEnd = Color(0xFFEC4899);
  static const Color accentGold = Color(0xFFF59E0B);
  static const Color textLight = Color(0xFFF8FAFC);
  static const Color textMuted = Color(0xFF94A3B8);

  static const Color coral = Color(0xFFFF5252);
  static const Color yellow = Color(0xFFFFB300);
  static const Color teal = Color(0xFF00BFA5);
}

final Map<String, List<Map<String, dynamic>>> localizedLanguagesData = {
  'fr': [
    {
      'code': 'fr',
      'name': 'Français',
      'question': 'Quelle langue souhaitez-vous utiliser ?',
      'color': BubbleTheme.coral,
      'icon': Icons.language_rounded,
    },
    {
      'code': 'en',
      'name': 'Anglais',
      'question': 'Quelle langue souhaitez-vous utiliser ?',
      'color': BubbleTheme.yellow,
      'icon': Icons.public_rounded,
    },
    {
      'code': 'ar',
      'name': 'Arabe',
      'question': 'Quelle langue souhaitez-vous utiliser ?',
      'color': BubbleTheme.teal,
      'icon': Icons.translate_rounded,
    },
  ],
  'en': [
    {
      'code': 'fr',
      'name': 'French',
      'question': 'Which language would you like to use ?',
      'color': BubbleTheme.coral,
      'icon': Icons.language_rounded,
    },
    {
      'code': 'en',
      'name': 'English',
      'question': 'Which language would you like to use ?',
      'color': BubbleTheme.yellow,
      'icon': Icons.public_rounded,
    },
    {
      'code': 'ar',
      'name': 'Arabic',
      'question': 'Which language would you like to use ?',
      'color': BubbleTheme.teal,
      'icon': Icons.translate_rounded,
    },
  ],
  'ar': [
    {
      'code': 'fr',
      'name': 'الفرنسية',
      'question': 'ما هي اللغة التي ترغب في استخدامها ؟',
      'color': BubbleTheme.coral,
      'icon': Icons.language_rounded,
    },
    {
      'code': 'en',
      'name': 'الإنجليزية',
      'question': 'ما هي اللغة التي ترغب في استخدامها ؟',
      'color': BubbleTheme.yellow,
      'icon': Icons.public_rounded,
    },
    {
      'code': 'ar',
      'name': 'العربية',
      'question': 'ما هي اللغة التي ترغب في استخدامها ؟',
      'color': BubbleTheme.teal,
      'icon': Icons.translate_rounded,
    },
  ],
};

final Map<String, List<Map<String, String>>> localizedSlides = {
  'fr': [
    {
      "tag": "01. DÉCOUVERTES",
      "title": "Saviez-vous ?",
      "highlight": "Paysages cachés",
      "description": "La France abrite des décors spectaculaires et méconnus que peu de gens ont explorés.",
      "icon": "compass"
    },
    {
      "tag": "02. ÉVASION",
      "title": "Décors incroyables !",
      "highlight": "Dépaysement total",
      "description": "Altschlossfelsen, sentier des Ocres : des lieux uniques aux allures de paysages lointains.",
      "icon": "landscape"
    },
    {
      "tag": "03. INSOLITE",
      "title": "Trésors cachés !",
      "highlight": "Merveilles uniques",
      "description": "Sortez des sentiers battus et partez à la recherche de sites extraordinaires.",
      "icon": "stars"
    },
    {
      "tag": "04. EXPLORATION",
      "title": "Prêt pour l'aventure ?",
      "highlight": "Nouveau regard",
      "description": "Découvrez le Pays sous un tout autre angle dès maintenant.",
      "icon": "explore"
    },
  ],
  'en': [
    {
      "tag": "01. DISCOVERIES",
      "title": "Did you know ?",
      "highlight": "Hidden landscapes",
      "description": "France holds spectacular and little-known spots that few people have explored.",
      "icon": "compass"
    },
    {
      "tag": "02. GETAWAY",
      "title": "Incredible scenery !",
      "highlight": "Total escape",
      "description": "Altschlossfelsen, Ochre Trail: unique places resembling distant landscapes.",
      "icon": "landscape"
    },
    {
      "tag": "03. UNUSUAL",
      "title": "Hidden treasures !",
      "highlight": "Unique wonders",
      "description": "Get off the beaten path and explore extraordinary places.",
      "icon": "stars"
    },
    {
      "tag": "04. EXPLORATION",
      "title": "Ready for adventure ?",
      "highlight": "Fresh perspective",
      "description": "Discover the Country from a whole new angle right now.",
      "icon": "explore"
    },
  ],
  'ar': [
    {
      "tag": "01. اكتشافات",
      "title": "هل تعلم ؟",
      "highlight": "مناظر مخفية",
      "description": "تضم فرنسا مناظر طبيعية خلابة وغير معروفة لم يستكشفها إلا القليل.",
      "icon": "compass"
    },
    {
      "tag": "02. هروب",
      "title": "مناظر لا تصدق !",
      "highlight": "تغيير جو كامل",
      "description": "آلتشلوفسفيلسن، مسار المغرة : أماكن فريدة تشبه المناظر الطبيعية البعيدة.",
      "icon": "landscape"
    },
    {
      "tag": "03. غريب",
      "title": "كنوز مخفية !",
      "highlight": "عجائب فريدة",
      "description": "اخرج عن الطرق المألوفة وابحث عن مواقع استثنائية.",
      "icon": "stars"
    },
    {
      "tag": "04. استكشاف",
      "title": "مستعد للمغامرة ؟",
      "highlight": "نظرة جديدة",
      "description": "اكتشف البلاد من منظور آخر تماماً ابتداءً من الآن.",
      "icon": "explore"
    },
  ],
};

final Map<String, Map<String, String>> localizedUi = {
  'fr': {
    'welcome': 'Bienvenue !',
    'validate': 'Valider',
    'next': 'Continuer',
    'finish': 'Créer mon profil',
    'country': 'France',
  },
  'en': {
    'welcome': 'Welcome !',
    'validate': 'Validate',
    'next': 'Continue',
    'finish': 'Create my profile',
    'country': 'France',
  },
  'ar': {
    'welcome': 'مرحبًا !',
    'validate': 'تأكيد',
    'next': 'متابعة',
    'finish': 'إنشاء ملفي الشخصي',
    'country': 'فرنسا',
  },
};

// ==========================================
// 2. PAINTER ARC DE TRIOMPHE
// ==========================================
class ArcDeTriomphePainter extends CustomPainter {
  final Color color;
  ArcDeTriomphePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final outerRect = Rect.fromLTWH(0, 0, size.width, size.height);
    path.addRRect(RRect.fromRectAndRadius(outerRect, const Radius.circular(2)));

    final archWidth = size.width * 0.4;
    final archHeight = size.height * 0.6;
    final archLeft = (size.width - archWidth) / 2;
    final archTop = size.height - archHeight;

    final archRect = Rect.fromLTWH(archLeft, archTop, archWidth, archHeight);
    final archPath = Path()
      ..addRRect(RRect.fromRectAndCorners(
        archRect,
        topLeft: const Radius.circular(8),
        topRight: const Radius.circular(8),
      ));

    final finalPath = Path.combine(PathOperation.difference, path, archPath);
    canvas.drawPath(finalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ==========================================
// 3. PAGE CHOIX DES LANGUES
// ==========================================
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
                top: -120,
                left: -80,
                child: Container(
                  width: 320,
                  height: 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        BubbleTheme.primaryGradientStart.withOpacity(0.25),
                        Colors.transparent,
                      ],
                    ),
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
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: BubbleTheme.textLight,
                          height: 1.3,
                          letterSpacing: -0.3,
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

                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
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
                                    color: isSelected ? color.withOpacity(0.14) : BubbleTheme.cardDark,
                                    borderRadius: BorderRadius.circular(22),
                                    border: Border.all(
                                      color: isSelected ? color : BubbleTheme.cardBorder,
                                      width: isSelected ? 2.0 : 1.0,
                                    ),
                                    boxShadow: isSelected
                                        ? [
                                      BoxShadow(
                                        color: color.withOpacity(0.25),
                                        blurRadius: 16,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                        : [],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 46,
                                        height: 46,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected ? color.withOpacity(0.25) : Colors.white.withOpacity(0.04),
                                        ),
                                        child: Icon(
                                          icon,
                                          color: isSelected ? color : Colors.white60,
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
                                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 26,
                                        height: 26,
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
                                            size: 16,
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
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
                                fontWeight: FontWeight.w700,
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
                          boxShadow: [
                            BoxShadow(
                              color: BubbleTheme.primaryGradientEnd.withOpacity(0.35),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
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
                                  fontSize: 14,
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

// ==========================================
// 4. PAGE PRESENTATION (ONBOARDING)
// ==========================================
class PresentationScreen extends StatefulWidget {
  final String languageCode;
  const PresentationScreen({super.key, this.languageCode = 'fr'});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

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

  void _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(languageCode: widget.languageCode),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final slides = localizedSlides[widget.languageCode] ?? localizedSlides['fr'] ?? [];
    final uiText = localizedUi[widget.languageCode] ?? localizedUi['fr'] ?? {};
    final isRtl = widget.languageCode == 'ar';

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
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      BubbleTheme.primaryGradientStart.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
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
                        const SizedBox(width: 40),
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
                        const SizedBox(width: 40),
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
                                    width: 140,
                                    height: 140,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: RadialGradient(
                                        colors: [
                                          BubbleTheme.primaryGradientEnd.withOpacity(0.3),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 92,
                                    height: 92,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: const LinearGradient(
                                        colors: [
                                          BubbleTheme.primaryGradientStart,
                                          BubbleTheme.primaryGradientEnd,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: BubbleTheme.primaryGradientStart.withOpacity(0.4),
                                          blurRadius: 20,
                                          offset: const Offset(0, 6),
                                        ),
                                      ],
                                    ),
                                    child: Icon(
                                      _getSlideIcon(iconType),
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 36),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                                decoration: BoxDecoration(
                                  color: BubbleTheme.cardDark,
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: BubbleTheme.cardBorder,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: BubbleTheme.primaryGradientStart.withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: BubbleTheme.primaryGradientStart.withOpacity(0.3),
                                          width: 1,
                                        ),
                                      ),
                                      child: Text(
                                        tag,
                                        style: const TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                          color: BubbleTheme.primaryGradientStart,
                                          letterSpacing: 1.2,
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
                                        fontWeight: FontWeight.w700,
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
                                (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
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
                            boxShadow: [
                              BoxShadow(
                                color: BubbleTheme.primaryGradientEnd.withOpacity(0.35),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
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

// ==========================================
// 5. PAGE DE PROFIL ULTRA DESIGN & PRO
// ==========================================
class ProfileScreen extends StatefulWidget {
  final String languageCode;
  const ProfileScreen({super.key, this.languageCode = 'fr'});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  String _selectedGenre = 'Homme';
  bool _isMale = true;
  Color _selectedThemeColor = const Color(0xFF6366F1);
  Color _accent = const Color(0xFF6366F1); // couleur animée (transition douce)
  late String _selectedAvatar;
  late String _currentLang;

  bool _hasNameError = false;
  late AnimationController _orbitController;
  late AnimationController _entranceController;
  late AnimationController _pulseController;

  final List<Color> _themeColors = [
    const Color(0xFF6366F1),
    const Color(0xFFEC4899),
    const Color(0xFFEF4444),
    const Color(0xFFF59E0B),
    const Color(0xFF10B981),
    const Color(0xFF3B82F6),
  ];

  final List<String> _avatarsHommes = [
    '👨', '👨‍🦰', '👨‍🦱', '👨‍🦳', '🧔', '👦', '🤵', '👨‍🚀', '👨‍✈️', '🧑‍💼', '🕵️‍♂️', '🥷',
  ];

  final List<String> _avatarsFemmes = [
    '👩', '👩‍🦰', '👩‍🦱', '👩‍🦳', '👱‍♀️', '👰', '💃', '👸', '👩‍💻', '👩‍🎨', '👩‍🚀', '👩‍🔬',
  ];

  final Map<String, Map<String, String>> _localizedText = {
    'fr': {
      'title': 'Créez votre profil',
      'subtitle': 'Personnalisez votre expérience de voyage',
      'nameLabel': 'Nom et prénom',
      'nameHint': 'Entrez votre nom complet',
      'genreLabel': 'Sélectionnez votre genre',
      'genreMan': 'Homme',
      'genreWoman': 'Femme',
      'themeLabel': 'Couleur du thème',
      'langLabel': 'Langue de l\'application',
      'avatarLabel': 'Choisissez votre avatar',
      'button': 'Découvrir le Pays',
      'langFr': 'Français',
      'langEn': 'Anglais',
      'langAr': 'Arabe',
    },
    'en': {
      'title': 'Create your profile',
      'subtitle': 'Customize your travel experience',
      'nameLabel': 'Full Name',
      'nameHint': 'Enter your full name',
      'genreLabel': 'Select your gender',
      'genreMan': 'Male',
      'genreWoman': 'Female',
      'themeLabel': 'Theme color',
      'langLabel': 'App language',
      'avatarLabel': 'Choose your avatar',
      'button': 'Discover the Country',
      'langFr': 'French',
      'langEn': 'English',
      'langAr': 'Arabic',
    },
    'ar': {
      'title': 'أنشئ ملفك الشخصي',
      'subtitle': 'خصص تجربة سفرك',
      'nameLabel': 'الاسم واللقب',
      'nameHint': 'أدخل اسمك الكامل',
      'genreLabel': 'حدد جنسك',
      'genreMan': 'رجل',
      'genreWoman': 'امرأة',
      'themeLabel': 'لون المظهر',
      'langLabel': 'لغة التطبيق',
      'avatarLabel': 'اختر صورتك الرمزية',
      'button': 'اكتشف البلاد',
      'langFr': 'الفرنسية',
      'langEn': 'الإنجليزية',
      'langAr': 'العربية',
    },
  };

  @override
  void initState() {
    super.initState();
    _currentLang = widget.languageCode;
    _selectedAvatar = _avatarsHommes[0];
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();
    _nameFocus.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    _orbitController.dispose();
    _entranceController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  String get _errorText {
    const Map<String, String> msgs = {
      'fr': 'Veuillez entrer votre nom',
      'en': 'Please enter your name',
      'ar': 'يرجى إدخال اسمك',
    };
    return msgs[_currentLang] ?? msgs['fr']!;
  }

  void _validateAndSave() async {
    HapticFeedback.mediumImpact();
    final bool nameEmpty = _nameController.text.trim().isEmpty;

    if (nameEmpty) {
      setState(() {
        _hasNameError = true;
      });
      _nameFocus.requestFocus();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', _nameController.text.trim());
    await prefs.setString('user_gender', _selectedGenre);
    await prefs.setInt('user_theme_color', _selectedThemeColor.value);
    await prefs.setString('user_lang', _currentLang);
    await prefs.setString('user_avatar', _selectedAvatar);
    await prefs.setBool('is_profile_created', true);

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => AccueilScreen(
          userName: _nameController.text.trim(),
          languageCode: _currentLang,
          selectedAvatar: _selectedAvatar,
          themeColor: _selectedThemeColor,
        ),
      ),
          (route) => false,
    );
  }

  // Apparition en cascade
  Widget _stagger(double start, double end, Widget child) {
    return AnimatedBuilder(
      animation: _entranceController,
      child: child,
      builder: (context, ch) {
        final double p = Curves.easeOutCubic.transform(
          ((_entranceController.value - start) / (end - start)).clamp(0.0, 1.0).toDouble(),
        );
        return Opacity(
          opacity: p,
          child: Transform.translate(
            offset: Offset(0, (1 - p) * 28),
            child: ch,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = _localizedText[_currentLang] ?? _localizedText['fr']!;
    final isRtl = _currentLang == 'ar';
    final currentAvatars = _isMale ? _avatarsHommes : _avatarsFemmes;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        body: TweenAnimationBuilder<Color?>(
          tween: ColorTween(end: _selectedThemeColor),
          duration: const Duration(milliseconds: 450),
          builder: (context, animatedColor, _) {
            _accent = animatedColor ?? _selectedThemeColor;
            return SafeArea(
              child: Stack(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(22, 18, 22, 130),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _stagger(0.0, 0.45, _buildHeader(t)),
                          const SizedBox(height: 26),

                          // 1. NOM ET PRÉNOM
                          _stagger(
                            0.08,
                            0.55,
                            _sectionCard(
                              icon: Icons.badge_rounded,
                              title: t['nameLabel']!,
                              child: _buildNameField(t),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // 2. GENRE
                          _stagger(
                            0.18,
                            0.65,
                            _sectionCard(
                              icon: Icons.wc_rounded,
                              title: t['genreLabel']!,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _buildGenreButton(
                                      label: t['genreMan']!,
                                      icon: Icons.male_rounded,
                                      isSelected: _isMale,
                                      onTap: () {
                                        HapticFeedback.selectionClick();
                                        setState(() {
                                          _isMale = true;
                                          _selectedGenre = t['genreMan']!;
                                          _selectedAvatar = _avatarsHommes[0];
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _buildGenreButton(
                                      label: t['genreWoman']!,
                                      icon: Icons.female_rounded,
                                      isSelected: !_isMale,
                                      onTap: () {
                                        HapticFeedback.selectionClick();
                                        setState(() {
                                          _isMale = false;
                                          _selectedGenre = t['genreWoman']!;
                                          _selectedAvatar = _avatarsFemmes[0];
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // 3. COULEUR DU THÈME
                          _stagger(
                            0.28,
                            0.75,
                            _sectionCard(
                              icon: Icons.palette_rounded,
                              title: t['themeLabel']!,
                              child: Row(
                                children: _themeColors.map((color) {
                                  return Flexible(
                                    child: Center(child: _buildColorDot(color)),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // 4. AVATAR (orbite animée + grille)
                          _stagger(
                            0.38,
                            0.85,
                            _sectionCard(
                              icon: Icons.face_retouching_natural_rounded,
                              title: t['avatarLabel']!,
                              child: Column(
                                children: [
                                  Center(
                                    child: SizedBox(
                                      width: 210,
                                      height: 210,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: RadialGradient(
                                                colors: [
                                                  _accent.withOpacity(0.22),
                                                  _accent.withOpacity(0.0),
                                                ],
                                              ),
                                            ),
                                          ),
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 250),
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              gradient: LinearGradient(
                                                colors: [
                                                  _accent,
                                                  BubbleTheme.primaryGradientEnd,
                                                ],
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: _accent.withOpacity(0.5),
                                                  blurRadius: 26,
                                                  spreadRadius: 1,
                                                ),
                                              ],
                                            ),
                                            child: Container(
                                              width: 88,
                                              height: 88,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: BubbleTheme.cardDark,
                                              ),
                                              child: Center(
                                                child: AnimatedSwitcher(
                                                  duration: const Duration(milliseconds: 300),
                                                  switchInCurve: Curves.easeOutBack,
                                                  transitionBuilder: (child, anim) =>
                                                      ScaleTransition(scale: anim, child: child),
                                                  child: Text(
                                                    _selectedAvatar,
                                                    key: ValueKey<String>(_selectedAvatar),
                                                    style: const TextStyle(fontSize: 46),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          AnimatedBuilder(
                                            animation: _orbitController,
                                            builder: (context, child) {
                                              return CustomPaint(
                                                size: const Size(210, 210),
                                                painter: OrbitPainter(
                                                  progress: _orbitController.value,
                                                  avatars: currentAvatars,
                                                  selectedAvatar: _selectedAvatar,
                                                  themeColor: _accent,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: currentAvatars.length,
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 6,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 1.0,
                                    ),
                                    itemBuilder: (context, index) {
                                      final avatar = currentAvatars[index];
                                      final isSelected = avatar == _selectedAvatar;
                                      return GestureDetector(
                                        onTap: () {
                                          HapticFeedback.selectionClick();
                                          setState(() {
                                            _selectedAvatar = avatar;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 220),
                                          curve: Curves.easeOutCubic,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            gradient: isSelected
                                                ? LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                _accent.withOpacity(0.38),
                                                _accent.withOpacity(0.12),
                                              ],
                                            )
                                                : null,
                                            color: isSelected ? null : const Color(0xFF0F131D),
                                            border: Border.all(
                                              color: isSelected ? _accent : BubbleTheme.cardBorder,
                                              width: isSelected ? 1.8 : 1,
                                            ),
                                            boxShadow: isSelected
                                                ? [
                                              BoxShadow(
                                                color: _accent.withOpacity(0.4),
                                                blurRadius: 12,
                                                offset: const Offset(0, 3),
                                              ),
                                            ]
                                                : [],
                                          ),
                                          child: Center(
                                            child: AnimatedScale(
                                              scale: isSelected ? 1.18 : 1.0,
                                              duration: const Duration(milliseconds: 220),
                                              curve: Curves.easeOutBack,
                                              child: Text(
                                                avatar,
                                                style: const TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // 5. LANGUE DE L'APPLICATION
                          _stagger(
                            0.48,
                            0.95,
                            _sectionCard(
                              icon: Icons.language_rounded,
                              title: t['langLabel']!,
                              child: Row(
                                children: [
                                  Expanded(child: _buildLangButton('fr', '🇫🇷', t['langFr']!)),
                                  const SizedBox(width: 10),
                                  Expanded(child: _buildLangButton('en', '🇬🇧', t['langEn']!)),
                                  const SizedBox(width: 10),
                                  Expanded(child: _buildLangButton('ar', '🇸🇦', t['langAr']!)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ---- Barre d'action flottante ----
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 130,
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              BubbleTheme.background.withOpacity(0.0),
                              BubbleTheme.background.withOpacity(0.92),
                              BubbleTheme.background,
                            ],
                            stops: const [0.0, 0.5, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 22,
                    right: 22,
                    bottom: 16,
                    child: _stagger(0.5, 1.0, _buildCta(t, isRtl)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  EN-TÊTE
  // ---------------------------------------------------------------------
  Widget _buildHeader(Map<String, String> t) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 92,
            height: 92,
            child: AnimatedBuilder(
              animation: _orbitController,
              builder: (context, _) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(92, 92),
                      painter: _ProfileBadgePainter(
                        angle: _orbitController.value * 2 * math.pi,
                        color: _accent,
                      ),
                    ),
                    Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [_accent, BubbleTheme.primaryGradientEnd],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _accent.withOpacity(0.55),
                            blurRadius: 28,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (rect) => LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.9),
                _accent.withOpacity(0.95),
              ],
              stops: const [0.0, 0.6, 1.0],
            ).createShader(rect),
            child: Text(
              t['title']!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                letterSpacing: _currentLang == 'ar' ? 0 : -0.3,
                shadows: [
                  Shadow(color: _accent.withOpacity(0.45), blurRadius: 24),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            t['subtitle']!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: BubbleTheme.textMuted,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 14),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 64,
            height: 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: [_accent, BubbleTheme.primaryGradientEnd],
              ),
              boxShadow: [
                BoxShadow(color: _accent.withOpacity(0.6), blurRadius: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  CARTE DE SECTION
  // ---------------------------------------------------------------------
  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A2030), Color(0xFF121722)],
        ),
        border: Border.all(color: Colors.white.withOpacity(0.07), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.32),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _accent.withOpacity(0.45),
                      _accent.withOpacity(0.12),
                    ],
                  ),
                  border: Border.all(color: _accent.withOpacity(0.45)),
                ),
                child: Icon(icon, color: Colors.white, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: BubbleTheme.textLight,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  CHAMP NOM
  // ---------------------------------------------------------------------
  Widget _buildNameField(Map<String, String> t) {
    final bool focused = _nameFocus.hasFocus;
    final bool filled = _nameController.text.trim().isNotEmpty;
    final Color border = _hasNameError
        ? BubbleTheme.coral
        : (focused ? _accent : BubbleTheme.cardBorder);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            color: const Color(0xFF0F131D),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: border,
              width: (focused || _hasNameError) ? 1.8 : 1.2,
            ),
            boxShadow: (focused || _hasNameError)
                ? [BoxShadow(color: border.withOpacity(0.3), blurRadius: 18)]
                : [],
          ),
          child: TextField(
            controller: _nameController,
            focusNode: _nameFocus,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.done,
            cursorColor: _accent,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15.5,
              fontWeight: FontWeight.w600,
            ),
            onChanged: (val) {
              setState(() {
                if (_hasNameError && val.trim().isNotEmpty) {
                  _hasNameError = false;
                }
              });
            },
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.person_outline_rounded,
                color: focused ? _accent : BubbleTheme.textMuted,
                size: 21,
              ),
              suffixIcon: filled
                  ? Icon(Icons.check_circle_rounded, color: _accent, size: 20)
                  : null,
              hintText: t['nameHint'],
              hintStyle: TextStyle(
                color: _hasNameError
                    ? BubbleTheme.coral.withOpacity(0.8)
                    : BubbleTheme.textMuted.withOpacity(0.6),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
              border: InputBorder.none,
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          child: _hasNameError
              ? Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                const Icon(Icons.error_outline_rounded, color: BubbleTheme.coral, size: 15),
                const SizedBox(width: 6),
                Text(
                  _errorText,
                  style: const TextStyle(
                    color: BubbleTheme.coral,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }

  // ---------------------------------------------------------------------
  //  GENRE
  // ---------------------------------------------------------------------
  Widget _buildGenreButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _accent.withOpacity(0.34),
              _accent.withOpacity(0.10),
            ],
          )
              : null,
          color: isSelected ? null : const Color(0xFF0F131D),
          border: Border.all(
            color: isSelected ? _accent : BubbleTheme.cardBorder,
            width: isSelected ? 1.8 : 1.2,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: _accent.withOpacity(0.3),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isSelected
                    ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [_accent, BubbleTheme.primaryGradientEnd],
                )
                    : null,
                color: isSelected ? null : Colors.white.withOpacity(0.05),
                boxShadow: isSelected
                    ? [BoxShadow(color: _accent.withOpacity(0.5), blurRadius: 14)]
                    : [],
              ),
              child: Icon(
                icon,
                size: 24,
                color: isSelected ? Colors.white : BubbleTheme.textMuted,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : BubbleTheme.textMuted,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  COULEUR DU THÈME
  // ---------------------------------------------------------------------
  Widget _buildColorDot(Color color) {
    final bool isSelected = _selectedThemeColor == color;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() {
          _selectedThemeColor = color;
        });
      },
      child: AnimatedScale(
        scale: isSelected ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 42,
          height: 42,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 2,
            ),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: color.withOpacity(0.65),
                blurRadius: 16,
                spreadRadius: 1,
              ),
            ]
                : [],
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color, Color.lerp(color, Colors.black, 0.25)!],
              ),
            ),
            child: isSelected
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 20)
                : null,
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  LANGUE
  // ---------------------------------------------------------------------
  Widget _buildLangButton(String code, String flag, String label) {
    final isSelected = _currentLang == code;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() {
          _currentLang = code;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: isSelected
              ? LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _accent.withOpacity(0.34),
              _accent.withOpacity(0.10),
            ],
          )
              : null,
          color: isSelected ? null : const Color(0xFF0F131D),
          border: Border.all(
            color: isSelected ? _accent : BubbleTheme.cardBorder,
            width: isSelected ? 1.8 : 1.2,
          ),
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: _accent.withOpacity(0.28),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.15 : 1.0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutBack,
              child: Text(flag, style: const TextStyle(fontSize: 24)),
            ),
            const SizedBox(height: 6),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : BubbleTheme.textMuted,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  fontSize: 12.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  BOUTON FINAL
  // ---------------------------------------------------------------------
  Widget _buildCta(Map<String, String> t, bool isRtl) {
    return AnimatedBuilder(
      animation: Listenable.merge([_pulseController, _orbitController]),
      builder: (context, _) {
        final double pulse = Curves.easeInOut.transform(_pulseController.value);
        final double shimmer = (_orbitController.value * 5) % 1.0;

        return Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: _accent.withOpacity(0.30 + 0.25 * pulse),
                blurRadius: 24 + 12 * pulse,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      _accent,
                      Color.lerp(_accent, BubbleTheme.primaryGradientEnd, 0.7)!,
                    ],
                  ),
                ),
                child: InkWell(
                  onTap: _validateAndSave,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: IgnorePointer(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-2.0 + 4.0 * shimmer, -0.5),
                                end: Alignment(-1.0 + 4.0 * shimmer, 0.5),
                                colors: [
                                  Colors.white.withOpacity(0.0),
                                  Colors.white.withOpacity(0.32),
                                  Colors.white.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.18),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width: 1.2,
                                ),
                              ),
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 250),
                                  transitionBuilder: (child, anim) =>
                                      ScaleTransition(scale: anim, child: child),
                                  child: Text(
                                    _selectedAvatar,
                                    key: ValueKey<String>('cta$_selectedAvatar'),
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  t['button']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: isRtl ? 0 : 0.3,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 46,
                              height: 46,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.18),
                              ),
                              child: Transform.translate(
                                offset: Offset((isRtl ? -1 : 1) * 3 * pulse, 0),
                                child: Icon(
                                  isRtl
                                      ? Icons.arrow_back_rounded
                                      : Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// Anneau orbital de l'en-tête du profil
class _ProfileBadgePainter extends CustomPainter {
  final double angle;
  final Color color;

  _ProfileBadgePainter({required this.angle, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double r = size.width / 2 - 4;
    final Rect rect = Rect.fromCircle(center: c, radius: r);

    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = Colors.white.withOpacity(0.08),
    );
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.6
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          colors: [
            color.withOpacity(0.0),
            color,
            color.withOpacity(0.0),
          ],
          transform: GradientRotation(angle * 4),
        ).createShader(rect),
    );

    for (int k = 0; k < 3; k++) {
      final double ang = angle * 4 + k * 2 * math.pi / 3;
      final Offset pos = c + Offset(math.cos(ang), math.sin(ang)) * r;
      final Color dot = k == 0 ? BubbleTheme.accentGold : color;
      canvas.drawCircle(pos, 6, Paint()..color = dot.withOpacity(0.25));
      canvas.drawCircle(pos, 2.8, Paint()..color = dot);
    }
  }

  @override
  bool shouldRepaint(covariant _ProfileBadgePainter old) =>
      old.angle != angle || old.color != color;
}

// ==========================================
// 6. CUSTOM PAINTER POUR L'ORBITE DES EMOJIS
// ==========================================
class OrbitPainter extends CustomPainter {
  final double progress;
  final List<String> avatars;
  final String selectedAvatar;
  final Color themeColor;

  OrbitPainter({
    required this.progress,
    required this.avatars,
    required this.selectedAvatar,
    required this.themeColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const radius = 85.0; // Rayon de l'orbite

    // Dessiner l'anneau d'orbite subtil
    final paintRing = Paint()
      ..color = Colors.white.withOpacity(0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, radius, paintRing);

    final count = avatars.length;
    for (int i = 0; i < count; i++) {
      final angle = (i * 2 * 3.1415926535 / count) + (progress * 2 * 3.1415926535);
      final x = center.dx + radius * mathCos(angle);
      final y = center.dy + radius * mathSin(angle);

      final avatar = avatars[i];
      final isSelected = (avatar == selectedAvatar);

      // Fond blanc/sombre pour chaque emoji orbitant
      final bgPaint = Paint()
        ..color = isSelected ? themeColor.withOpacity(0.3) : BubbleTheme.cardDark
        ..style = PaintingStyle.fill;

      final borderPaint = Paint()
        ..color = isSelected ? themeColor : Colors.white.withOpacity(0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 2.0 : 1.0;

      const itemRadius = 18.0;
      canvas.drawCircle(Offset(x, y), itemRadius, bgPaint);
      canvas.drawCircle(Offset(x, y), itemRadius, borderPaint);

      // Rendu de l'emoji
      final textSpan = TextSpan(
        text: avatar,
        style: TextStyle(fontSize: isSelected ? 18 : 15),
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }
  }

  double mathCos(double val) => math.cos(val);
  double mathSin(double val) => math.sin(val);

  @override
  bool shouldRepaint(covariant OrbitPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.selectedAvatar != selectedAvatar ||
        oldDelegate.themeColor != themeColor ||
        oldDelegate.avatars != avatars;
  }
}

// ==========================================
// 7. PAGE D'IDÉES (IDEESPAGE)
// ==========================================
class IdeesPage extends StatelessWidget {
  final String languageCode;
  final Color themeColor;

  const IdeesPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    final isRtl = languageCode == 'ar';
    final Map<String, String> titles = {
      'fr': 'Idées de voyage',
      'en': 'Travel Ideas',
      'ar': 'أفكار السفر',
    };

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        appBar: AppBar(
          backgroundColor: BubbleTheme.cardDark,
          elevation: 0,
          title: Text(
            titles[languageCode] ?? titles['fr']!,
            style: const TextStyle(
              color: BubbleTheme.textLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: const IconThemeData(color: BubbleTheme.textLight),
        ),
        body: InkWell(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            final String userName = prefs.getString('user_name') ?? '';
            final String avatar = prefs.getString('user_avatar') ?? '👨';

            if (!context.mounted) return;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AccueilScreen(
                  userName: userName,
                  languageCode: languageCode,
                  selectedAvatar: avatar,
                  themeColor: themeColor,
                ),
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.explore_rounded,
                  size: 64,
                  color: themeColor,
                ),
                const SizedBox(height: 16),
                Text(
                  titles[languageCode] ?? titles['fr']!,
                  style: const TextStyle(
                    color: BubbleTheme.textLight,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}