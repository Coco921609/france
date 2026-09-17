import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class CascadesDesTufsPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const CascadesDesTufsPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<CascadesDesTufsPage> createState() => _CascadesDesTufsPageState();
}

class _CascadesDesTufsPageState extends State<CascadesDesTufsPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant CascadesDesTufsPage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril (Printemps / Débit max)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juillet
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Août
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Octobre (Automne / Couleurs max)
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
        'title': 'شلالات التوف 🌿',
        'pageTitle': 'شلالات التوف: بالي الصغرى في جورا',
        'introTitle': '🇮🇩 لمحة من بالي في قلب جورا',
        'introText': 'تعد شلالات التوف الواقعة في بلانش-بريه-أربوا موقعًا طبيعيًا مذهلاً حيث تتدفق المياه عبر جدران من التوف المغطاة بالطحالب، مما يوفر مشهدًا يشبه الغابات الاستوائية.',
        'translationsTitle': 'المصطلحات المحلية',
        'translations': [
          ['تف', 'صخر جيري مسامي'],
          ['مطبخ', 'النهر المحلي'],
          ['منعزلة', 'وادي جورا الضيق'],
        ],
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'الأجواء والألوان',
        'saisons': [
          ['🌱 الربيع', 'تدفق مياه قوي وذروة الجمال (مثالي)'],
          ['🍂 الخريف', 'ألوان الغابات الرائعة والمميزة'],
          ['☀️ الصيف', 'انتعاش وأجواء ظليلة منعشة'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ الصباح', 'هدوء تام وإضاءة ناعمة'],
          ['☀️ منتصف النهار', 'أشعة الشمس تتخلل الأشجار'],
          ['🌅 المساء', 'أجواء هادئة وساحرة'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.map_outlined, "يقع في بلانش-بريه-أربوا (جورا)"],
          [Icons.directions_walk, "سهل الوصول من القرية"],
          [Icons.photo_camera, "مكان فائق الجمال للتصوير"],
          [Icons.camera_alt, "رائع في الربيع والخريف"],
          [Icons.air, "طبيعة خلابة وهواء نقي"],
          [Icons.flag_outlined, "منطقة جورا السياحية"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر',
        'legendeRouge': '🔴 أحمر : ذروة الزوار والتدفق',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: احذر من الانزلاق على الصخور المبللة والمطحلبة.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['بحيرات بليتفيتش (كرواتيا) 🇭🇷', 'شلالات مدرجة ومياه تركوازية ساحرة تشبه تشكيلات التوف.'],
          ['شلالات كوانغ سي (لاوس) 🇱🇦', 'مياه زمردية ومدرجات جيرية خضراء خلابة.'],
          ['شلالات هافاسوباي (أريزونا، أمريكا) 🇺🇸', 'شلالات مائية مذهلة وسط مساحات خضراء وطحالب غنية.']
        ],
        'cascadeInfo': {
          'titre': 'Cascades des Tufs',
          'titreAffichage': 'شلالات التوف - جورا',
          'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
          'typeAcces': 'دخول حر / جورا الفرنسية',
          'histoire': 'تم تشكيل شلالات التوف بفضل مياه نهر الكويزانس التي تترسب محملة بالكربونات على الطحالب والنباتات، مما يمنحها هذا المظهر الاستوائي الفريد والمميز.',
          'saviezVous': 'هل تعلم أن التوف هو صخر خفيف للغاية يتكون نتيجة ترسب الكالسيوم حول الغطاء النباتي.',
          'photoAstuce': 'استخدم سرعة غالق بطيئة (تعريض طويل) لمنح المياه مظهرًا حريريًا ناعمًا.',
          'photosVerticales': [
            'assets/images/a4a00cbdb51fc9dce164469ace03ec7f-cascades-des-tufs-dans-le-jura-pres-darbois-890x0-f0fe8c58f7f431744cfb47fb412cf244.jpg',
            'assets/images/juratourisme-tufs.jpg',
            'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Cascades des Tufs 🌿',
        'pageTitle': 'Cascades des Tufs : The Jurassic Bali',
        'introTitle': '🇮🇩 A touch of Bali in the heart of Jura',
        'introText': 'Located in Les Planches-près-Arbois, the Cascades des Tufs offer a lush landscape where water flows through moss-covered limestone walls, evoking tropical forests.',
        'translationsTitle': 'Local Terms & Lexicon',
        'translations': [
          ['Tough', 'Porous limestone rock'],
          ['Cuisance', 'Local river'],
          ['Remote', 'Enclosed Jura valley'],
        ],
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Ambience & Colors',
        'saisons': [
          ['🌱 Spring', 'Maximum water flow (Ideal)'],
          ['🍂 Autumn', 'Magnificent forest colors'],
          ['☀️ Summer', 'Freshness under the shady canopy'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Morning', 'Soft light and peaceful atmosphere'],
          ['☀️ Noon', 'Filtered sunlight through trees'],
          ['🌅 Evening', 'Quiet and magical ambiance'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.map_outlined, "Located in Les Planches (Jura)"],
          [Icons.directions_walk, "Easy access from the village"],
          [Icons.photo_camera, "Ultra photogenic location"],
          [Icons.camera_alt, "Magnificent in spring and autumn"],
          [Icons.air, "Fresh and pure nature air"],
          [Icons.flag_outlined, "Jura Tourism Region"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution advised',
        'legendeRouge': '🔴 Red: Peak visitors and water flow',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Watch out for slippery rocks and moss.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Plitvice Lakes (Croatia) 🇭🇷', 'Stepped waterfalls and turquoise pools reminiscent of tufa formations.'],
          ['Kuang Si Falls (Laos) 🇱🇦', 'Emerald waters and lush limestone terraces.'],
          ['Havasupai Falls (Arizona, USA) 🇺🇸', 'Stunning turquoise waterfalls amidst lush walls and moss.']
        ],
        'cascadeInfo': {
          'titre': 'Cascades des Tufs',
          'titreAffichage': 'Cascades des Tufs - Jura',
          'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
          'typeAcces': 'Free access / Jura, France',
          'histoire': 'The Cascades des Tufs were sculpted by underground water resurgences rich in limestone, which precipitate on moss to form these remarkable terraced walls.',
          'saviezVous': 'Did you know that tufa is an extremely light rock formed by the precipitation of limestone around vegetation.',
          'photoAstuce': 'Use a tripod and a long exposure to give a silky look to the flowing waterfalls.',
          'photosVerticales': [
            'assets/images/a4a00cbdb51fc9dce164469ace03ec7f-cascades-des-tufs-dans-le-jura-pres-darbois-890x0-f0fe8c58f7f431744cfb47fb412cf244.jpg',
            'assets/images/juratourisme-tufs.jpg',
            'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Cascades des Tufs 🌿',
        'pageTitle': 'Cascades des Tufs : Le petit Bali jurassien',
        'introTitle': '🇮🇩 La pépite tropicale du Jura',
        'introText': "Une cascade spectaculaire où l'eau s'écoule à travers des parois de tuf recouvertes de mousse. Ce paysage luxuriant offre un spectacle digne des forêts tropicales d'Asie du Sud-Est.",
        'translationsTitle': 'Termes & Lexique local',
        'translations': [
          ['Tuf', 'Roche calcaire poreuse'],
          ['Cuisance', 'Rivière locale'],
          ['Reculée', 'Vallée encaissée du Jura'],
        ],
        'saisonsTitle': '📅 Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Ambiance & Couleurs',
        'saisons': [
          ['🌱 Printemps', 'Débit d\'eau maximum (Idéal)'],
          ['🍂 Automne', 'Couleurs magnifiques en forêt'],
          ['☀️ Été', 'Fraîcheur sous les ombrages'],
        ],
        'horairesTitle': '⏰ Horaires conseillés',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Matin', 'Lumière douce et calme absolu'],
          ['☀️ Midi', 'Rayons de soleil filtrés par les arbres'],
          ['🌅 Soir', 'Ambiance crépusculaire magique'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.map_outlined, "Situé aux Planches-près-Arbois"],
          [Icons.directions_walk, "Accès facile depuis le village"],
          [Icons.photo_camera, "Lieu ultra photogénique"],
          [Icons.camera_alt, "Magnifique au printemps"],
          [Icons.air, "Air pur et nature luxuriante"],
          [Icons.flag_outlined, "Jura Tourisme"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez la météo et l’état du sentier.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, beau débit)',
        'legendeOrange': '🟠 Affluence modérée (période estivale)',
        'legendeRouge': '🔴 Forte affluence / Débit maximal',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Roches glissantes, restez prudents au bord de l’eau.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires aux Cascades des Tufs dans le monde',
        'similarPlaces': [
          ['Lacs de Plitvice (Croatie) 🇭🇷', 'Cascades en gradins et vasques turquoise spectaculaires façonnées par le calcaire.'],
          ['Kuang Si Falls (Laos) 🇱🇦', 'Eaux émeraude et terrasses calcaires luxuriantes en pleine jungle.'],
          ['Havasupai Falls (Arizona, USA) 🇺🇸', 'Chutes d’eau turquoise au milieu de parois rocheuses moussues.']
        ],
        'cascadeInfo': {
          'titre': 'Cascades des Tufs',
          'titreAffichage': 'Cascades des Tufs - Jura',
          'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
          'typeAcces': 'Accès libre / Les Planches-près-Arbois',
          'histoire': "Formées par les résurgences de la Cuisance, les cascades des Tufs évoluent par la précipitation du carbonate de calcium sur la mousse, créant un paysage unique de travertin.",
          'saviezVous': "Saviez-vous que le tuf est une roche calcaire très légère formée par l'accumulation de calcaire sur la végétation environnante.",
          'photoAstuce': "Privilégiez une vitesse d'obturation lente (pose longue) pour capturer l'effet vaporeux et soyeux de l'eau.",
          'photosVerticales': [
            'assets/images/a4a00cbdb51fc9dce164469ace03ec7f-cascades-des-tufs-dans-le-jura-pres-darbois-890x0-f0fe8c58f7f431744cfb47fb412cf244.jpg',
            'assets/images/juratourisme-tufs.jpg',
            'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
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
    final cascadeInfo = data['cascadeInfo'] as Map<String, dynamic>;
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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL SANS FAVORIS
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
                    ],
                  ),
                  const SizedBox(height: 16),

                  // IMAGE PRINCIPALE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      cascadeInfo['image'],
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
                          cascadeInfo['titreAffichage'],
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
                            cascadeInfo['typeAcces'],
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

                  // 1. BIS - TRADUCTIONS EN FLÈCHE
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
                          cascadeInfo['histoire'],
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
                      onPressed: () => _openMap(cascadeInfo['titre']),
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
                          cascadeInfo['saviezVous'],
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
                          cascadeInfo['photoAstuce'],
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
                    children: [
                      for (var path in cascadeInfo['photosVerticales'] as List)
                        _buildGalleryImage(path),
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

  Widget _buildTranslationLine(String term, String definition, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(term, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(definition, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15))),
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