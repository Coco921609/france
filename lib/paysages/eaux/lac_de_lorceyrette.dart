import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class LacOrceyrettePage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const LacOrceyrettePage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<LacOrceyrettePage> createState() => _LacOrceyrettePageState();
}

class _LacOrceyrettePageState extends State<LacOrceyrettePage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant LacOrceyrettePage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Gelé / Hiver)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février
      {'top': Colors.grey, 'mid': Colors.green, 'bot': Colors.green},     // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril (Printemps)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin (Été)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juillet
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Août
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.red},     // Septembre
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.orange},       // Octobre (Automne / Top couleurs)
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
        'title': 'بحيرة أورْسَيريت 🌲',
        'pageTitle': 'بحيرة أورسيريت : كندا الصغرى في الألب',
        'introTitle': '🇨🇦 لمسة من كندا في جبال الألب العليا',
        'introText': "تعتبر بحيرة أورسيريت الواقعة في جبال الألب العليا مذهلة للغاية في فصل الخريف. تتزين الأشجار بألوان برتقالية متوهجة تنعكس بنقاء في المياه الصافية. عند غروب الشمس، يضيء الضوء الجبال المغطاة بالثلوج في Distance، مما يقدم مشهداً يضاهي أعظم المنتزهات الكندية.",
        'translationsTitle': 'كلمات ومفاهيم أساسية',
        'translations': [
          ['بحيرة', 'بحيرة / مسطح مائي'],
          ['أورسييريت', 'وادي وجدول في جبال الألب'],
          ['الزان', 'أشجار اللاركس (تتحول للذهبي خريفاً)'],
        ],
        'saisonsTitle': '📅 جدول زيارة البحيرة',
        'saisonHeader': 'الحالة',
        'conseilsHeader': 'المواسم والأجواء',
        'saisons': [
          ['✅ ممتاز', 'الخريف (ألوان الأشجار السحرية)'],
          ['🌤️ الصيف', 'مثالي للانتعاش والمياه النقية'],
          ['❄️ نادراً', 'الشتاء (بحيرة متجمدة، أجواء القطب الشمالي)'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ الصباح', 'مياه تشبه المرآة لانعكاسات مثالية'],
          ['☀️ منتصف النهار', 'إضاءة مباشرة على أشجار اللاركس'],
          ['🌅 المساء', 'غروب الشمس على القمم الجبلية'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.wb_sunny_outlined, "الزيارة عند الغروب للحصول على أفضل الألوان"],
          [Icons.directions_car, "يمكن الوصول إليها مباشرة بالسيارة"],
          [Icons.terrain, "إمكانية القيام بنزهة جبلية للمهتمين"],
          [Icons.camera_alt_outlined, "مرآة مائية مثالية لالتقاط الصور"],
          [Icons.ac_unit, "تغلق الطريق عند تساقط الثلوج الأولى"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام وفترات الموسم',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطريق والطقس قبل الصعود.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : انتعاش وأجواء صيفية رائعة',
        'legendeRouge': '🔴 أحمر : ذروة ألوان الخريف المذهلة',
        'legendeGris': '⚪ رمادي : موسم منخفض البرودة أو طريق مغلق',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة.',
        'histoireLabel': 'قصة الموقع وتاريخه الطبيعي',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 مناظر طبيعية مشابهة حول العالم',
        'similarPlaces': [
          ['بحيرة مورين (بانف، كندا) 🇨🇦', 'تشتهر بمياهها الفيروزية الصافية وقممها الجبلية الشامخة التي تشبه أجواء أورسيريت.'],
          ['بحيرة بليد (سلوفينيا) 🇸🇮', 'بحيرة جبلية ساحرة تتميز بمياهها الخضراء الزمردية وكنيستها الشهيرة وسط الجزيرة.'],
          ['بحيرة برايس (إيطاليا) 🇮🇹', 'تُعرف بلؤلؤة جبال الأدولوميت، بمياهها الصافية وانعكاسات الجبال المهيبة عليها.']
        ],
        'altInfo': {
          'titre': "Lac de l'Orceyrette",
          'titreAffichage': 'بحيرة أورسيريت - الألب العليا',
          'image': 'assets/images/lac_or10.jpg',
          'typeAcces': 'حر / عبر طريق غابي من بريانسون',
          'histoire': "تُعد بحيرة أورسيريت موقعاً طبيعياً ساحراً ومحمياً في قلب جبال الألب العليا، تحيط بها غابات كثيفة من أشجار اللاركس وتوفر هادئاً وجمالاً يذكّر بالطبيعة الكندية البكر.",
          'saviezVous': "هل تعلم أن أشجار اللاركس المحيطة بالبحيرة هي من القلائل بين الصنوبريات التي تسقط إبرها صيفاً/خريفاً بعد أن تكتسي باللون الذهبي البراق.",
          'photoAstuce': "استغل الصباح الباكر أو وقت الغروب للحصول على تأثير المرآة السطحية الكامل على صفحة المياه النقية.",
          'photosVerticales': [
            'assets/images/img_8810.jpg',
            'assets/images/lac_or10.jpg',
            'assets/images/DES_0502-1-1920x1080.jpg',
            'assets/images/lac-de-lorceyrette-5-scaled.jpg',
            'assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Lake Orceyrette 🌲',
        'pageTitle': 'Lake Orceyrette : Canada in the Alps',
        'introTitle': '🇨🇦 A touch of Canada in the Hautes-Alpes',
        'introText': "Located in the Hautes-Alpes, Lake Orceyrette is simply magnificent in autumn. The trees don flamboyant orange colors that reflect purely in the crystal-clear water. At sunset, the light sets the distant snowy mountains ablaze, offering a spectacle worthy of the greatest Canadian parks.",
        'translationsTitle': 'Key Vocabulary',
        'translations': [
          ['Lake', 'Lake / Body of water'],
          ['Orceyrette', 'Valley and stream in the Hautes-Alpes'],
          ['Larches', 'Larch trees (golden needles in autumn)'],
        ],
        'saisonsTitle': '📅 Visit Calendar',
        'saisonHeader': 'Status',
        'conseilsHeader': 'Seasons & Ambience',
        'saisons': [
          ['✅ Top', 'Autumn (Magical tree colors)'],
          ['🌤️ Summer', 'Perfect for freshness and pure water'],
          ['❄️ Rare', 'Winter (Frozen lake, great north vibe)'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Morning', 'Mirror water for perfect reflections'],
          ['☀️ Noon', 'Zenithal light on the larches'],
          ['🌅 Evening', 'Sunset over the peaks'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.wb_sunny_outlined, "Come at sunset for the colors"],
          [Icons.directions_car, "Directly accessible by car"],
          [Icons.terrain, "Hiking possible for the motivated"],
          [Icons.camera_alt_outlined, "Perfect water mirror for photography"],
          [Icons.ac_unit, "Road closed upon first heavy snows"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Seasonality Calendar',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check road accessibility and weather before visiting.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Summer freshness and pure nature',
        'legendeRouge': '🔴 Red: Peak autumn colors and vibrancy',
        'legendeGris': '⚪ Grey: Low cool season or closed road',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Please check weather and access conditions before visiting.',
        'histoireLabel': 'History & Background',
        'saviezVousLabel': 'Did you know?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Moraine Lake (Banff National Park, Canada) 🇨🇦', 'Famous for its intense turquoise waters and spectacular snowy peaks.'],
          ['Lake Bled (Slovenia) 🇸🇮', 'A charming alpine lake known for its emerald-green waters and iconic island church.'],
          ['Lake Braies (Italy) 🇮🇹', 'Known as the pearl of the Dolomites, featuring crystal-clear waters and majestic mountain reflections.']
        ],
        'altInfo': {
          'titre': "Lac de l'Orceyrette",
          'titreAffichage': 'Lake Orceyrette - Hautes-Alpes',
          'image': 'assets/images/lac_or10.jpg',
          'typeAcces': 'Free access / Forest road from Briançon',
          'histoire': "Lake Orceyrette is a preserved site nestled in the Hautes-Alpes. Surrounded by a splendid larch forest, it offers absolute tranquility reminiscent of great North American parks.",
          'saviezVous': "Did you know that the larches surrounding the lake are among the rare conifers that shed their needles in winter, after turning a flamboyant golden yellow in autumn.",
          'photoAstuce': "Take advantage of early morning or sunset light to capture a perfect mirror effect on the crystal-clear water.",
          'photosVerticales': [
            'assets/images/img_8810.jpg',
            'assets/images/lac_or10.jpg',
            'assets/images/DES_0502-1-1920x1080.jpg',
            'assets/images/lac-de-lorceyrette-5-scaled.jpg',
            'assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg',
          ]
        }
      };
    } else {
      return {
        'title': "Lac de l'Orceyrette 🌲",
        'pageTitle': "Lac de l'Orceyrette : Un air de Canada",
        'introTitle': "🇨🇦 Un air de Canada dans les Hautes-Alpes",
        'introText': "Situé dans les Hautes-Alpes, le lac de l'Orceyrette est tout simplement magnifique en automne. Les arbres se parent de couleurs orangées flamboyantes qui se reflètent avec pureté dans l'eau cristalline. Au coucher du soleil, la lumière embrase les montagnes enneigées au loin, offrant un spectacle digne des plus grands parcs canadiens.",
        'translationsTitle': 'Vocabulaire & Mots clés',
        'translations': [
          ['Lac', 'Étendue d’eau douce naturelle'],
          ['Orceyrette', 'Vallée et torrent des Hautes-Alpes'],
          ['Mélèzes', 'Conifères aux aiguilles dorées en automne'],
        ],
        'saisonsTitle': '📅 Calendrier de visite',
        'saisonHeader': 'Statut',
        'conseilsHeader': 'Saisons & ambiance',
        'saisons': [
          ['✅ Top', 'Automne (Couleurs des arbres magiques)'],
          ['🌤️ Été', 'Parfait pour la fraîcheur et l\'eau pure'],
          ['❄️ Rare', 'Hiver (Lac gelé, ambiance grand nord)'],
        ],
        'horairesTitle': '⏰ Horaires conseillés',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Matin', 'Eau miroir pour des reflets parfaits'],
          ['☀️ Midi', 'Lumière zénithale sur les mélèzes'],
          ['🌅 Soir', 'Coucher de soleil sur les sommets'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.wb_sunny_outlined, "Venir au coucher du soleil pour les couleurs"],
          [Icons.directions_car, "Accessible directement en voiture"],
          [Icons.terrain, "Randonnée possible pour les plus motivés"],
          [Icons.camera_alt_outlined, "Miroir d'eau parfait pour la photo"],
          [Icons.ac_unit, "Route fermée dès les premières grosses neiges"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’accès routier et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale / Météo agréable',
        'legendeOrange': '🟠 Affluence modérée / Période estivale fraîche',
        'legendeRouge': '🔴 Forte affluence / Couleurs maximales (Automne)',
        'legendeGris': '⚪ Basse saison / Route fermée par la neige',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez la météo ainsi que les conditions d\'accès avant de visiter le site.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires au Lac de l\'Orceyrette dans le monde',
        'similarPlaces': [
          ['Moraine Lake (Parc national de Banff, Canada) 🇨🇦', 'Célèbre pour ses eaux turquoise intérieures et ses sommets enneigés spectaculaires.'],
          ['Lake Bled (Slovénie) 🇸🇮', 'Un lac alpin charmant, célèbre pour ses eaux émeraude et son îlot pittoresque.'],
          ['Lac de Braies (Italie) 🇮🇹', 'Considéré comme la perle des Dolomites, offrant des reflets alpins spectaculaires.']
        ],
        'altInfo': {
          'titre': "Lac de l'Orceyrette",
          'titreAffichage': "Lac de l'Orceyrette - Hautes-Alpes",
          'image': 'assets/images/lac_or10.jpg',
          'typeAcces': 'Accès libre / Route forestière depuis Briançon',
          'histoire': "Le lac de l'Orceyrette est un site préservé niché dans les Hautes-Alpes. Entouré d'une splendide forêt de mélèzes, il offre un paysage d'une quiétude absolue qui rappelle les grands espaces nord-américains.",
          'saviezVous': "Saviez-vous que les mélèzes entourant le lac sont l'un des rares conifères à perdre leurs aiguilles en hiver, après s'être parés d'un jaune d'or flamboyant en automne.",
          'photoAstuce': "Privilégiez les premières lueurs du matin ou la fin de journée pour capturer un effet miroir parfait sur l'eau cristalline.",
          'photosVerticales': [
            'assets/images/img_8810.jpg',
            'assets/images/lac_or10.jpg',
            'assets/images/DES_0502-1-1920x1080.jpg',
            'assets/images/lac-de-lorceyrette-5-scaled.jpg',
            'assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg',
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
                                              style: const TextStyle(color: Colors.white54, fontSize: 9, height: 1.2),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
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
                                              style: const TextStyle(color: Colors.white54, fontSize: 9, height: 1.2),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
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
                                              style: const TextStyle(color: Colors.white54, fontSize: 9, height: 1.2),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
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
                      _buildGalleryImage('assets/images/img_8810.jpg'),
                      _buildGalleryImage('assets/images/lac_or10.jpg'),
                      _buildGalleryImage('assets/images/DES_0502-1-1920x1080.jpg'),
                      _buildGalleryImage('assets/images/lac-de-lorceyrette-5-scaled.jpg'),
                      _buildGalleryImage('assets/images/Orceyrette-en-hiver-©Thibaut-Poinas-scaled-1.jpg'),
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

  Widget _buildTranslationLine(String ger, String fr, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(ger, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              fr,
              style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15),
            ),
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