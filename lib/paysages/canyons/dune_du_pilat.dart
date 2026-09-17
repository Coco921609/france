import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class DuneDuPilatPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const DuneDuPilatPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<DuneDuPilatPage> createState() => _DuneDuPilatPageState();
}

class _DuneDuPilatPageState extends State<DuneDuPilatPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant DuneDuPilatPage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.green},     // Février
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},   // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},    // Avril (Printemps)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange},  // Mai
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red}, // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red}, // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.orange}, // Août
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Septembre
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.grey},    // Octobre
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
        'title': 'كثبان بيلا 🏜️',
        'pageTitle': 'كثبان بيلا : أجواء الصحراء',
        'introTitle': '🌍 لمحة من الصحراء (أفريقيا) في حوض آرساشون',
        'introText': "ظاهرة طبيعية هائلة محشورة بين المحيط الأطلسي وغابة لاند. يبلغ ارتفاعها 100 متر، وتوفر مشهدًا صحراويًا مذهلاً وإطلالة فريدة على ضفة آركوين.",
        'translationsTitle': 'الترجمات الجغرافية',
        'translations': [
          ['حوض آركاشون', 'جو يشبه الصحراء (أفريقيا)'],
        ],
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'الأجواء والنصيحة',
        'saisons': [
          ['🌸 الربيع', 'لطيف', 'مثالي لتجنب الازدحام'],
          ['☀️ الصيف', 'حار', 'يفضل شروق الشمس أو غروبها'],
          ['🍂 الخريف', 'ضوء ذهبي', 'الفترة الأكثر قابلية للتصوير'],
          ['❄️ الشتاء', 'بري', 'مثالي للعزلة التامة'],
        ],
        'horairesTitle': '⏰ نصائح الزيارة',
        'momentHeader': 'النوع',
        'horaires': [
          ['🌅 غروب الشمس', 'اللحظة الأكثر سحرًا في اليوم'],
          ['🏃 الصعود', 'الدرج متاح من أبريل إلى أكتوبر'],
          ['🌬️ الرياح', 'يمكن أن يكون الرمل مزعجًا في أيام الرياح القوية'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 معلومات عملية',
        'infos': [
          [Icons.hiking, "الوصول إلى الكثبان حر ومجاني"],
          [Icons.wb_sunny, "منطقة بلا ظل: احرص على جلب الماء"],
          [Icons.camera_alt, "إطلالة بانورامية 360 درجة: الغابة والمحيط"],
          [Icons.pets, "الكلاب مسموحة بشرط ربطها بقايض"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام وفترات الموسم',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الزوار والحرارة',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق من حالة الطقس الظروف قبل زيارة الموقع.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['صحراء ناميب (ناميبيا) 🇳🇦', 'كثبان رملية عملاقة تلامس المحيط في مشهد طبيعي فريد من نوعه.'],
          ['صحراء مرزوق (ليبيا) 🇱🇾', 'عرق صحراوي شاسع بكثبان ذهبية متعرجة وساحرة.'],
          ['الكثبان الساحلية (عالمي) 🌐', 'كتل رملية ساحلية تشكلت بفعل رياح المحيط القوية.']
        ],
        'altInfo': {
          'titre': 'Dune du Pilat',
          'titreAffichage': 'كثبان بيلا - أعلى كثبان في أوروبا',
          'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg',
          'typeAcces': 'دخول حر / حوض آرساشون',
          'histoire': "تُعد كثبان بيلا أعلى كثبان رملية في أوروبا. تشكلت عبر آلاف السنين بفعل حركة الرياح وتراكم الرمال، وتستمر في التحرك ببطء داخل غابة الصنوبر المحيطة بها.",
          'saviezVous': "هل تعلم أن الكثبان تتحرك سنويًا بمسافة تتراوح بين متر واحد إلى خمسة أمتار باتجاه الشرق، مغطية تدريجيًا الغابات والمنازل.",
          'photoAstuce': "احرص على الصعود حافي القدمين للشعور بنعومة الرمال والتقاط صور بانورامية مذهلة عند التقاء المحيط بالصحراء.",
          'photosVerticales': [
            'assets/images/photo-aerienne-dune-du-pilat-277.jpg',
            'assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg',
            'assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Dune du Pilat 🏖️',
        'pageTitle': 'Dune du Pilat : The Highest Dune',
        'introTitle': '🌍 A touch of Sahara (Africa) in Arcachon Bay',
        'introText': "A monumental natural phenomenon wedged between the Atlantic Ocean and the Landes forest. At 100 meters high, it offers a striking desert spectacle and a unique view of the Arguin sandbank.",
        'translationsTitle': 'Geographical Translations',
        'translations': [
          ['Arcachon Bay', 'A touch of Sahara (Africa)'],
        ],
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Ambience & Tip',
        'saisons': [
          ['🌸 Spring', 'Mild', 'Perfect to avoid the crowds'],
          ['☀️ Summer', 'Warm', 'Prefer sunrise or sunset'],
          ['🍂 Autumn', 'Golden light', 'The most photogenic period'],
          ['❄️ Winter', 'Wild', 'Ideal for total solitude'],
        ],
        'horairesTitle': '⏰ Visit Tips',
        'momentHeader': 'Type',
        'horaires': [
          ['🌅 Sunset', 'The most magical moment of the day'],
          ['🏃 Ascent', 'Stairs available from April to October'],
          ['🌬️ Wind', 'Sand can be irritating on windy days'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Practical Info',
        'infos': [
          [Icons.hiking, "Free access to the dune"],
          [Icons.wb_sunny, "Shade-free zone: bring water"],
          [Icons.camera_alt, "360° Panorama: Forest & Ocean"],
          [Icons.pets, "Dogs allowed on a leash"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Seasonality Calendar',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution advised',
        'legendeRouge': '🔴 Red: Peak visitors and warmth',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Please check weather conditions and access rules before visiting.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Namib Desert (Namibia) 🇳🇦', 'Giant sand dunes touching the ocean in a unique natural landscape.'],
          ['Marzuq Sand Sea (Libya) 🇱🇾', 'A vast desert erg with winding and enchanting golden dunes.'],
          ['Dune of Pilat Counterparts (Global) 🌐', 'Coastal sand masses shaped by strong oceanic winds.']
        ],
        'altInfo': {
          'titre': 'Dune du Pilat',
          'titreAffichage': 'Dune du Pilat - Highest Dune in Europe',
          'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg',
          'typeAcces': 'Free access / Arcachon Bay',
          'histoire': "The Dune du Pilat is the highest sand dune in Europe. Sculpted by wind and sand accumulation over millennia, it constantly moves eastward, slowly encroaching on the surrounding forest.",
          'saviezVous': "Did you know that the dune moves between 1 and 5 meters inland every year, gradually covering trees and structures in its path?",
          'photoAstuce': "Climb barefoot to feel the texture of the warm sand and capture stunning panoramic shots where the forest meets the ocean.",
          'photosVerticales': [
            'assets/images/photo-aerienne-dune-du-pilat-277.jpg',
            'assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg',
            'assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Dune du Pilat 🏖️',
        'pageTitle': 'Dune du Pilat : La plus haute dune',
        'introTitle': "🌍 Un air de Sahara (Afrique) dans le Bassin d'Arcachon",
        'introText': "Un phénomène naturel monumental coincé entre l'océan Atlantique et la forêt des Landes. Avec ses 100 mètres de haut, elle offre un spectacle désertique saisissant et une vue unique sur le banc d'Arguin.",
        'translationsTitle': 'Traductions géographiques',
        'translations': [
          ["Bassin d'Arcachon", "Un air de Sahara (Afrique)"],
        ],
        'saisonsTitle': '📅 Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Ambiance & Conseil',
        'saisons': [
          ['🌸 Printemps', 'Douceur', 'Parfait pour éviter la foule'],
          ['☀️ Été', 'Chaleur', 'Privilégier le lever ou coucher du soleil'],
          ['🍂 Automne', "Lumière d'or", 'La période la plus photogénique'],
          ['❄️ Hiver', 'Sauvage', 'Idéal pour une solitude totale'],
        ],
        'horairesTitle': '⏰ Conseils de visite',
        'momentHeader': 'Type',
        'horaires': [
          ['🌅 Coucher de soleil', 'Le moment le plus magique de la journée'],
          ['🏃 Ascension', "Escalier disponible d'avril à octobre"],
          ['🌬️ Vent', 'Le sable peut être irritant les jours de vent fort'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Infos pratiques',
        'infos': [
          [Icons.hiking, "Accès à la dune libre et gratuit"],
          [Icons.wb_sunny, "Zone sans ombre : prévoyez de l'eau"],
          [Icons.camera_alt, "Panorama 360° : Forêt & Océan"],
          [Icons.pets, "Chiens autorisés tenus en laisse"],
        ],
        'bestMonthsTitle': "Calendrier d’affluence et de saisonnalité",
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Chaleur estivale',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': "⚠️ Attention : Vérifiez la météo ainsi que les conditions d'accès avant de visiter le site.",
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': "🌍 Endroits similaires à la Dune du Pilat dans le monde",
        'similarPlaces': [
          ['Désert du Namib (Namibie) 🇳🇦', 'De gigantesques dunes de sable léchant l’océan dans un paysage irréel.'],
          ['Mer de sable de Marzuq (Libye) 🇱🇾', 'Un immense erg désertique aux vagues de sable doré fascinantes.'],
          ['Dunes côtières du littoral (Mondial) 🌐', 'Des massifs dunaires façonnés par les vents violents de l’océan.']
        ],
        'altInfo': {
          'titre': 'Dune du Pilat',
          'titreAffichage': 'Dune du Pilat - Plus haute dune d’Europe',
          'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg',
          'typeAcces': 'Accès libre / Bassin d’Arcachon',
          'histoire': "La Dune du Pilat est la plus haute dune de sable d'Europe. Sculptée par le vent et l'accumulation de sable au fil des millénaires, elle avance inlassablement vers l'est en recouvrant peu à peu la forêt.",
          'saviezVous': "Saviez-vous que la dune se déplace chaque année de 1 à 5 mètres vers l'intérieur des terres, ensevelissant lentement la pinède.",
          'photoAstuce': "Gravissez la pente pieds nus pour ressentir la texture du sable et immortalisez la jonction parfaite entre l'immensité bleue de l'océan et la forêt.",
          'photosVerticales': [
            'assets/images/photo-aerienne-dune-du-pilat-277.jpg',
            'assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg',
            'assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg',
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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL
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
                      _buildGalleryImage('assets/images/photo-aerienne-dune-du-pilat-277.jpg'),
                      _buildGalleryImage('assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg'),
                      _buildGalleryImage('assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg'),
                      _buildGalleryImage('assets/images/sudouest-photo-1-32378160-1600.jpg'),
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

  Widget _buildTranslationLine(String lieu, String analogie, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(lieu, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15), softWrap: true),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15), softWrap: true),
          ),
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