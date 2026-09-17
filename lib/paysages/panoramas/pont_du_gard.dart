import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PontDuGardPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const PontDuGardPage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFFD4A373),
  });

  @override
  State<PontDuGardPage> createState() => _PontDuGardPageState();
}

class _PontDuGardPageState extends State<PontDuGardPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant PontDuGardPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.themeColor != widget.themeColor) {
      setState(() {
        _currentColor = widget.themeColor;
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

  List<Map<String, dynamic>> _generateDynamicMonths(String lang) {
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Février
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.orange},       // Août
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.green},  // Octobre
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Décembre
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
        'title': 'بونت دو جارد 🏛️',
        'pageTitle': 'بونت دو جارد : التحفة الرومانية',
        'introTitle': '🇫🇷 تحفة العصر الروماني',
        'introText': 'قناة مائية رومانية استثنائية من ثلاثة مستويات، تَعبر نهر جاردون. شاهد عظيم على عبقرية العمارة القديمة.',
        'translationsTitle': 'التناظر والمنطقة',
        'translations': [
          ['أوكسيتاني', 'أجواء تشبه الكولوسيوم (إيطاليا)'],
          ['تراث روماني', 'كنز معماري روماني عالمي'],
        ],
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'الأجواء والنصائح',
        'saisons': [
          ['🍂 الخريف', 'ألوان دافئة وإضاءة منخفضة ساحرة'],
          ['☀️ الصيف', 'السباحة والنزهات على ضفاف النهر'],
          ['🌱 الربيع', 'مثالي للهدوء والطبيعة الخلابة'],
          ['❄️ الشتاء', 'يُفضل تجنبه بسبب الرياح والبرد'],
        ],
        'horairesTitle': '⏰ التصوير والأوقات',
        'momentHeader': 'الوقت',
        'horaires': [
          ['🌅 شروق الشمس', 'إضاءة ذهبية استثنائية'],
          ['🌇 غروب الشمس', 'انعكاسات مذهلة على نهر جاردون'],
          ['📸 الكاميرا', 'يُوصى بحامل ثلاثي القوائم للتعرض الطويل'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.camera_enhance_outlined, "الكاميرا ضرورية للغاية"],
          [Icons.map_outlined, "يقع بالقرب من فيرس بونت دو جارد"],
          [Icons.directions_car, "مواقف سيارات مدفوعة لكل مركبة (يُرجى التحقق)"],
          [Icons.euro_symbol, "أسعار الدخول: تختلف حسب الموسم"],
          [Icons.auto_awesome, "مدرج في قائمة التراث العالمي للونسكو"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الزوار والازدحام (خاصة الصيف)',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم (خارج فرنسا)',
        'similarPlaces': [
          ['قناة سِغوبيا (إسبانيا) 🇪🇸', 'قناة مائية رومانية مهيبة ومتكاملة تماماً مع المدينة القديمة.'],
          ['قناة طرطونة / ليس فيريريس (إسبانيا) 🇪🇸', 'جسر مائي روماني مذهل يعبر الوديان بدقة هندسية عالية.'],
          ['الكولوسيوم في روما (إيطاليا) 🇮🇹', 'الرمز الأيقوني الأبرز للهندسة المعمارية الرومانية الضخمة.']
        ],
        'altInfo': {
          'titre': 'Pont du Gard',
          'titreAffichage': 'بونت دو جارد - التحفة الرومانية',
          'image': 'assets/images/6.jpg',
          'typeAcces': 'معلم تاريخي / موقع روماني مسجل في اليونسكو',
          'histoire': 'تم بناء بونت دو جارد في القرن الأول الميلادي لنقل المياه إلى مدينة نيم. يبلغ ارتفاعه 48 متراً مما يجعله أعلى جسر-قناة روماني في العالم، مع أدلة بصرية على الهندسة الفذة.',
          'saviezVous': 'هل تعلم أن هيكل الجسر الهائل تم بناؤه بدون استخدام أي مونة (أسمنت)، حيث ثُبّتت الحجار بدقة هندسية مذهلة.',
          'photoAstuce': 'قم بالتصوير من الضفة الأخرى عند غروب الشمس لالتقاط انعكاس الأقواس الرومانية الذهبية على مياه نهر جاردون.',
          'photosVerticales': [
            'assets/images/4.jpg',
            'assets/images/30.jpg',
            'assets/images/35.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Pont du Gard 🏛️',
        'pageTitle': 'Pont du Gard : The Roman Masterpiece',
        'introTitle': '🇫🇷 The masterpiece of the Roman era',
        'introText': 'An exceptional three-level Roman aqueduct crossing the Gardon river. A grand testimony to ancient architectural genius.',
        'translationsTitle': 'Analogy & Region',
        'translations': [
          ['Occitanie', 'An air of Colosseum (Italy)'],
          ['Roman Heritage', 'Global architectural treasure'],
        ],
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Ambience & Advice',
        'saisons': [
          ['🍂 Autumn', 'Warm colors and low grazing light'],
          ['☀️ Summer', 'Swimming and waterside walks'],
          ['🌱 Spring', 'Ideal for calm and nature'],
          ['❄️ Winter', 'To avoid (wind and cold)'],
        ],
        'horairesTitle': '⏰ Photography & Hours',
        'momentHeader': 'Time',
        'horaires': [
          ['🌅 Sunrise', 'Exceptional golden light'],
          ['🌇 Sunset', 'Magnificent reflections on the Gardon'],
          ['📸 Camera', 'Tripod recommended for long exposures'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.camera_enhance_outlined, "Essential camera"],
          [Icons.map_outlined, "Located near Vers-Pont-du-Gard"],
          [Icons.directions_car, "Paid parking per vehicle (check on site)"],
          [Icons.euro_symbol, "Access fee: varies by season"],
          [Icons.auto_awesome, "UNESCO World Heritage Site"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution or early arrival advised',
        'legendeRouge': '🔴 Red: Peak visitors and crowds (especially Summer)',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World (Outside France)',
        'similarPlaces': [
          ['Aqueduct of Segovia (Spain) 🇪🇸', 'A majestic and fully preserved Roman aqueduct integrated into the old town.'],
          ['Les Ferreres Aqueduct / Tarragona (Spain) 🇪🇸', 'A stunning Roman water bridge crossing valleys with high engineering precision.'],
          ['The Colosseum in Rome (Italy) 🇮🇹', 'The ultimate iconic symbol of monumental Roman architecture.']
        ],
        'altInfo': {
          'titre': 'Pont du Gard',
          'titreAffichage': 'Pont du Gard - Roman Masterpiece',
          'image': 'assets/images/6.jpg',
          'typeAcces': 'Historical Monument / UNESCO World Heritage',
          'histoire': 'Built in the 1st century AD to supply Nîmes with water, the Pont du Gard stands 48 meters high, making it the highest Roman aqueduct bridge in the world.',
          'saviezVous': 'Did you know that the massive structure was built without any mortar, with blocks held together by incredible precision and iron clamps.',
          'photoAstuce': 'Shoot from the opposite bank at sunset to capture the golden reflections of the Roman arches on the Gardon river.',
          'photosVerticales': [
            'assets/images/4.jpg',
            'assets/images/30.jpg',
            'assets/images/35.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Pont du Gard 🏛️',
        'pageTitle': 'Pont du Gard : Le chef-d\'œuvre romain',
        'introTitle': '🇫🇷 Le chef-d\'œuvre de l\'époque romaine',
        'introText': 'Aqueduc romain exceptionnel à trois niveaux, traversant la rivière Gardon. Témoignage grandiose du génie architectural antique.',
        'translationsTitle': 'Analogie & Région',
        'translations': [
          ['Occitanie', 'Un air de Colisée (Italie)'],
          ['Génie antique', 'Trésor architectural mondial'],
        ],
        'saisonsTitle': '📅 Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Ambiance & Conseils',
        'saisons': [
          ['🍂 Automne', 'Couleurs chaudes et lumière rasante'],
          ['☀️ Été', 'Baignade et balades au bord de l\'eau'],
          ['🌱 Printemps', 'Idéal pour le calme et la nature'],
          ['❄️ Hiver', 'À éviter (vent et froid)'],
        ],
        'horairesTitle': '⏰ Photographie & horaires',
        'momentHeader': 'Moment',
        'horaires': [
          ['🌅 Lever du soleil', 'Lumière dorée exceptionnelle'],
          ['🌇 Coucher du soleil', 'Reflets magnifiques sur le Gardon'],
          ['📸 Appareil photo', 'Trépied recommandé pour les poses longues'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & infos',
        'infos': [
          [Icons.camera_enhance_outlined, "Appareil photo indispensable"],
          [Icons.map_outlined, "Situé près de Vers-Pont-du-Gard"],
          [Icons.directions_car, "Stationnement payant par véhicule (à vérifier sur place)"],
          [Icons.euro_symbol, "Tarif d'accès au site : variable selon la saison"],
          [Icons.auto_awesome, "Classé au patrimoine mondial de l'UNESCO"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Pic de visiteurs (notamment l\'été)',
        'legendeGris': '⚪ Basse saison / Météo fraîche / Hiver',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez la météo ainsi que les conditions d\'accès avant de visiter le site.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires à l\'étranger (Hors de France)',
        'similarPlaces': [
          ['Aqueduc de Ségovie (Espagne) 🇪🇸', 'Un aqueduc romain majestueux et parfaitement conservé traversant la vieille ville.'],
          ['Aqueduc de Tarragone / Les Ferreres (Espagne) 🇪🇸', 'Un pont-aqueduc romain spectaculaire enjambant les vallées avec une précision remarquable.'],
          ['Le Colisée de Rome (Italie) 🇮🇹', 'Le symbole iconique absolu de l\'architecture monumentale romaine.']
        ],
        'altInfo': {
          'titre': 'Pont du Gard',
          'titreAffichage': 'Pont du Gard - Chef-d\'œuvre romain',
          'image': 'assets/images/6.jpg',
          'typeAcces': 'Monument historique / Patrimoine mondial de l\'UNESCO',
          'histoire': 'Construit au Ier siècle après J.-C. pour alimenter Nîmes en eau, le Pont du Gard mesure 48 mètres de haut, ce qui en fait le pont-aqueduc romain le plus haut du monde. Entouré d\'espaces naturels protégés propices à la détente.',
          'saviezVous': 'Saviez-vous que la structure monumentale a été construite sans aucun mortier, les blocs de pierre étant assemblés avec une précision géométrique.',
          'photoAstuce': 'Privilégiez la rive opposée au coucher du soleil pour capturer les reflets dorés des arches romaines sur le Gardon.',
          'photosVerticales': [
            'assets/images/4.jpg',
            'assets/images/30.jpg',
            'assets/images/35.jpg',
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
    final altInfo = data['altInfo'] as Map<String, dynamic>;
    final translationsList = data['translations'] as List;
    final photosVerticales = altInfo['photosVerticales'] as List;

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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL (SANS FAVORIS)[cite: 12]
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
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
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
                      altInfo['image'],
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

                  // AVERTISSEMENT MÉTÉO / INFO
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
                          altInfo['titreAffichage'],
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
                            altInfo['typeAcces'],
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

                  // 1. BIS - TRADUCTIONS / ANALOGIES
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
                          altInfo['histoire'],
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
                      onPressed: () => _openMap(altInfo['titre']),
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
                          altInfo['saviezVous'],
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
                          altInfo['photoAstuce'],
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

                  // 5. BIS - ENDROITS SIMILAIRES (HORS DE FRANCE)
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

                  // 8. CALENDRIER D'AFFLUENCE ET DE SAISONNALITÉ
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

                  // 9. INFOS PRATIQUES
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

                  // 10. GALERIE PHOTOS VERTICALES
                  Column(
                    children: photosVerticales.map((p) => _buildGalleryImage(p)).toList(),
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

  Widget _buildTranslationLine(String leftVal, String rightVal, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(leftVal, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(rightVal, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15))),
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