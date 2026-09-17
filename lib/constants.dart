import 'package:flutter/material.dart';

class BubbleTheme {
  static const Color background = Color(0xFF07090F);
  static const Color cardDark = Color(0xFF131722);
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
      "tag": "01. Découvertes",
      "title": "Saviez-vous ?",
      "highlight": "Paysages cachés",
      "description": "La France abrite des décors spectaculaires et méconnus que peu de gens ont explorés.",
      "icon": "compass"
    },
    {
      "tag": "02. Évasion",
      "title": "Décors incroyables !",
      "highlight": "Dépaysement total",
      "description": "Altschlossfelsen, sentier des Ocres : des lieux uniques aux allures de paysages lointains.",
      "icon": "landscape"
    },
    {
      "tag": "03. Insolite",
      "title": "Trésors cachés !",
      "highlight": "Merveilles uniques",
      "description": "Sortez des sentiers battus et partez à la recherche de sites extraordinaires.",
      "icon": "stars"
    },
    {
      "tag": "04. Exploration",
      "title": "Prêt pour l'aventure ?",
      "highlight": "Nouveau regard",
      "description": "Découvrez le pays sous un tout autre angle dès maintenant.",
      "icon": "explore"
    },
  ],
  'en': [
    {
      "tag": "01. Discoveries",
      "title": "Did you know ?",
      "highlight": "Hidden landscapes",
      "description": "France holds spectacular and little-known spots that few people have explored.",
      "icon": "compass"
    },
    {
      "tag": "02. Getaway",
      "title": "Incredible scenery !",
      "highlight": "Total escape",
      "description": "Altschlossfelsen, Ochre Trail: unique places resembling distant landscapes.",
      "icon": "landscape"
    },
    {
      "tag": "03. Unusual",
      "title": "Hidden treasures !",
      "highlight": "Unique wonders",
      "description": "Get off the beaten path and explore extraordinary places.",
      "icon": "stars"
    },
    {
      "tag": "04. Exploration",
      "title": "Ready for adventure ?",
      "highlight": "Fresh perspective",
      "description": "Discover the country from a whole new angle right now.",
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