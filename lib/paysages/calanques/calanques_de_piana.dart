import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalanquesDePianaPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const CalanquesDePianaPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<CalanquesDePianaPage> createState() => _CalanquesDePianaPageState();
}

class _CalanquesDePianaPageState extends State<CalanquesDePianaPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant CalanquesDePianaPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.themeColor != widget.themeColor) {
      setState(() {
        _currentColor = widget.themeColor;
      });
    }
    if (oldWidget.languageCode != widget.languageCode) {
      setState(() {
        _currentLanguageCode = widget.languageCode;
      });
    }
  }

  void _toggleLanguage() {
    setState(() {
      if (_currentLanguageCode == 'fr') {
        _currentLanguageCode = 'en';
      } else if (_currentLanguageCode == 'en') {
        _currentLanguageCode = 'ar';
      } else {
        _currentLanguageCode = 'fr';
      }
    });
  }

  String _getFlag(String code) {
    switch (code) {
      case 'fr':
        return '🇫🇷';
      case 'en':
        return '🇬🇧';
      case 'ar':
        return '🇸🇦';
      default:
        return '🇫🇷';
    }
  }

  List<Map<String, dynamic>> _generateDynamicMonths(String lang) {
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Calme)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Février (Petite affluence)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Mars (Printemps doux)
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Avril (Week-ends chargés)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Mai (Ponts, très fréquenté)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin (Début été, forte affluence)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet (Pic absolu, chaleur)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août (Pic absolu, surfréquenté)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Septembre (Encore du monde)
      {'top': Colors.orange, 'mid': Colors.grey, 'bot': Colors.grey},     // Octobre (Plus calme)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre (Tranquille)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Décembre (Fêtes)
    ];

    final List<String> monthNamesAr = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];

    final List<String> monthNamesEn = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    final List<String> monthNamesFr = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin',
      'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];

    List<String> currentNames = monthNamesFr;
    if (lang == 'ar') {
      currentNames = monthNamesAr;
    } else if (lang == 'en') {
      currentNames = monthNamesEn;
    }

    return List.generate(12, (index) {
      return {
        'nom': currentNames[index],
        'top': baseSeasonData[index]['top']!,
        'mid': baseSeasonData[index]['mid']!,
        'bot': baseSeasonData[index]['bot']!,
      };
    });
  }

  Map<String, dynamic> _getLocalizedData() {
    if (_currentLanguageCode == 'ar') {
      return {
        'title': 'بيانا ⛰️',
        'pageTitle': 'بيانا : جوهرة الغرانيت الأحمر',
        'introTitle': 'تاريخ وواقع خلجان بيانا',
        'introText': 'تصنف خلجان بيانا ضمن التراث العالمي للونسكو، وتشكل مشهداً رائعاً من صخور الغرانيت التي نحتها التعرية. بين الأزرق العميق لخليج بورتو والشعلات الحمراء للصخور، يقدم هذا الموقع مشهداً طبيعياً لا ينسى.',
        'translationsTitle': 'معاني الكلمات (الكورسيكية / المحلية)',
        'translations': [
          ['بيانا', 'السهل أو الهضبة المرتفعة'],
          ['كالانش', 'الشقوق أو الخلجان الصخرية الحمراء المنحوتة'],
          ['بورتو', 'المرسى أو الميناء البحري العميق'],
        ],
        'saisonsTitle': '📅 الفصول الموصى بها',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'النصائح',
        'saisons': [
          ['🌱 الربيع', 'مثالي، درجات حرارة معتدلة وطبيعة خلابة دون ازدحام صيفي.'],
          ['🍂 الخريف', 'رائع، طقس لطيف وألوان مذهلة على الصخور.'],
          ['☀️ الصيف', 'حار جداً، مع حركة مرور كثيفة على الطريق الضيق.'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['🌅 الصباح الباكر', 'مثالي لتجنب ازدحام السيارات على طريق D81 والاستمتاع بالهدوء.'],
          ['☀️ منتصف النهار', 'حرارة قوية وأشعة مباشرة على المنحدرات الوردية.'],
          ['🌇 وقت الغروب', 'الوقت السحري حيث تتوهج الصخور باللون الأحمر القاني.'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'parcoursTitle': '🗺️ مسار رحلة شاتوه فورت (Château Fort)',
        'etapes': [
          "البداية: من منعطف الطريق D81 (مواقف محدودة).",
          "المسار: اتباع مسار المشي الصاعد عبر الماكيا الكورسيكية.",
          "المناظر: إطلالات بانورامية مذهلة على خليج بورتو.",
          "الوصول: قلعة الصخور الطبيعية (Château Fort) ونقطة الرؤية الفريدة.",
        ],
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.directions_walk, "البداية: طريق D81 / مسار شاتوه فورت"],
          [Icons.timer, "حوالي ساعة إلى ساعتين حسب المسار"],
          [Icons.water_drop, "إحضار الماء بكثرة لعدم توفر نقاط الشرب"],
          [Icons.landscape, "الصعوبة: مسار متوجب بحذاء مشي مناسب"],
          [Icons.warning, "طريق ضيق يتطلب الحذر الشديد عند التقاطع"],
          [Icons.sunny, "حماية قوية من الشمس لصعوبة الظل في المسارات"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى الحذر على الطريق السياحي الضيق واحترام البيئة المحمية.',
        'legendeVert': '🟢 أخضر : فترة هادئة ومثالية للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام متوسط، يفضل الحذر',
        'legendeRouge': '🔴 أحمر : ذروة السياحة والحرارة والازدحام',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى الحذر أثناء القيادة على الطريق D81 نظراً لضيقه وكثرة السياح.',
        'histoireLabel': 'القصة والتاريخ المفصل',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة لخلجان بيانا حول العالم',
        'similarPlaces': [
          ['كانيون برايس (يوتا، الولايات المتحدة) 🇺🇸', 'تشابه كبير في التكوينات الصخرية الحمراء المنحوتة بفعل العوامل الطبيعية.'],
          ['رادريم (النرويج) 🇳🇴', 'منحدرات طبيعية مذهلة تغوص في المياه الصافية.'],
        ],
        'pianaInfo': {
          'titre': 'Calanques de Piana',
          'titreAffichage': 'محمية الغرانيت الأحمر في بيانا',
          'image': 'assets/image/42.jpg',
          'typeAcces': 'موقع محمي مسجل في التراث العالمي للونسكو / طريق سياحي مفتوح مع حذر',
          'histoire': 'تعتبر خلجان بيانا تحفة جيولوجية فريدة من نوعها في كورسيكا. تكونت بفعل التعرية المعقدة لصخور الغرانيت الأحمر، وتأخذ أشكالاً خيالية تثير خيال الزوار منذ قرون، مطلة بشكل مباشر على مياه خليج بورتو الفيروزية.',
          'saviezVous': 'هل تعلم أن العديد من الصخور في بيانا تحمل أسماء أشكال حيوانات أو أساطير مثل رأس الكلب أو الأسقف بناءً على تشكيلاتها الفريدة.',
          'photoAstuce': 'استغل ساعة الغروب لالتقاط أروع الصور حيث تتحول الصخور الوردية إلى درجات لونية نارية مذهلة.',
          'photosVerticales': [
            'assets/image/43.webp',
            'assets/image/45.jpg',
            'assets/image/48.jpg',
            'assets/image/49.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Piana ⛰️',
        'pageTitle': 'Piana : Red Granite Sanctuary',
        'introTitle': 'History & Reality of Piana Calanques',
        'introText': 'Listed as a UNESCO World Heritage site, the Piana Calanques form a grandiose landscape of granite rocks sculpted by erosion. Between the deep blue of the Gulf of Porto and the red flames of the rock, this site offers an unforgettable natural spectacle.',
        'translationsTitle': 'Corsican Translations',
        'translations': [
          ['Piana', 'The plain or elevated plateau'],
          ['Calanche', 'Red sculpted rock crevices and coves'],
          ['Porto', 'The deep anchorage or marine port'],
        ],
        'saisonsTitle': '📅 Recommended Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Tips',
        'saisons': [
          ['🌱 Spring', 'Ideal, mild temperatures and stunning blooming nature without heavy crowds.'],
          ['🍂 Autumn', 'Perfect, pleasant weather and gorgeous warm colors on the rocks.'],
          ['☀️ Summer', 'Very hot, with heavy traffic congestion on the narrow coastal road.'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['🌅 Early morning', 'Best to avoid traffic congestion on road D81 and enjoy total tranquility.'],
          ['☀️ Midday', 'Strong heat and direct harsh sunlight on the pink rock formations.'],
          ['🌇 Sunset', 'The magical hour when the granite rocks glow in deep fiery red shades.'],
        ],
        'galerieTitle': '📸 Place Overview',
        'parcoursTitle': '🗺️ Château Fort Trail Route',
        'etapes': [
          "Start: From the D81 road bend (limited parking spots).",
          "Path: Follow the hiking trail winding through the Corsican maquis.",
          "Views: Breathtaking panoramic overlooks of the Gulf of Porto.",
          "Arrival: The natural rock fortress (Château Fort) and unique viewpoint.",
        ],
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.directions_walk, "Start: D81 Road / Château Fort Trail"],
          [Icons.timer, "Approx. 1 to 2 hours depending on the hike"],
          [Icons.water_drop, "Bring plenty of water as there are no fountains along the trail"],
          [Icons.landscape, "Difficulty: Hiking shoes required for rocky terrain"],
          [Icons.warning, "Narrow winding road requiring extreme caution when passing vehicles"],
          [Icons.sunny, "Strong sun protection needed due to lack of shade"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Drive carefully on the narrow scenic road and respect the protected ecosystem.',
        'legendeVert': '🟢 Green: Calm and ideal period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution advised',
        'legendeRouge': '🔴 Red: Peak tourism, extreme heat, and heavy traffic',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Warning: Please drive carefully on road D81 due to its narrow width and heavy tourist traffic.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places to Piana Calanques Around the World',
        'similarPlaces': [
          ['Bryce Canyon (Utah, USA) 🇺🇸', 'Striking similarity in red rock amphitheater formations sculpted by natural erosion.'],
          ['Rødøya (Norway) 🇳🇴', 'Dramatic coastal mountain landscapes dropping straight into crystal waters.'],
        ],
        'pianaInfo': {
          'titre': 'Calanques de Piana',
          'titreAffichage': 'The Red Granite Sanctuary of Piana',
          'image': 'assets/image/42.jpg',
          'typeAcces': 'Protected UNESCO World Heritage site / Scenic road open with caution',
          'histoire': 'The Piana Calanques are a unique geological masterpiece in Corsica. Formed by the complex erosion of red granite rocks, they take on imaginative shapes that have inspired visitors for centuries, overlooking the turquoise waters of the Gulf of Porto.',
          'saviezVous': 'Did you know that many rock formations in Piana are named after animal shapes or legends, such as the Dog\'s Head or the Bishop, based on their unique silhouettes.',
          'photoAstuce': 'Take advantage of the golden hour near sunset to capture the stunning transformation of pink rocks into fiery red tones.',
          'photosVerticales': [
            'assets/image/43.webp',
            'assets/image/45.jpg',
            'assets/image/48.jpg',
            'assets/image/49.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Piana ⛰️',
        'pageTitle': 'Calanques de Piana : Sanctuaire de Granit',
        'introTitle': 'L’Histoire et la réalité des Calanques de Piana',
        'introText': "Classées au patrimoine mondial de l'UNESCO, les Calanques de Piana forment un paysage grandiose de roches granitiques sculptées par l'érosion. Entre le bleu profond du Golfe de Porto et les flammes rouges de la roche, ce site offre un spectacle naturel inoubliable.",
        'translationsTitle': 'Traductions provençales',
        'translations': [
          ['Piana', 'La plaine ou le plateau élevé'],
          ['Calanche', 'Les failles et criques rocheuses de granit rouge'],
          ['Porto', 'Le port ou le mouillage maritime profond'],
        ],
        'saisonsTitle': '📅 Saisons recommandées',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Conseils',
        'saisons': [
          ['🌱 Printemps', 'Idéal, températures douces et nature éclatante sans la foule estivale.'],
          ['🍂 Automne', 'Parfait, météo clémente et superbes teintes chaudes sur la roche.'],
          ['☀️ Été', 'Très chaud, circulation dense sur la route côtière étroite.'],
        ],
        'horairesTitle': '⏰ Horaires conseillés',
        'momentHeader': 'Moment',
        'horaires': [
          ['🌅 Tôt le matin', 'Idéal pour éviter les embouteillages sur la route D81 et profiter du calme.'],
          ['☀️ Milieu journée', 'Forte chaleur et soleil direct sur les roches roses.'],
          ['🌇 Soir', 'Moment magique où les roches s’embrasent de teintes rouge vif au coucher du soleil.'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'parcoursTitle': '🗺️ Parcours du sentier du Château Fort',
        'etapes': [
          "Départ : Depuis un lacet de la route D81 (stationnement limité).",
          "Sentier : Suivre le sentier de randonnée serpentant dans le maquis corse.",
          "Vues : Panoramas vertigineux surplombant le Golfe de Porto.",
          "Arrivée : Le rocher sculpté en forme de château fort et son belvédère.",
        ],
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.directions_walk, "Départ : Route D81 / Sentier du Château Fort"],
          [Icons.timer, "Environ 1h à 2h de marche selon le parcours"],
          [Icons.water_drop, "Prévoir beaucoup d'eau (aucune fontaine sur le sentier)"],
          [Icons.landscape, "Difficulté : Chaussures de marche conseillées sur terrain rocheux"],
          [Icons.warning, "Route très étroite exigeant une prudence maximale lors des croisements"],
          [Icons.sunny, "Fort ensoleillement, protection solaire indispensable"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Mi-mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Soyez prudents sur la route touristique étroite et respectez le site protégé.',
        'legendeVert': '🟢 Vert : Période idéale (peu d’affluence, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence (pic estival, circulation dense)',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Soyez très vigilants lors de la conduite sur la route D81 en raison de sa configuration étroite et de sa forte fréquentation touristique.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires aux calanques de Piana dans le monde',
        'similarPlaces': [
          ['Bryce Canyon (Utah, USA) 🇺🇸', 'Une ressemblance frappante avec ses amphithéâtres de roches rouges sculptées par l’érosion.'],
          ['Rødøya (Norvège) 🇳🇴', 'Des paysages côtiers escarpés plongeant directement dans des eaux cristallines.'],
        ],
        'pianaInfo': {
          'titre': 'Calanques de Piana',
          'titreAffichage': 'Le sanctuaire de granit rouge de Piana',
          'image': 'assets/image/42.jpg',
          'typeAcces': 'Site classé UNESCO / Route touristique ouverte avec prudence',
          'histoire': "Joyau géologique de la Corse, les calanques de Piana se dressent comme des sculptures de granit rouge façonnées par le temps. Dominant les eaux turquoise du Golfe de Porto, elles inspirent les voyageurs depuis des siècles par leurs formes fantastiques.",
          'saviezVous': "Saviez-vous que de nombreux rochers de Piana portent des noms évocateurs inspirés de leur forme unique, comme la tête de chien ou l'évêque.",
          'photoAstuce': "Privilégiez la fin d'après-midi et le coucher du soleil pour capturer l'embrasement spectaculaire des roches roses.",
          'photosVerticales': [
            'assets/image/43.webp',
            'assets/image/45.jpg',
            'assets/image/48.jpg',
            'assets/image/49.jpg',
          ]
        }
      };
    }
  }

  Future<void> _openMap(String query) async {
    final encodedQuery = Uri.encodeComponent(query);
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedQuery');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  Widget _buildGalleryImage(String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 380,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: const Color(0xFF1E2029),
            child: const Center(
              child: Icon(Icons.image_not_supported, color: Colors.white54, size: 40),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isRtl = _currentLanguageCode == 'ar';
    final data = _getLocalizedData();
    final months = data['months'] as List;
    final pianaInfo = data['pianaInfo'] as Map<String, dynamic>;
    final verticalPhotos = pianaInfo['photosVerticales'] as List<String>;
    final translationsList = data['translations'] as List;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0C10),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL (AVEC DRAPEAUX)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                data['pageTitle'],
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: _toggleLanguage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: _currentColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: _currentColor.withOpacity(0.4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _getFlag(_currentLanguageCode),
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 6),
                              Icon(Icons.language, color: _currentColor, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                _currentLanguageCode.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // IMAGE PRINCIPALE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      pianaInfo['image'],
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 220,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E2029),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: const Center(
                          child: Icon(Icons.image_not_supported, color: Colors.white54, size: 40),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // AVERTISSEMENT MÉTÉO / CIRCULATION
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.orangeAccent.withOpacity(0.3)),
                    ),
                    child: Text(
                      data['avertissementMeteo'],
                      style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 1. TITRE & ACCÈS
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _currentColor.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pianaInfo['titreAffichage'],
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _currentColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            pianaInfo['typeAcces'],
                            style: TextStyle(
                              color: _currentColor,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 1. BIS - TRADUCTIONS PROVENÇALES
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['translationsTitle'],
                          style: TextStyle(
                            color: _currentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...translationsList.map((tr) => _buildTranslationLine(tr[0], tr[1], _currentColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2. INTRODUCTION & RÉALITÉ DU SITE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['introTitle'],
                          style: GoogleFonts.montserrat(
                            color: _currentColor.withOpacity(0.9),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['introText'],
                          style: GoogleFonts.montserrat(
                            color: const Color(0xFFB0B4C3),
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. HISTOIRE DÉTAILLÉE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['histoireLabel'],
                          style: TextStyle(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          pianaInfo['histoire'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // BOUTON MAPS
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => _openMap(pianaInfo['titre']),
                      icon: const Icon(Icons.map, size: 18),
                      label: Text(
                        data['mapsLabel'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. SAVIEZ-VOUS ?
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.amber.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.lightbulb, color: Colors.amber, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                data['saviezVousLabel'],
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          pianaInfo['saviezVous'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 5. ASTUCE PHOTO
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.camera_alt, color: Colors.blueAccent, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                data['photoAstuceLabel'],
                                style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          pianaInfo['photoAstuce'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 5. BIS - ENDROITS SIMILAIRES
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.tealAccent.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.place, color: Colors.tealAccent, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                data['similarPlacesTitle'],
                                style: const TextStyle(
                                  color: Colors.tealAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...((data['similarPlaces'] as List).map((place) => Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                place[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                place[1],
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 6. SAISONS RECOMMANDÉES (TABLEAU)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['saisonsTitle'],
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['saisonHeader'], data['conseilsHeader']], isHeader: true, hColor: _currentColor),
                            ...((data['saisons'] as List).map((s) => _buildTableRow([s[0], s[1]]))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 7. HORAIRES CONSEILLÉS (TABLEAU)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['horairesTitle'],
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['momentHeader'], data['conseilsHeader']], isHeader: true, hColor: _currentColor),
                            ...((data['horaires'] as List).map((h) => _buildTableRow([h[0], h[1]]))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 8. CALENDRIER D'AFFLUENCE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['bestMonthsTitle'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...months.map((m) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0B0C10),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    m['nom'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              data['periodStart'],
                                              style: const TextStyle(color: Colors.white54, fontSize: 9.5, height: 1.2),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.visible,
                                            ),
                                            const SizedBox(height: 4),
                                            Container(width: 16, height: 16, decoration: BoxDecoration(color: m['top'], shape: BoxShape.circle)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              data['periodMid'],
                                              style: const TextStyle(color: Colors.white54, fontSize: 9.5, height: 1.2),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.visible,
                                            ),
                                            const SizedBox(height: 4),
                                            Container(width: 16, height: 16, decoration: BoxDecoration(color: m['mid'], shape: BoxShape.circle)),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              data['periodEnd'],
                                              style: const TextStyle(color: Colors.white54, fontSize: 9.5, height: 1.2),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.visible,
                                            ),
                                            const SizedBox(height: 4),
                                            Container(width: 16, height: 16, decoration: BoxDecoration(color: m['bot'], shape: BoxShape.circle)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        const SizedBox(height: 10),
                        Text(data['legendeNote'], style: const TextStyle(color: Colors.amberAccent, fontSize: 11, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(data['legendeVert'], style: const TextStyle(color: Colors.white70, fontSize: 11)),
                        const SizedBox(height: 4),
                        Text(data['legendeOrange'], style: const TextStyle(color: Colors.white70, fontSize: 11)),
                        const SizedBox(height: 4),
                        Text(data['legendeRouge'], style: const TextStyle(color: Colors.white70, fontSize: 11)),
                        const SizedBox(height: 4),
                        Text(data['legendeGris'], style: const TextStyle(color: Colors.white70, fontSize: 11)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 9. PARCOURS ÉTAPE PAR ÉTAPE
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['parcoursTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...((data['etapes'] as List).map((stepText) => _buildStep(stepText, _currentColor))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 10. INFOS PRATIQUES
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['infosTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...((data['infos'] as List).map((info) => _buildTechRow(info[0], info[1], _currentColor))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 11. GALERIE PHOTOS VERTICALES
                  Column(
                    children: verticalPhotos.map((path) => _buildGalleryImage(path)).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- MÉTHODES D'AIDE ---

  Widget _buildTranslationLine(String ger, String fr, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(ger, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15))),
        ],
      ),
    );
  }

  Widget _buildStep(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right, color: color, size: 20),
          const SizedBox(width: 5),
          Expanded(child: Text(text, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5))),
        ],
      ),
    );
  }

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false, Color? hColor}) {
    return TableRow(
      children: cells.map((cell) => Padding(
        padding: const EdgeInsets.all(12),
        child: Text(cell, style: GoogleFonts.montserrat(
          color: isHeader ? hColor : Colors.white70,
          fontSize: 12,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        )),
      )).toList(),
    );
  }

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color.withOpacity(0.7), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}