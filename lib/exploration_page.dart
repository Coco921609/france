import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  BannerAd? _bannerAd;
  bool _isBannerLoaded = false;

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
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(testDeviceIds: ['A1AAA9CA564B335AC3E58290B97E6519']),
    );
    switch (widget.langueInitiale) {
      case 'fr': _langIndex = 0; break;
      case 'en': _langIndex = 1; break;
      case 'ar': _langIndex = 2; break;
      default: _langIndex = 0;
    }

    Future.microtask(() {
      if (!mounted) return;
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

      _loadBannerAd();
    });
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-7603932896617713/4541640536',
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (mounted) {
            setState(() {
              _isBannerLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _borderTimer?.cancel();
    _imageTimer?.cancel();
    _bannerAd?.dispose();
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
  ];

  final List<Map<String, String>> translations = [
    {'title': 'France Secrète', 'sub': 'Tout le monde connaît la tour Eiffel, mais personne ne connaît les autres endroits cachés en France qui sont magnifiques du Nord, Sud, Ouest, Est, Sud-Est, Sud-Ouest, Nord-Est et Nord-Ouest etc. Explorez ces merveilles dissimulées à travers tout le pays.', 'explore': 'Explorer Le Pays', 'insta': 'Instagram', 'web': 'Site Web', 'jeux': 'Jeux'},
    {'title': 'Secret France', 'sub': 'Everyone knows the Eiffel Tower, but no one knows the other hidden places in France that are magnificent from North, South, West, East, South-East, South-West, North-East and North-West etc. Explore these wonders hidden throughout the country.', 'explore': 'Explore The Country', 'insta': 'Instagram', 'web': 'Website', 'jeux': 'Games'},
    {'title': 'فرنسا السرية', 'sub': 'الجميع يعرف برج إيفل، لكن لا أحد يعرف الأماكن المخفية الأخرى في فرنسا التي تعد رائعة من الشمال والجنوب والغرب والشرق والجنوب الشرقي والجنوب الغربي والشمال الشرقي والشمال الغربي وما إلى ذلك. استكشف هذه العجائب المخفية في جميع أنحاء البلاد.', 'explore': 'استكشف البلاد', 'insta': 'إنستغرام', 'web': 'موقع إلكتروني', 'jeux': 'ألعاب'},
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
                          SizedBox(
                            height: 220,
                            width: double.infinity,
                            child: Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              languageDb.length,
                                  (index) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: SizedBox(
                                    height: 60,
                                    child: _buildLangButton(index, languageDb[index]['color']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (_isBannerLoaded && _bannerAd != null) ...[
                            const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: _bannerAd!.size.width.toDouble(),
                                height: _bannerAd!.size.height.toDouble(),
                                child: AdWidget(ad: _bannerAd!),
                              ),
                            ),
                          ],
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