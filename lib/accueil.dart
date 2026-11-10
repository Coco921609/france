import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'chateaux/chateau_de_verseilles.dart';
import 'chateaux/chateau_de_chambord.dart';

import 'paysages/calanques/calanque_de_sugiton.dart' as sugiton;
import 'paysages/calanques/calanques_de_cassis.dart' as cassis;
import 'paysages/calanques/calanques_de_piana.dart' as piana;

import 'paysages/canyons/altschlossfelsen.dart' as altschlossfelsen;
import 'paysages/canyons/dune_du_pilat.dart' as dune_du_pilat;
import 'paysages/canyons/orgues_d_ille.dart' as orgues_d_ille;
import 'paysages/canyons/rougier_de_camares.dart' as rougier_de_camares;
import 'paysages/canyons/sentier_des_ocres.dart' as sentier_des_ocres;

import 'paysages/eaux/cascades_des_tufs.dart' as cascades_des_tufs;
import 'paysages/eaux/gorges_du_fier.dart' as gorges_du_fier;
import 'paysages/eaux/gorges_du_verdon.dart' as gorges_du_verdon;
import 'paysages/eaux/ile_de_la_vierge.dart' as ile_de_la_vierge;
import 'paysages/eaux/lac_d_allos.dart' as lac_d_allos;
import 'paysages/eaux/lac_de_lorceyrette.dart' as lac_de_lorceyrette;
import 'paysages/eaux/meandre_de_queuille.dart' as meandre_de_queuille;
import 'paysages/eaux/plateau_des_1000_etangs.dart' as plateau_des_1000_etangs;

import 'paysages/panoramas/etretat.dart' as etretat;
import 'paysages/panoramas/marais_d_aigues_mortes.dart' as marais_d_aigues_mortes;
import 'paysages/panoramas/pont_du_gard.dart' as pont_du_gard;
import 'paysages/panoramas/puy_de_dome.dart' as puy_de_dome;

import 'paysages/parcs/buttes_chaumont.dart' as buttes_chaumont;
import 'paysages/parcs/chemin_des_cimes.dart' as chemin_des_cimes;
import 'paysages/parcs/foret_de_broceliande.dart' as foret_de_broceliande;
import 'paysages/parcs/foret_fontainebleau.dart' as foret_fontainebleau;
import 'paysages/parcs/gouffre_de_padirac.dart' as gouffre_de_padirac;
import 'paysages/parcs/mont_saint_michel.dart' as mont_saint_michel;
import 'paysages/parcs/palais_ideal.dart' as palais_ideal;
import 'paysages/parcs/parc_monceau.dart' as parc_monceau;

import 'parametres.dart';
import 'favoris.dart';

// ===========================================================================
//  SYSTÈME DE DESIGN
//  (partagé avec favoris.dart et parametres.dart)
// ===========================================================================
class ModernTheme {
  static const Color background = Color(0xFF07080F);
  static const Color surface = Color(0xFF10121F);
  static const Color surfaceCard = Color(0xFF181B2E);
  static const Color primaryAccent = Color(0xFF7C5CFF);
  static const Color secondaryAccent = Color(0xFFFF5C8A); // cœur / favoris
  static const Color gold = Color(0xFFFFC857);
  static const Color textLight = Color(0xFFF4F5FA);
  static const Color textMuted = Color(0xFF9A9FB8);
  static const Color borderLight = Color(0xFF272B47);
}

/// Retire les emojis / symboles placés au début d'un libellé.
String luxClean(String s) =>
    s.replaceFirst(RegExp(r'^[^\p{L}\p{N}]+', unicode: true), '').trim();

/// Éclaircit (amount < 0) ou assombrit (amount > 0) une couleur en gardant sa teinte.
Color luxShade(Color c, double amount) {
  final HSLColor hsl = HSLColor.fromColor(c);
  return hsl
      .withLightness((hsl.lightness - amount).clamp(0.0, 1.0).toDouble())
      .toColor();
}

/// Dégradé monochrome (même teinte) pour les boutons et états actifs.
LinearGradient luxGradient(Color c) => LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [luxShade(c, -0.05), luxShade(c, 0.10)],
);

/// Style des grands titres : empattement façon magazine de voyage.
TextStyle luxDisplay(
    double size, {
      Color color = Colors.white,
      bool rtl = false,
      double height = 1.08,
      double letterSpacing = -0.8,
      FontWeight weight = FontWeight.w700,
    }) {
  return TextStyle(
    color: color,
    fontSize: size,
    height: height,
    fontWeight: rtl ? FontWeight.w800 : weight,
    letterSpacing: rtl ? 0 : letterSpacing,
    fontFamily: rtl ? null : 'Georgia',
    fontFamilyFallback: rtl ? null : const ['Times New Roman', 'serif'],
  );
}

/// « 3 lieux », « 1 place », « 5 أماكن »…
String luxPlaces(int n, String lang) {
  if (lang == 'en') return n == 1 ? '1 place' : '$n places';
  if (lang == 'ar') {
    if (n == 1) return 'مكان واحد';
    if (n == 2) return 'مكانان';
    if (n >= 3 && n <= 10) return '$n أماكن';
    return '$n مكانًا';
  }
  return n <= 1 ? '$n lieu' : '$n lieux';
}

/// Icône, couleur et libellé court de chaque catégorie.
class LuxCategory {
  LuxCategory._();

  static const Map<String, IconData> _icons = {
    'catChateauxHeritage': Icons.fort_rounded,
    'catCanyons': Icons.landscape_rounded,
    'catGorges': Icons.water_drop_rounded,
    'catParks': Icons.park_rounded,
    'catPanoramas': Icons.terrain_rounded,
    'catCalanques': Icons.waves_rounded,
  };

  static const Map<String, Color> _colors = {
    'catChateauxHeritage': Color(0xFFFFC857),
    'catCanyons': Color(0xFFFF8A4C),
    'catGorges': Color(0xFF2DD4BF),
    'catParks': Color(0xFF4ADE80),
    'catPanoramas': Color(0xFF8AB4FF),
    'catCalanques': Color(0xFF22D3EE),
  };

  static const Map<String, Map<String, String>> _short = {
    'catChateauxHeritage': {'fr': 'Châteaux', 'en': 'Castles', 'ar': 'القلاع'},
    'catCanyons': {'fr': 'Canyons', 'en': 'Canyons', 'ar': 'الأخدود'},
    'catGorges': {'fr': 'Gorges & Lacs', 'en': 'Gorges & Lakes', 'ar': 'المضايق والبحيرات'},
    'catParks': {'fr': 'Parcs', 'en': 'Parks', 'ar': 'الحدائق'},
    'catPanoramas': {'fr': 'Panoramas', 'en': 'Panoramas', 'ar': 'المناظر'},
    'catCalanques': {'fr': 'Calanques', 'en': 'Coves', 'ar': 'الخلجان'},
  };

  static IconData icon(String key) => _icons[key] ?? Icons.place_rounded;

  static Color color(String key) => _colors[key] ?? ModernTheme.primaryAccent;

  static String shortLabel(String key, String lang) {
    final Map<String, String>? m = _short[key];
    if (m == null) return key;
    return m[lang] ?? m['fr'] ?? key;
  }
}

/// Fond : encre profonde + deux halos de la couleur du thème.
class LuxBackdrop extends StatelessWidget {
  final Color color;
  final Widget child;

  const LuxBackdrop({super.key, required this.color, required this.child});

  Widget _glow(Color c, double size, double opacity) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [c.withOpacity(opacity), c.withOpacity(0.0)],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(begin: color, end: color),
      duration: const Duration(milliseconds: 500),
      child: child,
      builder: (context, animated, staticChild) {
        final Color c = animated ?? color;
        return Stack(
          children: [
            const Positioned.fill(child: ColoredBox(color: ModernTheme.background)),
            Positioned(top: -200, left: -150, child: _glow(c, 540, 0.24)),
            Positioned(bottom: -240, right: -170, child: _glow(c, 500, 0.11)),
            Positioned.fill(child: staticChild!),
          ],
        );
      },
    );
  }
}

/// Panneau « verre » (flou optionnel).
class LuxGlass extends StatelessWidget {
  final Widget? child;
  final double radius;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final double blur;
  final double fillOpacity;
  final double borderOpacity;
  final Gradient? gradient;
  final AlignmentGeometry? alignment;

  const LuxGlass({
    super.key,
    this.child,
    this.radius = 22,
    this.padding = EdgeInsets.zero,
    this.width,
    this.height,
    this.blur = 0,
    this.fillOpacity = 0.07,
    this.borderOpacity = 0.12,
    this.gradient,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius br = BorderRadius.circular(radius);
    final Widget box = Container(
      width: width,
      height: height,
      padding: padding,
      alignment: alignment,
      decoration: BoxDecoration(
        borderRadius: br,
        color: gradient == null ? Colors.white.withOpacity(fillOpacity) : null,
        gradient: gradient,
        border: Border.all(color: Colors.white.withOpacity(borderOpacity), width: 1),
      ),
      child: child,
    );
    if (blur <= 0) return box;
    return ClipRRect(
      borderRadius: br,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: box,
      ),
    );
  }
}

/// Effet de pression : l'élément rétrécit légèrement sous le doigt.
class LuxPress extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressedScale;

  const LuxPress({
    super.key,
    required this.child,
    this.onTap,
    this.pressedScale = 0.97,
  });

  @override
  State<LuxPress> createState() => _LuxPressState();
}

class _LuxPressState extends State<LuxPress> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _down = true),
      onTapUp: (_) => setState(() => _down = false),
      onTapCancel: () => setState(() => _down = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _down ? widget.pressedScale : 1.0,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}

/// Anneau lumineux qui tourne autour d'un avatar.
class LuxRingPainter extends CustomPainter {
  final double angle;
  final Color color;

  LuxRingPainter({required this.angle, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double r = size.width / 2 - 3;
    final Rect rect = Rect.fromCircle(center: c, radius: r);

    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = Colors.white.withOpacity(0.14),
    );
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.8
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          colors: [
            color.withOpacity(0.0),
            color,
            luxShade(color, -0.18),
            color.withOpacity(0.0),
          ],
          stops: const [0.0, 0.5, 0.8, 1.0],
          transform: GradientRotation(angle),
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant LuxRingPainter old) =>
      old.angle != angle || old.color != color;
}

// ===========================================================================
//  ÉCRAN D'ACCUEIL
// ===========================================================================
class AccueilScreen extends StatefulWidget {
  final String userName;
  final String languageCode;
  final String selectedAvatar;
  final Color themeColor;

  const AccueilScreen({
    super.key,
    required this.userName,
    required this.languageCode,
    required this.selectedAvatar,
    required this.themeColor,
  });

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> with TickerProviderStateMixin {
  late String _currentLang;
  late String _userName;
  late String _selectedAvatar;
  late Color _themeColor;
  int _currentIndex = 1; // 0: Châteaux, 1: Accueil (centre), 2: Paysages
  List<String> _favoriteKeys = [];
  final List<int> _tabHistory = [1];

  String _feedFilter = 'all';
  String _query = '';
  int _heroPage = 0;
  Timer? _heroTimer;

  late final AnimationController _entryAnimController =
  AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
  late final Animation<double> _fadeAnimation =
  CurvedAnimation(parent: _entryAnimController, curve: Curves.easeOutCubic);
  late final AnimationController _ambientController =
  AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();

  final PageController _heroController = PageController(viewportFraction: 0.82);
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  final Map<String, Map<String, String>> _translations = {
    'fr': {
      'welcome': 'Bonjour',
      'explore': 'Explore la France',
      'headline': 'La France,\nautrement.',
      'franceIntro': 'Partez à la découverte des plus beaux trésors, monuments historiques et paysages spectaculaires de la France à travers un voyage inoubliable.',
      'chateauxIntro': 'Plongez au cœur de l’histoire royale en explorant les plus majestueux châteaux et domaines du patrimoine français.',
      'paysagesIntro': 'Évadez-vous à travers des canyons grandioses, des lacs cristallins et des panoramas naturels d’exception.',
      'chateaux': 'Châteaux',
      'home': 'Évasion',
      'paysages': 'Paysages',
      'favorisBtn': 'Mes Favoris',
      'selectAllFavs': 'Tout ajouter aux favoris',
      'removeAllFavs': 'Tout retirer des favoris',
      'settings': 'Paramètres',
      'changeLangLabel': 'Langue de l’application',
      'discover': 'Découvrir',
      'featured': 'À la une',
      'searchHint': 'Rechercher un lieu…',
      'all': 'Tous',
      'noResults': 'Aucun résultat',
      'noResultsHint': 'Essayez un autre mot ou changez de catégorie.',
      'catChateauxHeritage': '🏰 Châteaux & Patrimoine Historique',
      'catCanyons': '🏜️ Canyons & Déserts',
      'catGorges': '🛶 Gorges & Eaux Turquoises',
      'catParks': '🏛️ Parcs & Monuments Insolites',
      'catPanoramas': '🌋 Panoramas Uniques',
      'catCalanques': '🌊 Les Calanques de France',
    },
    'en': {
      'welcome': 'Hello',
      'explore': 'Explore France',
      'headline': 'France,\nreimagined.',
      'franceIntro': 'Set out to discover France’s most beautiful treasures, historical monuments, and spectacular landscapes through an unforgettable journey.',
      'chateauxIntro': 'Dive into royal history by exploring the most majestic castles and estates of French heritage.',
      'paysagesIntro': 'Escape through grandiose canyons, crystalline lakes, and exceptional natural panoramas.',
      'chateaux': 'Castles',
      'home': 'Explore',
      'paysages': 'Landscapes',
      'favorisBtn': 'My Favorites',
      'selectAllFavs': 'Add all to favorites',
      'removeAllFavs': 'Remove all from favorites',
      'settings': 'Settings',
      'changeLangLabel': 'App language',
      'discover': 'Discover',
      'featured': 'Featured',
      'searchHint': 'Search a place…',
      'all': 'All',
      'noResults': 'No results',
      'noResultsHint': 'Try another word or switch category.',
      'catChateauxHeritage': '🏰 Castles & Historical Heritage',
      'catCanyons': '🏜️ Canyons & Deserts',
      'catGorges': '🛶 Gorges & Turquoise Waters',
      'catParks': '🏛️ Unusual Parks & Monuments',
      'catPanoramas': '🌋 Unique Panoramas',
      'catCalanques': '🌊 The Coves of France',
    },
    'ar': {
      'welcome': 'أهلاً',
      'explore': 'استكشف فرنسا',
      'headline': 'فرنسا\nبعين جديدة',
      'franceIntro': 'انطلق في اكتشاف أجمل كنوز فرنسا ومعالمها التاريخية ومناظرها الطبيعية الخلابة من خلال رحلة لا تنسى.',
      'chateauxIntro': 'غوصوا في أعماق التاريخ الملكي من خلال استكشاف أروع القلاع والمعالم التاريخية الفرنسية.',
      'paysagesIntro': 'اهربوا إلى طبيعة خلابة بين الأخدود المذهلة، البحيرات الصافية والمناظر الطبيعية الاستثنائية.',
      'chateaux': 'القلاع',
      'home': 'الرئيسية',
      'paysages': 'المناظر',
      'favorisBtn': 'المفضلة',
      'selectAllFavs': 'إضافة الكل إلى المفضلة',
      'removeAllFavs': 'إزالة الكل من المفضلة',
      'settings': 'الإعدادات',
      'changeLangLabel': 'لغة التطبيق',
      'discover': 'اكتشف',
      'featured': 'الأبرز',
      'searchHint': 'ابحث عن وجهة…',
      'all': 'الكل',
      'noResults': 'لا توجد نتائج',
      'noResultsHint': 'جرّب كلمة أخرى أو غيّر الفئة.',
      'catChateauxHeritage': '🏰 القلاع والتراث التاريخي',
      'catCanyons': '🏜️ الأخدود والصحاري',
      'catGorges': '🛶 المضايق والمياه الفيروزية',
      'catParks': '🏛️ الحدائق والآثار غير التقليدية',
      'catPanoramas': '🌋 المناظر الطبيعية الفريدة',
      'catCalanques': '🌊 خلجان فرنسا',
    },
  };

  List<Map<String, dynamic>> get _chateauxCategories => [
    {
      'categoryKey': 'catChateauxHeritage',
      'items': [
        {
          'key': 'chateau_de_verseilles',
          'name': {'fr': '🏰 Château de Versailles', 'en': '🏰 Palace of Versailles', 'ar': '🏰 قصر فرساي'}[_currentLang]!,
          'desc': _getLocalizedDesc('chateau_de_verseilles', {'fr': 'Ancienne résidence royale des rois de France.', 'en': 'Former royal residence of the kings of France.', 'ar': 'المقر الملكي السابق لملوك فرنسا.'}),
          'imagepath': 'assets/chateaux/versailles/1.jpg'
        },
        {
          'key': 'chateau_de_chambord',
          'name': {'fr': '🏰 Château de Chambord', 'en': '🏰 Chambord Castle', 'ar': '🏰 قلعة شامبور'}[_currentLang]!,
          'desc': _getLocalizedDesc('chateau_de_chambord', {'fr': 'Chef-d’œuvre de la Renaissance française.', 'en': 'Masterpiece of the French Renaissance.', 'ar': 'تحفة عصر النهضة الفرنسية.'}),
          'imagepath': 'assets/chateaux/cham/2.jpg'
        },
      ],
    },
  ];

  List<Map<String, dynamic>> get _paysagesCategories => [
    {
      'categoryKey': 'catCanyons',
      'items': [
        {
          'key': 'sentier_des_ocres',
          'name': {'fr': '🏜️ Sentier des ocres', 'en': '🏜️ Ochre Trail', 'ar': '🏜️ مسار الأوكر'}[_currentLang]!,
          'desc': _getLocalizedDesc('sentier_des_ocres', {'fr': 'Paysage flamboyant aux accents de Colorado.', 'en': 'Flamboyant landscape with Colorado accents.', 'ar': 'مشهد مذهل بألوان كولورادو.'}),
          'imagepath': 'assets/images/20190528-165859-largejpg.jpg'
        },
        {
          'key': 'orgues_d_ille',
          'name': {'fr': '⛰️ Les orgues d’Ille', 'en': '⛰️ Orgues d’Ille', 'ar': '⛰️ أورغ إيل'}[_currentLang]!,
          'desc': _getLocalizedDesc('orgues_d_ille', {'fr': 'Chemins de fées et cheminées de fées.', 'en': 'Fairy paths and fairy chimneys.', 'ar': 'مسارات الجنيات ومداخن الجنيات.'}),
          'imagepath': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg'
        },
        {
          'key': 'rougier_de_camares',
          'name': {'fr': '🤠 Rougier de Camarès', 'en': '🤠 Rougier de Camarès', 'ar': '🤠 روجيه دي كاماريس'}[_currentLang]!,
          'desc': _getLocalizedDesc('rougier_de_camares', {'fr': 'Terre rouge et paysages lunaires.', 'en': 'Red earth and lunar landscapes.', 'ar': 'أرض حمراء ومناظر طبيعية تشبه القمر.'}),
          'imagepath': 'assets/images/45.jpg'
        },
        {
          'key': 'altschlossfelsen',
          'name': {'fr': '🧗 Altschlossfelsen', 'en': '🧗 Altschlossfelsen', 'ar': '🧗 ألتشلوسفيلسن'}[_currentLang]!,
          'desc': _getLocalizedDesc('altschlossfelsen', {'fr': 'Grès sculpté et falaises mystérieuses.', 'en': 'Sculpted sandstone and mysterious cliffs.', 'ar': 'الحجر الرملي المنحوت والمنحدرات الغامضة.'}),
          'imagepath': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg'
        },
        {
          'key': 'dune_du_pilat',
          'name': {'fr': '🐪 La dune du Pilat', 'en': '🐪 Dune of Pilat', 'ar': '🐪 كثبان بيلا'}[_currentLang]!,
          'desc': _getLocalizedDesc('dune_du_pilat', {'fr': 'La plus haute dune de sable d’Europe.', 'en': 'The highest sand dune in Europe.', 'ar': 'أعلى كثبان رملية في أوروبا.'}),
          'imagepath': 'assets/images/sudouest-photo-1-32378160-1600.jpg'
        },
      ],
    },
    {
      'categoryKey': 'catGorges',
      'items': [
        {
          'key': 'gorges_du_verdon',
          'name': {'fr': '🛶 Gorges du Verdon', 'en': '🛶 Verdon Gorges', 'ar': '🛶 مضيق فيردون'}[_currentLang]!,
          'desc': _getLocalizedDesc('gorges_du_verdon', {'fr': 'Le Grand Canyon européen aux eaux émeraude.', 'en': 'The European Grand Canyon with emerald waters.', 'ar': 'الأخدود الأوروبي الكبير بمياهه الزمردية.'}),
          'imagepath': 'assets/images/VERDON.jpg'
        },
        {
          'key': 'ile_de_la_vierge',
          'name': {'fr': '🏝️ Île de la Vierge', 'en': '🏝️ Virgin Island', 'ar': '🏝️ جزيرة العذراء'}[_currentLang]!,
          'desc': _getLocalizedDesc('ile_de_la_vierge', {'fr': 'Eaux cristallines et beauté sauvage en Bretagne.', 'en': 'Crystalline waters and wild beauty in Brittany.', 'ar': 'مياه صافية وجمال بري في بريتاني.'}),
          'imagepath': 'assets/images/crique-ile-vierge-crozon.jpg'
        },
        {
          'key': 'gorges_du_fier',
          'name': {'fr': '🌉 Gorges du Fier', 'en': '🌉 Fier Gorges', 'ar': '🌉 مضيق فيير'}[_currentLang]!,
          'desc': _getLocalizedDesc('gorges_du_fier', {'fr': 'Canyon spectaculaire creusé par l’eau.', 'en': 'Spectacular canyon carved by water.', 'ar': 'أخدود رائع حفرته المياه.'}),
          'imagepath': 'assets/images/gorges-du-fier-annecy-15.jpg'
        },
        {
          'key': 'cascades_des_tufs',
          'name': {'fr': '💧 Cascades des Tufs', 'en': '💧 Tufs Waterfalls', 'ar': '💧 شلالات توف'}[_currentLang]!,
          'desc': _getLocalizedDesc('cascades_des_tufs', {'fr': 'Chutes d’eau féeriques et moussues.', 'en': 'Fairy and mossy waterfalls.', 'ar': 'شلالات ساحرة ومغطاة بالطحالب.'}),
          'imagepath': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg'
        },
        {
          'key': 'meandre_de_queuille',
          'name': {'fr': '🌿 Méandre de Queuille', 'en': '🌿 Queuille Meander', 'ar': '🌿 منعطف كويي'}[_currentLang]!,
          'desc': _getLocalizedDesc('meandre_de_queuille', {'fr': 'Boucle spectaculaire de la rivière en Auvergne.', 'en': 'Spectacular river loop in Auvergne.', 'ar': 'حلقة نهر مذهلة في أوفيرني.'}),
          'imagepath': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg'
        },
        {
          'key': 'lac_de_lorceyrette',
          'name': {'fr': '🇨🇦 Lac de l’Orceyrette', 'en': '🇨🇦 Lake Lorceyrette', 'ar': '🇨🇦 بحيرة لورسيريت'}[_currentLang]!,
          'desc': _getLocalizedDesc('lac_de_lorceyrette', {'fr': 'Écrin d’eau paisible et verdoyant.', 'en': 'Peaceful and green water setting.', 'ar': 'محيط مائي هادئ وخراج.'}),
          'imagepath': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg'
        },
        {
          'key': 'lac_d_allos',
          'name': {'fr': '🇳🇴 Lac d’Allos', 'en': '🇳🇴 Lake Allos', 'ar': '🇳🇴 بحيرة ألوس'}[_currentLang]!,
          'desc': _getLocalizedDesc('lac_d_allos', {'fr': 'Plus grand lac naturel de altitude d’Europe.', 'en': 'Largest high-altitude natural lake in Europe.', 'ar': 'أكبر بحيرة طبيعية عالية السطح في أوروبا.'}),
          'imagepath': 'assets/images/19.jpg'
        },
        {
          'key': 'plateau_des_1000_etangs',
          'name': {'fr': '🇫🇮 Plateau des 1000 Étangs', 'en': '🇫🇮 Plateau of 1000 Ponds', 'ar': '🇫🇮 هضبة ألف بركة'}[_currentLang]!,
          'desc': _getLocalizedDesc('plateau_des_1000_etangs', {'fr': 'Petite Finlande française aux reflets miroirs.', 'en': 'Little French Finland with mirror reflections.', 'ar': 'فنلندا الفرنسية الصغيرة بانعكاسات المرايا.'}),
          'imagepath': 'assets/image/4.jpg'
        },
      ],
    },
    {
      'categoryKey': 'catParks',
      'items': [
        {
          'key': 'buttes_chaumont',
          'name': {'fr': 'Parc Buttes-Chaumont', 'en': 'Buttes-Chaumont Park', 'ar': 'حديقة بوت شومون'}[_currentLang]!,
          'desc': _getLocalizedDesc('buttes_chaumont', {'fr': 'Parc vallonné aux vues panoramiques.', 'en': 'Hilly park with panoramic views.', 'ar': 'حديقة تلال ذات مناظر بانورامية.'}),
          'imagepath': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg'
        },
        {
          'key': 'palais_ideal',
          'name': {'fr': '🏯 Palais Idéal', 'en': '🏯 Ideal Palace', 'ar': '🏯 القصر المثالي'}[_currentLang]!,
          'desc': _getLocalizedDesc('palais_ideal', {'fr': 'Chef-d’œuvre d’architecture naïve et insolite.', 'en': 'Masterpiece of naïve and unusual architecture.', 'ar': 'تحفة العمارة الساذجة وغير التقليدية.'}),
          'imagepath': 'assets/images/facteur-cheval.jpg'
        },
        {
          'key': 'parc_monceau',
          'name': {'fr': '⛲ Parc Monceau', 'en': '⛲ Monceau Park', 'ar': '⛲ حديقة مونصو'}[_currentLang]!,
          'desc': _getLocalizedDesc('parc_monceau', {'fr': 'Havre de paix élégant au cœur de la ville.', 'en': 'Elegant haven of peace in the heart of the city.', 'ar': 'ملاذ هادئ وأنيق في قلب المدينة.'}),
          'imagepath': 'assets/images/597240-visuel-paris-parc-monceau.jpg'
        },
        {
          'key': 'foret_fontainebleau',
          'name': {'fr': '🌲 Foret Fontainebleau', 'en': '🌲 Fontainebleau Forest', 'ar': '🌲 غابة فونتينبلو'}[_currentLang]!,
          'desc': _getLocalizedDesc('foret_fontainebleau', {'fr': 'Hêtre majestueux et chaos rocheux légendaires.', 'en': 'Majestic beech and legendary rocky chaos.', 'ar': 'شجر الزان المهيب والفوضى الصخرية الأسطورية.'}),
          'imagepath': 'assets/images/foret-de-fontainebleau.jpg'
        },
        {
          'key': 'chemin_des_cimes',
          'name': {'fr': '🌳 Chemin des Cimes', 'en': '🌳 Treetop Walk', 'ar': '🌳 مسار القمم'}[_currentLang]!,
          'desc': _getLocalizedDesc('chemin_des_cimes', {'fr': 'Promenade suspendue au-dessus de la canopée.', 'en': 'Suspended walk above the canopy.', 'ar': 'نزهة معلقة فوق المظلة.'}),
          'imagepath': 'assets/images/88.jpg'
        },
        {
          'key': 'mont_saint_michel',
          'name': {'fr': '🏰 Mont Saint-Michel', 'en': '🏰 Mont Saint-Michel', 'ar': '🏰 مون سان ميشل'}[_currentLang]!,
          'desc': _getLocalizedDesc('mont_saint_michel', {'fr': 'Merveille de l’Occident entre mer et ciel.', 'en': 'Wonder of the West between sea and sky.', 'ar': 'عجيبة الغرب بين البحر والسماء.'}),
          'imagepath': 'assets/image/24.webp'
        },
        {
          'key': 'foret_de_broceliande',
          'name': {'fr': '🧙‍♂️ Forêt de Brocéliande', 'en': '🧙‍♂️ Brocéliande Forest', 'ar': '🧙‍♂️ غابة بروسيلياند'}[_currentLang]!,
          'desc': _getLocalizedDesc('foret_de_broceliande', {'fr': 'Forêt légendaire des contes arthuriens.', 'en': 'Legendary forest of Arthurian tales.', 'ar': 'غابة الأساطير لقصص الملك آرثر.'}),
          'imagepath': 'assets/image/51.jpg'
        },
        {
          'key': 'gouffre_de_padirac',
          'name': {'fr': '🕳️ Le Gouffre de Padirac', 'en': '🕳️ Padirac Cave', 'ar': '🕳️ كهف باديراك'}[_currentLang]!,
          'desc': _getLocalizedDesc('gouffre_de_padirac', {'fr': 'Immense cavité souterraine et rivière mystérieuse.', 'en': 'Huge underground cavity and mysterious river.', 'ar': 'تجويف أرضي ضخم ونهر غامض.'}),
          'imagepath': 'assets/image/58.jpg'
        },
      ],
    },
    {
      'categoryKey': 'catPanoramas',
      'items': [
        {
          'key': 'puy_de_dome',
          'name': {'fr': '🌋 Puy de Dôme', 'en': '🌋 Puy de Dôme', 'ar': '🌋 بوي دي دوم'}[_currentLang]!,
          'desc': _getLocalizedDesc('puy_de_dome', {'fr': 'Géant endormi de la chaîne des Puys.', 'en': 'Sleeping giant of the Puys chain.', 'ar': 'العملاق النائم لسلسلة بويس.'}),
          'imagepath': 'assets/images/dome.webp'
        },
        {
          'key': 'pont_du_gard',
          'name': {'fr': '🏛️ Pont du Gard', 'en': '🏛️ Pont du Gard', 'ar': '🏛️ جسر غار'}[_currentLang]!,
          'desc': _getLocalizedDesc('pont_du_gard', {'fr': 'Chef-d’œuvre de l’architecture romaine.', 'en': 'Masterpiece of Roman architecture.', 'ar': 'تحفة الهندسة المعمارية الرومانية.'}),
          'imagepath': 'assets/images/pont.webp'
        },
        {
          'key': 'marais_d_aigues_mortes',
          'name': {'fr': '🧂 Marais d’Aigues-Mortes', 'en': '🧂 Aigues-Mortes Salt Marshes', 'ar': '🧂 ملاحات إيغ مورت'}[_currentLang]!,
          'desc': _getLocalizedDesc('marais_d_aigues_mortes', {'fr': 'Miroirs d’eau aux teintes roses.', 'en': 'Water mirrors with pink hues.', 'ar': 'مرايا مائية ذات ألوان وردية.'}),
          'imagepath': 'assets/images/5.jpg'
        },
        {
          'key': 'etretat',
          'name': {'fr': '🌊 Étretat', 'en': '🌊 Étretat Cliffs', 'ar': '🌊 إتريتا'}[_currentLang]!,
          'desc': _getLocalizedDesc('etretat', {'fr': 'Falaises crayeuses spectaculaires de Normandie.', 'en': 'Spectacular chalk cliffs of Normandy.', 'ar': 'المنحدرات الطباشيرية المذهلة في نورماندي.'}),
          'imagepath': 'assets/imag/33.webp'
        },
      ],
    },
    {
      'categoryKey': 'catCalanques',
      'items': [
        {
          'key': 'calanque_de_sugiton',
          'name': {'fr': '🌊 Calanque de Sugiton', 'en': '🌊 Sugiton Cove', 'ar': '🌊 خليج سوغيتون'}[_currentLang]!,
          'desc': _getLocalizedDesc('calanque_de_sugiton', {'fr': 'Joyau préservé des calanques marseillaises.', 'en': 'Preserved jewel of the Marseille coves.', 'ar': 'جوهرة محمية من خلجان مارسيليا.'}),
          'imagepath': 'assets/images/sugiton.jpg'
        },
        {
          'key': 'calanques_de_cassis',
          'name': {'fr': '🚤 Calanques de Cassis', 'en': '🚤 Cassis Coves', 'ar': '🚤 خلجان كاسييس'}[_currentLang]!,
          'desc': _getLocalizedDesc('calanques_de_cassis', {'fr': 'Eaux turquoises et falaises calcaires blanches.', 'en': 'Turquoise waters and white limestone cliffs.', 'ar': 'المياه الفيروزية والمنحدرات الجيرية البيضاء.'}),
          'imagepath': 'assets/image/33.webp'
        },
        {
          'key': 'calanques_de_piana',
          'name': {'fr': '🌋 Calanques de Piana', 'en': '🌋 Piana Coves', 'ar': '🌋 خلجان بيانا'}[_currentLang]!,
          'desc': _getLocalizedDesc('calanques_de_piana', {'fr': 'Roches rouges sculptées par le vent en Corse.', 'en': 'Red rocks sculpted by the wind in Corsica.', 'ar': 'الصخور الحمراء المنحوتة بفعل الرياح في كورسيكا.'}),
          'imagepath': 'assets/image/41.webp'
        },
      ],
    },
  ];

  String _getLocalizedDesc(String key, Map<String, String> baseDescMap) {
    return baseDescMap[_currentLang] ?? baseDescMap['fr']!;
  }

  List<String> get _allItemKeys {
    final List<String> keys = [];
    for (var cat in _chateauxCategories) {
      for (var item in (cat['items'] as List)) {
        keys.add(item['key'] as String);
      }
    }
    for (var cat in _paysagesCategories) {
      for (var item in (cat['items'] as List)) {
        keys.add(item['key'] as String);
      }
    }
    return keys;
  }

  // ==========================================================================
  //  CYCLE DE VIE
  // ==========================================================================
  @override
  void initState() {
    super.initState();
    _currentLang = widget.languageCode;
    _userName = widget.userName;
    _selectedAvatar = widget.selectedAvatar;
    _themeColor = widget.themeColor;
    _loadFavorites();
    _entryAnimController.forward();
    _startHeroTimer();
  }

  @override
  void dispose() {
    _heroTimer?.cancel();
    _heroController.dispose();
    _scrollController.dispose();
    _searchController.dispose();
    _entryAnimController.dispose();
    _ambientController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AccueilScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.languageCode != oldWidget.languageCode) {
      _currentLang = widget.languageCode;
    }
    if (widget.userName != oldWidget.userName) {
      _userName = widget.userName;
    }
    if (widget.selectedAvatar != oldWidget.selectedAvatar) {
      _selectedAvatar = widget.selectedAvatar;
    }
    if (widget.themeColor != oldWidget.themeColor) {
      _themeColor = widget.themeColor;
    }
  }

  // ==========================================================================
  //  DONNÉES UTILISATEUR / FAVORIS
  // ==========================================================================
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _favoriteKeys = prefs.getStringList('user_favorites') ?? [];
    });
  }

  Future<void> _toggleFavorite(String key) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_favoriteKeys.contains(key)) {
        _favoriteKeys.remove(key);
      } else {
        _favoriteKeys.add(key);
      }
    });
    await prefs.setStringList('user_favorites', _favoriteKeys);
  }

  Future<void> _toggleAllFavorites() async {
    final allKeys = _allItemKeys;
    final allAreFavs = allKeys.every((k) => _favoriteKeys.contains(k));
    setState(() {
      if (allAreFavs) {
        _favoriteKeys.clear();
      } else {
        _favoriteKeys = List.from(allKeys);
      }
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('user_favorites', _favoriteKeys);
  }

  Future<void> _refreshData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    if (!mounted) return;
    setState(() {
      _userName = prefs.getString('user_name') ?? widget.userName;
      _currentLang = prefs.getString('user_lang') ?? widget.languageCode;
      _selectedAvatar = prefs.getString('user_avatar') ?? widget.selectedAvatar;
      _favoriteKeys = prefs.getStringList('user_favorites') ?? [];
      final int? colorVal = prefs.getInt('user_theme_color');
      if (colorVal != null) {
        _themeColor = Color(colorVal);
      }
    });
  }

  Future<void> _changeLanguage(String? newLang) async {
    if (newLang != null) {
      setState(() {
        _currentLang = newLang;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_lang', newLang);
    }
  }

  Future<void> _navigateToPage(String key) async {
    Widget page;
    switch (key) {
      case 'chateau_de_verseilles':
        page = ChateauDeVersaillesPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'chateau_de_chambord':
        page = ChateauDeChambordPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'calanque_de_sugiton':
        page = sugiton.CalanqueDeSugitonPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'calanques_de_cassis':
        page = cassis.CalanquesDeCassisPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'calanques_de_piana':
        page = piana.CalanquesDePianaPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'altschlossfelsen':
        page = altschlossfelsen.AltschlossfelsenPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'orgues_d_ille':
        page = orgues_d_ille.OrguesIlleSurTetPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'dune_du_pilat':
        page = dune_du_pilat.DuneDuPilatPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'rougier_de_camares':
        page = rougier_de_camares.RougierCamaresPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'buttes_chaumont':
        page = buttes_chaumont.ButtesChaumontPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'palais_ideal':
        page = palais_ideal.PalaisIdealPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'foret_fontainebleau':
        page = foret_fontainebleau.ForetFontainebleauPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'chemin_des_cimes':
        page = chemin_des_cimes.CheminCimesAlsacePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'foret_de_broceliande':
        page = foret_de_broceliande.ForetDeBroceliandePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'parc_monceau':
        page = parc_monceau.ParcMonceauPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'gouffre_de_padirac':
        page = gouffre_de_padirac.LeGouffreDePadiracPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'mont_saint_michel':
        page = mont_saint_michel.MontSaintMichelPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'gorges_du_verdon':
        page = gorges_du_verdon.GorgesDuVerdonPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'ile_de_la_vierge':
        page = ile_de_la_vierge.IleDeLaViergePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'gorges_du_fier':
        page = gorges_du_fier.GorgesDuFierPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'cascades_des_tufs':
        page = cascades_des_tufs.CascadesDesTufsPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'meandre_de_queuille':
        page = meandre_de_queuille.MeandreQueuillePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'lac_de_lorceyrette':
        page = lac_de_lorceyrette.LacOrceyrettePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'lac_d_allos':
        page = lac_d_allos.LacDAllosPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'plateau_des_1000_etangs':
        page = plateau_des_1000_etangs.PlateauMilleEtangsPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'puy_de_dome':
        page = puy_de_dome.PuyDeDomePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'pont_du_gard':
        page = pont_du_gard.PontDuGardPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'marais_d_aigues_mortes':
        page = marais_d_aigues_mortes.MaraisSalantsAiguesMortesPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'etretat':
        page = etretat.EtretatPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'sentier_des_ocres':
        page = sentier_des_ocres.SentierDesOcresPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      default:
        page = const Scaffold(
          body: Center(
            child: Text('Page introuvable'),
          ),
        );
    }

    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    );
    await _refreshData();
  }

  Future<void> _openFavoris() async {
    HapticFeedback.selectionClick();
    await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, anim, secAnim) =>
            FavorisPage(languageCode: _currentLang, themeColor: _themeColor),
        transitionsBuilder: (context, anim, secAnim, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
    await _refreshData();
  }

  // ==========================================================================
  //  LOGIQUE D'AFFICHAGE
  // ==========================================================================
  bool get _showHero => _currentIndex == 1 && _feedFilter == 'all' && _query.trim().isEmpty;

  void _startHeroTimer() {
    _heroTimer?.cancel();
    _heroTimer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (!mounted || !_showHero || !_heroController.hasClients) return;
      final int n = _heroItems.length;
      if (n < 2) return;
      _heroController.animateToPage(
        (_heroPage + 1) % n,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  void _selectTab(int index) {
    if (index == _currentIndex) return;
    HapticFeedback.selectionClick();
    FocusScope.of(context).unfocus();
    setState(() {
      _currentIndex = index;
      _feedFilter = 'all';
      _tabHistory.add(index);
    });
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }
    if (index == 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _heroController.hasClients) {
          _heroController.jumpToPage(_heroPage);
        }
      });
    }
  }

  String _norm(String s) {
    const Map<String, String> m = {
      'é': 'e', 'è': 'e', 'ê': 'e', 'ë': 'e',
      'à': 'a', 'â': 'a', 'ä': 'a',
      'î': 'i', 'ï': 'i',
      'ô': 'o', 'ö': 'o',
      'ù': 'u', 'û': 'u', 'ü': 'u',
      'ç': 'c', 'œ': 'oe', '’': "'",
    };
    final StringBuffer b = StringBuffer();
    for (final int r in s.toLowerCase().runes) {
      final String ch = String.fromCharCode(r);
      b.write(m[ch] ?? ch);
    }
    return b.toString();
  }

  String _displayName() => _userName.isNotEmpty ? _userName : 'Coco';

  /// Un lieu par catégorie pour le carrousel « À la une ».
  /// Il change chaque mois et tourne dans l'ordre de la liste de la catégorie.
  List<Map<String, String>> get _heroItems {
    final DateTime now = DateTime.now();
    final int monthIndex = now.year * 12 + now.month;
    final List<Map<String, String>> out = [];
    final List<Map<String, dynamic>> cats = [..._chateauxCategories, ..._paysagesCategories];
    for (final c in cats) {
      final items = c['items'] as List<Map<String, String>>;
      if (items.isNotEmpty) {
        out.add({
          ...items[monthIndex % items.length],
          'categoryKey': c['categoryKey'] as String,
        });
      }
    }
    return out.take(6).toList();
  }

  /// Catégories visibles selon l'onglet, le filtre et la recherche.
  List<Map<String, dynamic>> _visibleGroups() {
    final List<Map<String, dynamic>> source = _currentIndex == 0
        ? _chateauxCategories
        : _currentIndex == 2
        ? _paysagesCategories
        : [..._chateauxCategories, ..._paysagesCategories];
    final String q = _norm(_query.trim());
    final List<Map<String, dynamic>> out = [];
    for (final c in source) {
      final String key = c['categoryKey'] as String;
      if (_feedFilter != 'all' && _feedFilter != key) continue;
      final List<Map<String, String>> items =
      (c['items'] as List<Map<String, String>>).where((it) {
        if (q.isEmpty) return true;
        return _norm(luxClean(it['name']!)).contains(q) || _norm(it['desc']!).contains(q);
      }).toList();
      if (items.isNotEmpty) {
        out.add({'categoryKey': key, 'items': items});
      }
    }
    return out;
  }

  List<List<String>> _filterChips(Map<String, String> t) {
    final List<Map<String, dynamic>> cats = _currentIndex == 0
        ? _chateauxCategories
        : _currentIndex == 2
        ? _paysagesCategories
        : [..._chateauxCategories, ..._paysagesCategories];
    final List<List<String>> chips = [
      ['all', t['all'] ?? 'Tous'],
    ];
    for (final c in cats) {
      final String key = c['categoryKey'] as String;
      chips.add([key, LuxCategory.shortLabel(key, _currentLang)]);
    }
    return chips;
  }

  // ==========================================================================
  //  BUILD
  // ==========================================================================
  @override
  Widget build(BuildContext context) {
    final Map<String, String> t = _translations[_currentLang] ?? _translations['fr']!;
    final bool isRtl = _currentLang == 'ar';
    final MediaQueryData mq = MediaQuery.of(context);
    final bool keyboardOpen = mq.viewInsets.bottom > 0;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: PopScope(
        canPop: _tabHistory.length <= 1,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && _tabHistory.length > 1) {
            setState(() {
              _tabHistory.removeLast();
              _currentIndex = _tabHistory.last;
              _feedFilter = 'all';
            });
          }
        },
        child: Scaffold(
          backgroundColor: ModernTheme.background,
          body: LuxBackdrop(
            color: _themeColor,
            child: Stack(
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.only(bottom: 160 + mq.padding.bottom),
                    child: TweenAnimationBuilder<double>(
                      key: ValueKey<int>(_currentIndex),
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 420),
                      curve: Curves.easeOutCubic,
                      child: _currentIndex == 1
                          ? _buildHomeTab(t, isRtl, mq)
                          : _buildListTab(t, isRtl, mq),
                      builder: (context, v, child) => Opacity(
                        opacity: v.clamp(0.0, 1.0).toDouble(),
                        child: child,
                      ),
                    ),
                  ),
                ),

                // ---- Voile sous la barre de navigation ----
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 150 + mq.padding.bottom,
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ModernTheme.background.withOpacity(0.0),
                            ModernTheme.background.withOpacity(0.82),
                            ModernTheme.background,
                          ],
                          stops: const [0.0, 0.6, 1.0],
                        ),
                      ),
                    ),
                  ),
                ),

                // ---- Barre de navigation flottante ----
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: AnimatedSlide(
                    duration: const Duration(milliseconds: 260),
                    curve: Curves.easeOutCubic,
                    offset: keyboardOpen ? const Offset(0, 1.8) : Offset.zero,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(22, 0, 22, mq.padding.bottom + 14),
                      child: _buildDock(t),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  //  ONGLET ACCUEIL
  // ==========================================================================
  Widget _buildHomeTab(Map<String, String> t, bool isRtl, MediaQueryData mq) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, mq.padding.top + 12, 20, 0),
          child: _buildTopBar(t),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
          child: _buildHeadline(t, isRtl),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildSearchField(t),
        ),
        if (_showHero) ...[
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              t['featured']!,
              style: luxDisplay(26, rtl: isRtl, letterSpacing: -0.5),
            ),
          ),
          const SizedBox(height: 16),
          _buildCarousel(t, isRtl),
        ],
        const SizedBox(height: 38),
        _buildCategoryRail(t),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildGroups(t, isRtl),
        ),
      ],
    );
  }

  Widget _buildHeadline(Map<String, String> t, bool isRtl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t['headline']!,
          style: luxDisplay(46, rtl: isRtl, height: 1.04, letterSpacing: -1.5),
        ),
        const SizedBox(height: 20),
        Text(
          t['franceIntro']!,
          style: const TextStyle(
            color: ModernTheme.textMuted,
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  // ---- Barre du haut : avatar, favoris, réglages ---------------------------
  Widget _buildTopBar(Map<String, String> t) {
    return Row(
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: AnimatedBuilder(
            animation: _ambientController,
            builder: (context, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(56, 56),
                    painter: LuxRingPainter(
                      angle: _ambientController.value * 2 * math.pi,
                      color: _themeColor,
                    ),
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [ModernTheme.surfaceCard, ModernTheme.surface],
                      ),
                    ),
                    child: Center(
                      child: Text(_selectedAvatar, style: const TextStyle(fontSize: 22)),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                t['welcome']!,
                style: const TextStyle(
                  color: ModernTheme.textMuted,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                _displayName(),
                style: const TextStyle(
                  color: ModernTheme.textLight,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
        LuxPress(
          onTap: _openFavoris,
          child: LuxGlass(
            radius: 22,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.favorite_rounded, color: ModernTheme.secondaryAccent, size: 18),
                const SizedBox(width: 7),
                Text(
                  '${_favoriteKeys.length}',
                  style: const TextStyle(
                    color: ModernTheme.textLight,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        LuxPress(
          onTap: _openSettingsSheet,
          child: const LuxGlass(
            radius: 22,
            width: 44,
            height: 44,
            alignment: Alignment.center,
            child: Icon(Icons.tune_rounded, color: ModernTheme.textLight, size: 21),
          ),
        ),
      ],
    );
  }

  // ---- Recherche -----------------------------------------------------------
  Widget _buildSearchField(Map<String, String> t) {
    final bool hasQuery = _query.isNotEmpty;
    return LuxGlass(
      radius: 20,
      height: 54,
      fillOpacity: 0.06,
      borderOpacity: 0.12,
      padding: const EdgeInsetsDirectional.only(start: 16, end: 8),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            size: 22,
            color: hasQuery ? _themeColor : ModernTheme.textMuted,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _searchController,
              cursorColor: _themeColor,
              textInputAction: TextInputAction.search,
              onChanged: (v) => setState(() {
                _query = v;
                _heroPage = 0;
              }),
              style: const TextStyle(
                color: ModernTheme.textLight,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                isDense: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: t['searchHint'],
                hintStyle: const TextStyle(
                  color: ModernTheme.textMuted,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          if (hasQuery)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                HapticFeedback.selectionClick();
                _searchController.clear();
                setState(() {
                  _query = '';
                  _heroPage = 0;
                });
              },
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.1),
                ),
                child: const Icon(Icons.close_rounded, color: ModernTheme.textLight, size: 18),
              ),
            ),
        ],
      ),
    );
  }

  // ==========================================================================
  //  CARROUSEL « À LA UNE »
  // ==========================================================================
  Widget _buildCarousel(Map<String, String> t, bool isRtl) {
    final List<Map<String, String>> items = _heroItems;
    return Column(
      children: [
        SizedBox(
          height: 470,
          child: PageView.builder(
            controller: _heroController,
            itemCount: items.length,
            onPageChanged: (i) => setState(() => _heroPage = i),
            itemBuilder: (context, index) => _buildHeroCard(items[index], index, t, isRtl),
          ),
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(items.length, (i) {
            final bool sel = i == _heroPage;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: sel ? 26 : 7,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: sel ? _themeColor : Colors.white.withOpacity(0.2),
                boxShadow: sel
                    ? [BoxShadow(color: _themeColor.withOpacity(0.6), blurRadius: 10)]
                    : [],
              ),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildHeroCard(Map<String, String> item, int index, Map<String, String> t, bool isRtl) {
    final String key = item['key']!;
    final String title = luxClean(item['name']!);
    final String desc = item['desc']!;
    final String catKey = item['categoryKey']!;
    final Color catColor = LuxCategory.color(catKey);
    final String category = LuxCategory.shortLabel(catKey, _currentLang);

    return AnimatedBuilder(
      animation: _heroController,
      builder: (context, _) {
        double page = _heroPage.toDouble();
        if (_heroController.hasClients && _heroController.position.haveDimensions) {
          page = _heroController.page ?? page;
        }
        final double d = (page - index).clamp(-1.0, 1.0).toDouble();
        final double a = d.abs();

        return Transform.scale(
          scale: 1 - a * 0.09,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: LuxPress(
              onTap: () => _navigateToPage(key),
              pressedScale: 0.985,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: Colors.white.withOpacity(0.12), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: _themeColor.withOpacity(0.30 * (1 - a)),
                      blurRadius: 34,
                      offset: const Offset(0, 16),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.45),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        item['imagepath']!,
                        fit: BoxFit.cover,
                        cacheWidth: 1000,
                        alignment: Alignment(d * 0.8 * (isRtl ? -1 : 1), 0),
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: ModernTheme.surface,
                          child: const Center(
                            child: Icon(Icons.image_not_supported_rounded, color: ModernTheme.textMuted, size: 48),
                          ),
                        ),
                      ),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.28),
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.55),
                              Colors.black.withOpacity(0.92),
                            ],
                            stops: const [0.0, 0.32, 0.64, 1.0],
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        top: 22,
                        start: 22,
                        end: 86,
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: LuxGlass(
                            radius: 16,
                            blur: 0,
                            fillOpacity: 0.0,
                            borderOpacity: 0.22,
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.42),
                                Colors.black.withOpacity(0.32),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(LuxCategory.icon(catKey), color: catColor, size: 15),
                                const SizedBox(width: 7),
                                Flexible(
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      PositionedDirectional(
                        top: 18,
                        end: 20,
                        child: _heartBadge(key, size: 44),
                      ),
                      PositionedDirectional(
                        start: 28,
                        end: 28,
                        bottom: 28,
                        child: Opacity(
                          opacity: (1 - a * 1.5).clamp(0.0, 1.0).toDouble(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: luxDisplay(
                                  29,
                                  rtl: isRtl,
                                  height: 1.1,
                                  letterSpacing: -0.6,
                                ).copyWith(
                                  shadows: [Shadow(color: Colors.black.withOpacity(0.55), blurRadius: 14)],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                desc,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.78),
                                  fontSize: 13.5,
                                  height: 1.45,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      t['discover']!,
                                      style: const TextStyle(
                                        color: Color(0xFF0A0B14),
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Icon(
                                      isRtl ? Icons.north_west_rounded : Icons.north_east_rounded,
                                      color: const Color(0xFF0A0B14),
                                      size: 16,
                                    ),
                                  ],
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
            ),
          ),
        );
      },
    );
  }

  // ==========================================================================
  //  ONGLETS CHÂTEAUX / PAYSAGES
  // ==========================================================================
  Widget _buildListTab(Map<String, String> t, bool isRtl, MediaQueryData mq) {
    final bool chateaux = _currentIndex == 0;
    final String title = chateaux ? t['chateaux']! : t['paysages']!;
    final String intro = chateaux ? t['chateauxIntro']! : t['paysagesIntro']!;
    final List<Map<String, dynamic>> cats = chateaux ? _chateauxCategories : _paysagesCategories;
    int total = 0;
    for (final c in cats) {
      total += (c['items'] as List).length;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              PositionedDirectional(
                top: mq.padding.top + 70,
                end: -36,
                child: Icon(
                  chateaux ? Icons.fort_rounded : Icons.terrain_rounded,
                  size: 220,
                  color: Colors.white.withOpacity(0.045),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, mq.padding.top + 12, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopBar(t),
                    const SizedBox(height: 34),
                    LuxGlass(
                      radius: 14,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            chateaux ? Icons.fort_rounded : Icons.terrain_rounded,
                            size: 15,
                            color: _themeColor,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            luxPlaces(total, _currentLang),
                            style: const TextStyle(
                              color: ModernTheme.textLight,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: luxDisplay(54, rtl: isRtl, height: 1.0, letterSpacing: -2.0),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      intro,
                      style: const TextStyle(
                        color: ModernTheme.textMuted,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildSearchField(t),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (!chateaux) ...[
          const SizedBox(height: 24),
          _buildCategoryRail(t),
        ],
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildGroups(t, isRtl),
        ),
      ],
    );
  }

  // ==========================================================================
  //  FILTRES PAR CATÉGORIE
  // ==========================================================================
  Widget _buildCategoryRail(Map<String, String> t) {
    final List<List<String>> chips = _filterChips(t);
    if (chips.length <= 2) return const SizedBox.shrink();

    return SizedBox(
      height: 46,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: chips.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final String key = chips[index][0];
          final bool selected = _feedFilter == key;
          final bool isAll = key == 'all';
          return LuxPress(
            onTap: () {
              HapticFeedback.selectionClick();
              setState(() {
                _feedFilter = key;
                _heroPage = 0;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 260),
              curve: Curves.easeOutCubic,
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                gradient: selected ? luxGradient(_themeColor) : null,
                color: selected ? null : Colors.white.withOpacity(0.06),
                border: Border.all(
                  color: selected ? Colors.transparent : Colors.white.withOpacity(0.11),
                  width: 1,
                ),
                boxShadow: selected
                    ? [
                  BoxShadow(
                    color: _themeColor.withOpacity(0.45),
                    blurRadius: 16,
                    offset: const Offset(0, 5),
                  ),
                ]
                    : [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isAll ? Icons.grid_view_rounded : LuxCategory.icon(key),
                    size: 18,
                    color: selected
                        ? Colors.white
                        : (isAll ? ModernTheme.textMuted : LuxCategory.color(key)),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    chips[index][1],
                    style: TextStyle(
                      color: selected ? Colors.white : ModernTheme.textMuted,
                      fontSize: 13.5,
                      fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ==========================================================================
  //  SECTIONS + MOSAÏQUE
  // ==========================================================================
  Widget _buildGroups(Map<String, String> t, bool isRtl) {
    final List<Map<String, dynamic>> groups = _visibleGroups();
    if (groups.isEmpty) return _buildEmpty(t);

    final List<Widget> children = [];
    for (final g in groups) {
      final String catKey = g['categoryKey'] as String;
      final List<Map<String, String>> items = g['items'] as List<Map<String, String>>;
      children.add(_buildSectionHeader(catKey, items.length, t));
      children.add(const SizedBox(height: 18));
      children.add(_buildBento(items, catKey));
      children.add(const SizedBox(height: 34));
    }

    return Column(
      key: ValueKey<String>('feed$_currentIndex$_feedFilter$_currentLang'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }

  Widget _buildSectionHeader(String catKey, int count, Map<String, String> t) {
    final Color c = LuxCategory.color(catKey);
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: c.withOpacity(0.15),
            border: Border.all(color: c.withOpacity(0.4), width: 1),
          ),
          child: Icon(LuxCategory.icon(catKey), color: c, size: 21),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            luxClean(t[catKey] ?? catKey),
            style: const TextStyle(
              color: ModernTheme.textLight,
              fontSize: 16.5,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          luxPlaces(count, _currentLang),
          style: const TextStyle(
            color: ModernTheme.textMuted,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  /// Premier lieu en grande carte, puis deux petites cartes côte à côte.
  Widget _buildBento(List<Map<String, String>> items, String catKey) {
    final List<Widget> rows = [];
    int i = 0;
    while (i < items.length) {
      final bool big = i == 0 || items.length - i == 1;
      if (big) {
        rows.add(_buildTile(items[i], catKey, height: i == 0 ? 240 : 190, big: true));
        i += 1;
      } else {
        rows.add(
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTile(items[i], catKey, height: 210, big: false)),
              const SizedBox(width: 14),
              Expanded(child: _buildTile(items[i + 1], catKey, height: 210, big: false)),
            ],
          ),
        );
        i += 2;
      }
      if (i < items.length) rows.add(const SizedBox(height: 14));
    }
    return Column(children: rows);
  }

  Widget _buildTile(Map<String, String> item, String catKey, {required double height, required bool big}) {
    final String key = item['key']!;
    final String title = luxClean(item['name']!);
    final bool isFav = _favoriteKeys.contains(key);
    final bool isRtl = _currentLang == 'ar';
    final BorderRadius radius = BorderRadius.circular(big ? 30 : 24);
    final Color catColor = LuxCategory.color(catKey);

    return LuxPress(
      onTap: () => _navigateToPage(key),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            color: isFav ? _themeColor.withOpacity(0.85) : Colors.white.withOpacity(0.08),
            width: isFav ? 1.6 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isFav ? _themeColor.withOpacity(0.32) : Colors.black.withOpacity(0.4),
              blurRadius: isFav ? 22 : 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                item['imagepath']!,
                fit: BoxFit.cover,
                cacheWidth: big ? 1000 : 640,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: ModernTheme.surface,
                  child: const Center(
                    child: Icon(Icons.image_not_supported_rounded, color: ModernTheme.textMuted, size: 34),
                  ),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.18),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.55),
                      Colors.black.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.38, 0.7, 1.0],
                  ),
                ),
              ),
              PositionedDirectional(
                top: 12,
                end: 12,
                child: _heartBadge(key, size: 36),
              ),
              PositionedDirectional(
                start: big ? 22 : 16,
                end: big ? 22 : 16,
                bottom: big ? 22 : 16,
                child: big
                    ? Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: luxDisplay(
                              22,
                              rtl: isRtl,
                              height: 1.12,
                              letterSpacing: -0.4,
                            ).copyWith(
                              shadows: [Shadow(color: Colors.black.withOpacity(0.55), blurRadius: 10)],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['desc']!,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.74),
                              fontSize: 12.5,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        isRtl ? Icons.north_west_rounded : Icons.north_east_rounded,
                        color: const Color(0xFF0A0B14),
                        size: 19,
                      ),
                    ),
                  ],
                )
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 26,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: catColor,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        letterSpacing: isRtl ? 0 : -0.2,
                        shadows: [Shadow(color: Colors.black.withOpacity(0.6), blurRadius: 8)],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty(Map<String, String> t) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 56),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LuxGlass(
              radius: 36,
              width: 72,
              height: 72,
              alignment: Alignment.center,
              child: Icon(Icons.search_off_rounded, color: ModernTheme.textMuted, size: 32),
            ),
            const SizedBox(height: 18),
            Text(
              t['noResults']!,
              style: const TextStyle(
                color: ModernTheme.textLight,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              t['noResultsHint']!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: ModernTheme.textMuted, fontSize: 13.5, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heartBadge(String itemKey, {double size = 36}) {
    final bool isFav = _favoriteKeys.contains(itemKey);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        HapticFeedback.selectionClick();
        _toggleFavorite(itemKey);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 260),
        curve: Curves.easeOutCubic,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isFav ? ModernTheme.secondaryAccent : Colors.black.withOpacity(0.38),
          border: Border.all(
            color: isFav ? Colors.white.withOpacity(0.5) : Colors.white.withOpacity(0.28),
            width: 1.2,
          ),
          boxShadow: isFav
              ? [BoxShadow(color: ModernTheme.secondaryAccent.withOpacity(0.55), blurRadius: 16)]
              : [],
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 260),
          transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
          child: Icon(
            isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
            key: ValueKey<bool>(isFav),
            color: Colors.white,
            size: size * 0.52,
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  //  BARRE DE NAVIGATION : capsule en verre, pastille active qui s'étend
  // ==========================================================================
  Widget _buildDock(Map<String, String> t) {
    final List<Map<String, dynamic>> tabs = [
      {'i': 0, 'icon': Icons.fort_rounded, 'label': t['chateaux']!},
      {'i': 1, 'icon': Icons.explore_rounded, 'label': t['home']!},
      {'i': 2, 'icon': Icons.terrain_rounded, 'label': t['paysages']!},
    ];

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.55),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: _themeColor.withOpacity(0.18),
            blurRadius: 44,
            spreadRadius: -8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.15),
                  Colors.white.withOpacity(0.05),
                ],
              ),
              border: Border.all(color: Colors.white.withOpacity(0.17), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tabs.map((tab) {
                final int i = tab['i'] as int;
                final bool selected = _currentIndex == i;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => _selectTab(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 340),
                    curve: Curves.easeOutCubic,
                    height: 54,
                    padding: EdgeInsets.symmetric(horizontal: selected ? 20 : 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: selected ? luxGradient(_themeColor) : null,
                      boxShadow: selected
                          ? [
                        BoxShadow(
                          color: _themeColor.withOpacity(0.55),
                          blurRadius: 18,
                          offset: const Offset(0, 5),
                        ),
                      ]
                          : [],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          tab['icon'] as IconData,
                          color: selected ? Colors.white : ModernTheme.textMuted,
                          size: 24,
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 340),
                          curve: Curves.easeOutCubic,
                          child: selected
                              ? Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8),
                            child: Text(
                              tab['label'] as String,
                              maxLines: 1,
                              softWrap: false,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13.5,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  //  PANNEAU RÉGLAGES (langue, favoris, paramètres)
  // ==========================================================================
  void _openSettingsSheet() {
    HapticFeedback.selectionClick();
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.6),
      isScrollControlled: true,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (ctx, setSheet) {
            final Map<String, String> t = _translations[_currentLang] ?? _translations['fr']!;
            final bool isRtl = _currentLang == 'ar';
            final List<String> allKeys = _allItemKeys;
            final bool allAreFavs =
                allKeys.isNotEmpty && allKeys.every((k) => _favoriteKeys.contains(k));
            const List<List<String>> langs = [
              ['fr', '🇫🇷', 'Français'],
              ['en', '🇬🇧', 'English'],
              ['ar', '🇸🇦', 'العربية'],
            ];

            return Directionality(
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ModernTheme.surfaceCard.withOpacity(0.93),
                          ModernTheme.background.withOpacity(0.97),
                        ],
                      ),
                      border: Border(
                        top: BorderSide(color: Colors.white.withOpacity(0.14), width: 1),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(22, 12, 22, 24 + MediaQuery.of(ctx).padding.bottom),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 44,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.22),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          Row(
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: luxGradient(_themeColor),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _themeColor.withOpacity(0.45),
                                      blurRadius: 20,
                                    ),
                                  ],
                                ),
                                child: Text(_selectedAvatar, style: const TextStyle(fontSize: 29)),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _displayName(),
                                      style: luxDisplay(22, rtl: isRtl, letterSpacing: -0.4),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.favorite_rounded,
                                          color: ModernTheme.secondaryAccent,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          luxPlaces(_favoriteKeys.length, _currentLang),
                                          style: const TextStyle(
                                            color: ModernTheme.textMuted,
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          _sheetLabel(Icons.translate_rounded, t['changeLangLabel']!),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              for (int i = 0; i < langs.length; i++) ...[
                                if (i > 0) const SizedBox(width: 8),
                                Expanded(
                                  child: _sheetLangTile(
                                    selected: _currentLang == langs[i][0],
                                    flag: langs[i][1],
                                    label: langs[i][2],
                                    onTap: () async {
                                      HapticFeedback.selectionClick();
                                      await _changeLanguage(langs[i][0]);
                                      setSheet(() {});
                                    },
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 26),
                          _sheetAction(
                            icon: allAreFavs
                                ? Icons.heart_broken_rounded
                                : Icons.playlist_add_check_rounded,
                            color: ModernTheme.secondaryAccent,
                            label: allAreFavs ? t['removeAllFavs']! : t['selectAllFavs']!,
                            onTap: () async {
                              HapticFeedback.mediumImpact();
                              await _toggleAllFavorites();
                              setSheet(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                          _sheetAction(
                            icon: Icons.settings_rounded,
                            color: _themeColor,
                            label: t['settings']!,
                            onTap: () async {
                              Navigator.pop(sheetContext);
                              await Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, anim, secAnim) =>
                                      ParametresScreen(languageCode: _currentLang),
                                  transitionsBuilder: (context, anim, secAnim, child) =>
                                      FadeTransition(opacity: anim, child: child),
                                ),
                              );
                              await _refreshData();
                            },
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
      },
    );
  }

  Widget _sheetLabel(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: _themeColor, size: 19),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: ModernTheme.textLight,
              fontSize: 14.5,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }

  Widget _sheetLangTile({
    required bool selected,
    required String flag,
    required String label,
    required VoidCallback onTap,
  }) {
    return LuxPress(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? _themeColor.withOpacity(0.18) : Colors.white.withOpacity(0.05),
          border: Border.all(
            color: selected ? _themeColor : Colors.white.withOpacity(0.1),
            width: selected ? 1.6 : 1,
          ),
          boxShadow: selected
              ? [BoxShadow(color: _themeColor.withOpacity(0.3), blurRadius: 14)]
              : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(flag, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : ModernTheme.textMuted,
                fontSize: 12.5,
                fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sheetAction({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return LuxPress(
      onTap: onTap,
      child: LuxGlass(
        radius: 22,
        fillOpacity: 0.05,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: color.withOpacity(0.16),
                border: Border.all(color: color.withOpacity(0.4), width: 1),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: ModernTheme.textLight,
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}