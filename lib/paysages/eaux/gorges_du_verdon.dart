import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class GorgesDuVerdonPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const GorgesDuVerdonPage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFF40E0D0),
  });

  @override
  State<GorgesDuVerdonPage> createState() => _GorgesDuVerdonPageState();
}

class _GorgesDuVerdonPageState extends State<GorgesDuVerdonPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant GorgesDuVerdonPage oldWidget) {
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

  List<Map<String, dynamic>> _generateDynamicMonths(String lang) {
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Janvier
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Février
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Mars
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Avril
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Mai
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.green},  // Septembre
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Octobre
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Novembre
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Décembre
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
        'title': 'Gorges du Verdon 🛶',
        'pageTitle': 'خوردون : أكبر أخدود في أوروبا',
        'introTitle': '🇺🇸 أكبر أخدود في أوروبا',
        'introText': 'صدع عملاق نحره نهر فوردون، توفر هذه الخوردون منحدرات شاهقة ومياهاً تركوازية خيالية. إنها منطقة طبيعية محمية ذات جمال بري استثنائي.',
        'factsTitle': '📋 الحقائق الأساسية',
        'facts': [
          ['بروفانس', 'نفحة من غراند كانيون (الولايات المتحدة الأمريكية)'],
        ],
        'seasonsTitle': '📅 أفضل المواسم',
        'seasonsHeader1': 'الموسم',
        'seasonsHeader2': 'الأجواء',
        'seasonsHeader3': 'النصيحة',
        'seasons': [
          ['🌸 الربيع', 'مياه متدفقة', 'مثالي للتجديف والزهور'],
          ['☀️ الصيف', 'تركوازي', 'مثالي للقوارب (مزدحم جداً)'],
          ['🍂 الخريف', 'هادئ', 'إضاءة رائعة على المنحدرات'],
          ['❄️ الشتاء', 'ساحر', 'طريق القمم مغطى بالثلوج أحياناً'],
        ],
        'activitiesTitle': '🚣 الأنشطة المقترحة',
        'activitiesHeader1': 'النوع',
        'activitiesHeader2': 'التوصية',
        'activities': [
          ['🛶 ماء', 'تأجير قوارب الكانو في جسر غاليتا'],
          ['🥾 مشي', 'مسار بلان مارتيل (رياضي وأسطوري)'],
          ['🚗 إطلالة', 'طريق القمم للمطال والمناظر الطبيعية'],
        ],
        'bestMonthsTitle': 'مستويات الازدحام وفترات الزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يوصى بالحجز المسبق للأنشطة المائية في الصيف.',
        'legendeVert': '🟢 أخضر: فترة هادئة (الشتاء / الربيع / الخريف)',
        'legendeOrange': '🟠 برتقالي: ازدحام معتدل (مايو / سبتمبر)',
        'legendeRouge': '🔴 أحمر: ازدحام شديد / موسم الذروة (يوليو - أغسطس)',
        'legendeGris': '⚪ رمادي: فترة عادية / متغيرة',
        'conseilsTitle': '📋 معلومات عملية',
        'conseils': [
          [Icons.directions_car, "طرق متعرجة وضيقة للغاية"],
          [Icons.location_on, "مكان لا يُفوّت: موستيي سانت ماري"],
          [Icons.water_drop, "درجة حرارة الماء باردة نسبياً"],
          [Icons.camera_alt, "النسور الرمادية مرئية من القمم"],
        ],
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['جراند كانيون (الولايات المتحدة الأمريكية) 🇺🇸', 'الأخدود الأكثر شهرة واتساعاً والذي نحته نهر كولورادو.'],
          ['أخدود تارا (الجبل الأسود) 🇲🇪', 'أعمق أخدود في أوروبا يتميز بمياهه الزمردية الخلابة.'],
          ['أخدود بليد ريفر (جنوب أفريقيا) 🇿🇦', 'أخدود خضري شاهق يوفر إطلالات طبيعية استثنائية.']
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: توخى الحذر أثناء الأنشطة المائية والمشي لمسافات طويلة في الخوردون.',
        'verdonInfo': {
          'titre': 'Gorges du Verdon',
          'titreAffichage': 'Gorges du Verdon 🛶',
          'image': 'assets/images/VERDON.jpg',
          'typeAcces': 'Provence / Grand Canyon d\'Europe',
          'photos': [
            'assets/images/Visiter-les-Gorges-du-Verdon.jpg',
            'assets/images/Gorges-du-VerdonProvence-in-France-Europe.-755x504.jpg',
            'assets/images/randonnee_basses_gorges_verdon_2_2a20e72145.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Gorges du Verdon 🛶',
        'pageTitle': 'Gorges du Verdon: The largest canyon in Europe',
        'introTitle': '🇺🇸 The largest canyon in Europe',
        'introText': 'A gigantic fault carved by the Verdon River, these gorges offer vertiginous cliffs and unreal turquoise water. It is a protected natural area of exceptional wild beauty.',
        'factsTitle': '📋 Key Facts',
        'facts': [
          ['Provence', 'A touch of Grand Canyon (USA)'],
        ],
        'seasonsTitle': '📅 Best Seasons',
        'seasonsHeader1': 'Season',
        'seasonsHeader2': 'Vibe',
        'seasonsHeader3': 'Tip',
        'seasons': [
          ['🌸 Spring', 'Whitewater', 'Ideal for rafting and flowers'],
          ['☀️ Summer', 'Turquoise', 'Perfect for pedal boats (very busy)'],
          ['🍂 Autumn', 'Calm', 'Magnificent light on the cliffs'],
          ['❄️ Winter', 'Mystical', 'Route des Crêtes sometimes snowy'],
        ],
        'activitiesTitle': '🚣 Suggested Activities',
        'activitiesHeader1': 'Type',
        'activitiesHeader2': 'Recommendation',
        'activities': [
          ['🛶 Water', 'Canoe rental at Pont du Galetas'],
          ['🥾 Hiking', 'Blanc-Martel trail (sporty and legendary)'],
          ['🚗 View', 'Route des Crêtes for viewpoints'],
        ],
        'bestMonthsTitle': 'Crowd Levels & Seasonality Calendar',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Online booking recommended for water activities in summer.',
        'legendeVert': '🟢 Green: Calm period (Winter / Spring / Autumn)',
        'legendeOrange': '🟠 Orange: Moderate crowds (May / September)',
        'legendeRouge': '🔴 Red: Heavy crowds / Peak season (July - August)',
        'legendeGris': '⚪ Grey: Normal / variable period',
        'conseilsTitle': '📋 Practical Info',
        'conseils': [
          [Icons.directions_car, "Very winding and narrow roads"],
          [Icons.location_on, "Must-see: Moustiers-Sainte-Marie"],
          [Icons.water_drop, "Water temperature is quite fresh"],
          [Icons.camera_alt, "Griffon vultures visible from the summits"],
        ],
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Grand Canyon (USA) 🇺🇸', 'The most famous and immensely vast canyon carved by the Colorado River.'],
          ['Tara River Canyon (Montenegro) 🇲🇪', 'The deepest canyon in Europe featuring spectacular emerald waters.'],
          ['Blyde River Canyon (South Africa) 🇿🇦', 'A lush and dizzying canyon offering exceptional natural panoramas.']
        ],
        'galerieTitle': '📸 Place Overview',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Exercise caution during water activities and hiking in the gorges.',
        'verdonInfo': {
          'titre': 'Gorges du Verdon',
          'titreAffichage': 'Gorges du Verdon 🛶',
          'image': 'assets/images/VERDON.jpg',
          'typeAcces': 'Provence / Grand Canyon d\'Europe',
          'photos': [
            'assets/images/Visiter-les-Gorges-du-Verdon.jpg',
            'assets/images/Gorges-du-VerdonProvence-in-France-Europe.-755x504.jpg',
            'assets/images/randonnee_basses_gorges_verdon_2_2a20e72145.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Gorges du Verdon 🛶',
        'pageTitle': 'Gorges du Verdon : Le plus grand canyon d’Europe',
        'introTitle': '🇺🇸 Le plus grand canyon d\'Europe',
        'introText': 'Gigantesque faille creusée par la rivière Verdon, ces gorges offrent des falaises vertigineuses et une eau d\'un turquoise irréel. C\'est un espace naturel protégé d\'une beauté sauvage exceptionnelle.',
        'factsTitle': '📋 Faits clés',
        'facts': [
          ['Provence', 'Un air de Grand Canyon (USA)'],
        ],
        'seasonsTitle': '📅 Meilleures saisons',
        'seasonsHeader1': 'Saison',
        'seasonsHeader2': 'Ambiance',
        'seasonsHeader3': 'Conseil',
        'seasons': [
          ['🌸 Printemps', 'Eau vive', 'Idéal pour le rafting et les fleurs'],
          ['☀️ Été', 'Turquoise', 'Parfait pour le pédalo (très fréquenté)'],
          ['🍂 Automne', 'Calme', 'Lumière magnifique sur les falaises'],
          ['❄️ Hiver', 'Mystique', 'Route des Crêtes parfois enneigée'],
        ],
        'activitiesTitle': '🚣 Activités suggérées',
        'activitiesHeader1': 'Type',
        'activitiesHeader2': 'Recommandation',
        'activities': [
          ['🛶 Eau', 'Location de canoë au Pont du Galetas'],
          ['🥾 Rando', 'Sentier Blanc-Martel (sportif et mythique)'],
          ['🚗 Vue', 'La Route des Crêtes pour les belvédères'],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Réservation en ligne conseillée pour les activités nautiques en été.',
        'legendeVert': '🟢 Vert : Période calme (Hiver / Printemps / Automne)',
        'legendeOrange': '🟠 Orange : Affluence modérée (Mai / Septembre)',
        'legendeRouge': '🔴 Rouge : Forte affluence / Haute saison (Juillet - Août)',
        'legendeGris': '⚪ Gris : Période normale / variable',
        'conseilsTitle': '📋 Infos pratiques',
        'conseils': [
          [Icons.directions_car, "Routes très sinueuses et étroites"],
          [Icons.location_on, "Incontournable : Moustiers-Sainte-Marie"],
          [Icons.water_drop, "Température de l'eau assez fraîche"],
          [Icons.camera_alt, "Vautours fauves visibles depuis les sommets"],
        ],
        'similarPlacesTitle': '🌍 Endroits similaires dans le monde',
        'similarPlaces': [
          ['Grand Canyon (États-Unis) 🇺🇸', 'Le plus célèbre et immensément vaste canyon sculpté par le fleuve Colorado.'],
          ['Canyon de la rivière Tara (Monténégro) 🇲🇪', 'Le plus profond canyon d’Europe avec des eaux émeraude spectaculaires.'],
          ['Blyde River Canyon (Afrique du Sud) 🇿🇦', 'Un canyon luxuriant et vertigineux offrant des panoramas exceptionnels.']
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Soyez prudents lors des activités nautiques et de randonnée dans les gorges.',
        'verdonInfo': {
          'titre': 'Gorges du Verdon',
          'titreAffichage': 'Gorges du Verdon 🛶',
          'image': 'assets/images/VERDON.jpg',
          'typeAcces': 'Provence / Grand Canyon d\'Europe',
          'photos': [
            'assets/images/Visiter-les-Gorges-du-Verdon.jpg',
            'assets/images/Gorges-du-VerdonProvence-in-France-Europe.-755x504.jpg',
            'assets/images/randonnee_basses_gorges_verdon_2_2a20e72145.jpg',
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
    final Color bleuVerdon = _currentColor;
    final bool isRtl = _currentLanguageCode == 'ar';
    final data = _getLocalizedData();
    final verdonInfo = data['verdonInfo'] as Map<String, dynamic>;
    final factsList = data['facts'] as List;
    final seasonsList = data['seasons'] as List;
    final activitiesList = data['activities'] as List;
    final months = data['months'] as List;
    final conseilsList = data['conseils'] as List;
    final photos = verdonInfo['photos'] as List;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: const Color(0xFF0B0C0E),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL (SANS FAVORIS)
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
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _toggleLanguage,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: bleuVerdon.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: bleuVerdon.withOpacity(0.4)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.language, color: bleuVerdon, size: 16),
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
                    ],
                  ),
                  const SizedBox(height: 16),

                  // IMAGE PRINCIPALE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      verdonInfo['image'],
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
                      border: Border.all(color: bleuVerdon.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          verdonInfo['titreAffichage'],
                          style: GoogleFonts.cinzel(
                            color: bleuVerdon,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: bleuVerdon.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            verdonInfo['typeAcces'],
                            style: TextStyle(
                              color: bleuVerdon,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 1. BIS - FAITS CLÉS
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
                          data['factsTitle'],
                          style: TextStyle(
                            color: bleuVerdon,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...factsList.map((fact) => _buildTranslationLine(fact[0], fact[1], bleuVerdon)),
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
                            color: bleuVerdon.withOpacity(0.9),
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

                  // BOUTON MAPS
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: bleuVerdon,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => _openMap(verdonInfo['titre']),
                      icon: const Icon(Icons.map, size: 18),
                      label: Text(
                        data['mapsLabel'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. TABLEAU PÉRIODES (MEILLEURES SAISONS)
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
                        _buildSectionTitle(data['seasonsTitle'], bleuVerdon),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1.5)},
                          children: [
                            _buildTableRow([data['seasonsHeader1'], data['seasonsHeader2'], data['seasonsHeader3']], isHeader: true, hColor: bleuVerdon),
                            ...seasonsList.map((s) => _buildTableRow([s[0], s[1], s[2]])),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. TABLEAU ACTIVITÉS SUGGÉRÉES
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
                        _buildSectionTitle(data['activitiesTitle'], bleuVerdon),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['activitiesHeader1'], data['activitiesHeader2']], isHeader: true, hColor: bleuVerdon),
                            ...activitiesList.map((a) => _buildTableRow([a[0], a[1]])),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 5. CALENDRIER D'AFFLUENCE ET DE SAISONNALITÉ
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
                              color: const Color(0xFF0B0C0E),
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

                  // 6. INFOS PRATIQUES
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
                        _buildSectionTitle(data['conseilsTitle'], bleuVerdon),
                        const SizedBox(height: 12),
                        ...conseilsList.map((info) => _buildTechRow(info[0], info[1], bleuVerdon)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 6. BIS - ENDROITS SIMILAIRES A L'ÉTRANGER
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

                  // 7. GALERIE PHOTOS
                  _buildSectionTitle(data['galerieTitle'], bleuVerdon),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      ...photos.map((path) => _buildGalleryImage(path)),
                    ],
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

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(ville, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15), softWrap: true)),
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
        ), softWrap: true),
      )).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(), style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color.withOpacity(0.7), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13), softWrap: true)),
        ],
      ),
    );
  }
}