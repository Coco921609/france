import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';

import 'france_secrete_page.dart' as fr;
import 'secret_france_page.dart' as en;
import 'arabia_secret_france_page.dart';

class ExplorationPage extends StatefulWidget {
  final String langueInitiale;

  const ExplorationPage({super.key, required this.langueInitiale});

  @override
  State<ExplorationPage> createState() => _ExplorationPageState();
}

class _ExplorationPageState extends State<ExplorationPage> {
  int _langIndex = 0;
  int _borderColorIndex = 0;
  int _imageIndex = 0;
  Timer? _borderTimer;
  Timer? _imageTimer;

  final List<Color> _borderColors = [
    const Color(0xFFC5A059), Colors.blueAccent, Colors.greenAccent,
    Colors.redAccent, Colors.purpleAccent, Colors.orangeAccent, Colors.cyanAccent,
  ];

  final List<String> _imagesPaths = [
    'assets/images/939303-nature-landscape-clouds-sky-boat-sunset-trees.jpg',
    'assets/images/71.jpg',
    'assets/images/72.jpg',
    'assets/images/74.jpg',
    'assets/images/77.jpeg',
    'assets/images/99.jpg',
  ];

  @override
  void initState() {
    super.initState();
    switch (widget.langueInitiale) {
      case 'fr': _langIndex = 0; break;
      case 'en': _langIndex = 1; break;
      case 'ar': _langIndex = 2; break;
      case 'es': _langIndex = 3; break;
      case 'it': _langIndex = 4; break;
      case 'pt': _langIndex = 5; break;
      case 'de': _langIndex = 6; break;
      default: _langIndex = 0;
    }

    _borderTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _borderColorIndex = (_borderColorIndex + 1) % _borderColors.length;
        });
      }
    });

    _imageTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        setState(() {
          _imageIndex = (_imageIndex + 1) % _imagesPaths.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _borderTimer?.cancel();
    _imageTimer?.cancel();
    super.dispose();
  }

  Future<void> _triggerReview() async {
    final InAppReview inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  final List<Map<String, dynamic>> languageDb = [
    {'flag': '🇫🇷', 'code': 'FR', 'color': const Color(0xFFC5A059)},
    {'flag': '🇬🇧', 'code': 'EN', 'color': Colors.blueAccent},
    {'flag': '🇸🇦', 'code': 'AR', 'color': Colors.greenAccent},
    {'flag': '🇪🇸', 'code': 'ES', 'color': const Color(0xFFF44336)},
    {'flag': '🇮🇹', 'code': 'IT', 'color': const Color(0xFF00BFA5)},
    {'flag': '🇵🇹', 'code': 'PT', 'color': const Color(0xFFE91E63)},
    {'flag': '🇩🇪', 'code': 'DE', 'color': const Color(0xFFFFC107)},
  ];

  final List<Map<String, String>> translations = [
    {'title': 'France Secrète', 'sub': 'Tout le monde connaît la tour Eiffel, mais personne ne connaît les autres endroits cachés en France qui sont magnifiques du Nord, Sud, Ouest, Est, Sud-Est, Sud-Ouest, Nord-Est et Nord-Ouest etc. Explorez ces merveilles dissimulées à travers tout le pays.', 'explore': 'Explorer Le Pays', 'insta': 'Instagram', 'web': 'Site Web', 'jeux': 'Jeux'},
    {'title': 'Secret France', 'sub': 'Everyone knows the Eiffel Tower, but no one knows the other hidden places in France that are magnificent from North, South, West, East, South-East, South-West, North-East and North-West etc. Explore these wonders hidden throughout the country.', 'explore': 'Explore The Country', 'insta': 'Instagram', 'web': 'Website', 'jeux': 'Games'},
    {'title': 'فرنسا السرية', 'sub': 'الجميع يعرف برج إيفل، لكن لا أحد يعرف الأماكن المخفية الأخرى في فرنسا التي تعد رائعة من الشمال والجنوب والغرب والشرق والجنوب الشرقي والجنوب الغربي والشمال الشرقي والشمال الغربي وما إلى ذلك. استكشف هذه العجائب المخفية في جميع أنحاء البلاد.', 'explore': 'استكشف البلاد', 'insta': 'إنستغرام', 'web': 'موقع إلكتروني', 'jeux': 'ألعاب'},
    {'title': 'Francia Secreta', 'sub': 'Todo el mundo conoce la Torre Eiffel, pero nadie conoce los otros lugares ocultos de Francia que son magníficos del Norte, Sur, Oeste, Este, Sudeste, Sudoeste, Nordeste y Noroeste, etc. Explora estas maravillas escondidas por todo el país.', 'explore': 'Explorar el país', 'insta': 'Instagram', 'web': 'Sitio Web', 'jeux': 'Juegos'},
    {'title': 'Francia Segreta', 'sub': 'Tutti conoscono la Torre Eiffel, ma nessuno conosce gli altri luoghi nascosti della Francia che sono magnifici da Nord, Sud, Ovest, Est, Sud-Est, Sud-Ovest, Nord-Est e Nord-Ovest ecc. Esplora queste meraviglie nascoste in tutto il paese.', 'explore': 'Esplora il paese', 'insta': 'Instagram', 'web': 'Sito Web', 'jeux': 'Giochi'},
    {'title': 'França Secreta', 'sub': 'Todos conhecem a Torre Eiffel, mas ninguém conhece os outros lugares escondidos em França que são magníficos de Norte, Sul, Oeste, Este, Sudeste, Sudoeste, Nordeste e Noroeste, etc. Explore estas maravilhas escondidas por todo o país.', 'explore': 'Explorar o país', 'insta': 'Instagram', 'web': 'Site', 'jeux': 'Jogos'},
    {'title': 'Geheimnisvolles Frankreich', 'sub': 'Jeder kennt den Eiffelturm, aber niemand kennt die anderen verborgenen Orte in Frankreich, die von Norden, Süden, Westen, Osten, Südosten, Südwesten, Nordosten und Nordwesten usw. herrlich sind. Erkunden Sie diese im ganzen Land verborgenen Wunder.', 'explore': 'Das Land erkunden', 'insta': 'Instagram', 'web': 'Webseite', 'jeux': 'Spiele'},
  ];

  void _navigateToFrance() {
    _triggerReview();
    Widget pageToOpen;
    switch (_langIndex) {
      case 0: pageToOpen = fr.FranceSecretePage(); break;
      case 1: pageToOpen = const en.FranceSecretePage(); break;
      case 2: pageToOpen = const FranceSecretePage(); break;
      default: pageToOpen = fr.FranceSecretePage();
    }
    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => pageToOpen, transitionsBuilder: (context, animation, secondaryAnimation, child) => child));
  }

  Widget _buildSocialButton(String label, IconData icon, Color color, VoidCallback onTap) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(border: Border.all(color: color.withOpacity(0.5)), borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: color, size: 20),
                const SizedBox(width: 8),
                Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLangButton(int index, Color dynamicColor) {
    bool isSelected = _langIndex == index;
    return GestureDetector(
      onTap: () async {
        setState(() => _langIndex = index);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('langue_selectionnee', languageDb[index]['code'].toString().toLowerCase());
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? dynamicColor : Colors.white.withOpacity(0.05),
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? Colors.white24 : Colors.white10, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(languageDb[index]['flag'], style: const TextStyle(fontSize: 20)),
            Text(languageDb[index]['code'], style: GoogleFonts.montserrat(color: isSelected ? Colors.black : Colors.white54, fontWeight: FontWeight.bold, fontSize: 9)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isArabic = _langIndex == 2;
    Color currentColor = languageDb[_langIndex]['color'];
    Color currentBorderColor = _borderColors[_borderColorIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(translations[_langIndex]['title']!, style: GoogleFonts.cinzel(color: currentColor, fontSize: 28, fontWeight: FontWeight.w900)),
                          const SizedBox(height: 12),
                          Text(translations[_langIndex]['sub']!, textAlign: TextAlign.justify, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16, height: 1.6)),
                          const SizedBox(height: 25),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(minHeight: 180),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: currentBorderColor, width: 4),
                                image: DecorationImage(image: AssetImage(_imagesPaths[_imageIndex]), fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              _buildSocialButton(translations[_langIndex]['insta']!, Icons.camera_alt, const Color(0xFFE1306C), () => _launchURL('https://www.instagram.com/france.secrete.voyage/')),
                              _buildSocialButton(translations[_langIndex]['web']!, Icons.public, const Color(0xFF007BFF), () => _launchURL('https://horizonvoyages0.wixsite.com/france')),
                            ],
                          ),
                          const SizedBox(height: 15),
                          GestureDetector(
                            onTap: _navigateToFrance,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(color: currentColor, borderRadius: BorderRadius.circular(15)),
                              child: Center(child: Text(translations[_langIndex]['explore']!, style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 2))),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(4, (index) => Expanded(child: Padding(padding: const EdgeInsets.all(4.0), child: SizedBox(height: 60, child: _buildLangButton(index, languageDb[index]['color']))))),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(3, (index) => Expanded(child: Padding(padding: const EdgeInsets.all(4.0), child: SizedBox(height: 60, child: _buildLangButton(index + 4, languageDb[index + 4]['color']))))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}