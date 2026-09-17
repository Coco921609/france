import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class IleDeLaViergePage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const IleDeLaViergePage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFF40E0D0),
  });

  @override
  State<IleDeLaViergePage> createState() => _IleDeLaViergePageState();
}

class _IleDeLaViergePageState extends State<IleDeLaViergePage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant IleDeLaViergePage oldWidget) {
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
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mars
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Avril
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Mai
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.red, 'mid': Colors.orange, 'bot': Colors.green},     // Septembre
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
        'title': 'جزيرة العذراء 🌊',
        'pageTitle': 'جزيرة العذراء',
        'introTitle': '🏝️ لمسة من الكاريبي في بريتاني',
        'introText': "تُعد جزيرة العذراء الواقعة في كروسون ببريتاني شهيرة بشاطئها الخلاب ذي المياه البلورية والرمال البيضاء. هذا المكان، الذي يشبه منطقة الكاريبي، يُذكر غالباً بين أجمل شواطئ أوروبا ويقدم مشهداً طبيعياً بجمال غير واقعي تقريباً.",
        'seasonsTitle': 'أفضل الفترات',
        'seasonsHeader1': 'الحالة',
        'seasonsHeader2': 'الطقس والألوان',
        'seasons': [
          ['✅ ممتاز', 'من مايو إلى سبتمبر (مياه تركوازية)'],
          ['🌤️ جيد', 'أبريل وأكتوبر (إضاءة جميلة)'],
          ['🌧️ تحذير', 'الشتاء (رياح قوية وأمطار)'],
        ],
        'hoursTitle': 'الأوقات الموصى بها',
        'hoursHeader1': 'الوقت',
        'hoursHeader2': 'النصائح',
        'hours': [
          ['✨ الصباح', 'مثالي للهدوء (8 صباحاً - 10 صباحاً)'],
          ['☀️ الظهر', 'إضاءة قصوى على الماء التركوازي'],
          ['🌅 المساء', 'غروب الشمس على المنحدرات'],
        ],
        'bestMonthsTitle': 'مستويات الازدحام وفترات الزيارة',
        'periodStart': 'بداية',
        'periodMid': 'منتصف',
        'periodEnd': 'نهاية',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: لوائح صارمة لحماية الموقع.',
        'legendeVert': '🟢 أخضر: فترة هادئة',
        'legendeOrange': '🟠 برتقالي: ازدحام معتدل',
        'legendeRouge': '🔴 أحمر: موسم الذروة / الصيف',
        'legendeGris': '⚪ رمادي: فترة متغيرة',
        'conseilsTitle': 'المستلزمات والمعلومات',
        'conseils': [
          [Icons.cloudy_snowing, "المطر يهطل بغزارة في بريتاني! تحقق جيداً من الطقس ودرجات الحرارة قبل المغادرة."],
          [Icons.block, "الوصول إلى الشاطئ ممنوع (لحماية النظام البيئي)"],
          [Icons.waves, "يمنع السباحة (منحدرات غير مستقرة)"],
          [Icons.directions_walk, "يوصى بارتداء أحذية المشي"],
          [Icons.camera_alt_outlined, "لا تنس الكاميرا!"],
        ],
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['شاطئ نَافَاجِيو (اليونان) 🇬🇷', 'خليج مذهل تحيط به منحدرات كلسية شاهقة ومياه تركوازية ساحرة.'],
          ['مايا باي (تايلاند) 🇹🇭', 'خليج خيالي تحيط به صخور شاهقة ومياه صافية كالبلور.'],
          ['كالا ماكاريليتا (إسبانيا) 🇪🇸', 'شاطئ صغير بمياه شفافة ومحاط بمنحدرات وطبيعة خضراء خلابة.']
        ],
        'galerieTitle': 'لمحة عن المكان',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: تحقق من حالة الطقس وحظر الوصول الساري قبل زيارتك.',
        'ileInfo': {
          'titre': 'Île de la Vierge Crozon',
          'titreAffichage': 'جزيرة العذراء 🌊',
          'image': 'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
          'typeAcces': 'شبه جزيرة كروسون / بريتاني',
          'photos': [
            'assets/images/crique-ile-vierge-crozon.jpg',
            'assets/images/1000_F_571714788_cDQWVGIEK8a387ijfVo7Ii6TDqvbT1Ph.jpg',
            'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Virgin Island 🌊',
        'pageTitle': 'Virgin Island',
        'introTitle': '🏝️ A touch of the Caribbean in Brittany',
        'introText': "Located in Crozon, Brittany, Virgin Island is famous for its paradise beach with crystal-clear waters and white sand. This place, which looks like the Caribbean, is often cited among the most beautiful beaches in Europe and offers a natural spectacle of almost unreal beauty.",
        'seasonsTitle': 'Best Periods',
        'seasonsHeader1': 'Status',
        'seasonsHeader2': 'Weather & Colors',
        'seasons': [
          ['✅ Top', 'May to September (Turquoise waters)'],
          ['🌤️ Ok', 'April & October (Beautiful light)'],
          ['🌧️ Caution', 'Winter (Strong winds & rain)'],
        ],
        'hoursTitle': 'Recommended Hours',
        'hoursHeader1': 'Time',
        'hoursHeader2': 'Tips',
        'hours': [
          ['✨ Morning', 'Ideal for calm (8 AM - 10 AM)'],
          ['☀️ Noon', 'Max light on turquoise water'],
          ['🌅 Evening', 'Sunset on the cliffs'],
        ],
        'bestMonthsTitle': 'Crowd Levels & Seasonality Calendar',
        'periodStart': 'Early',
        'periodMid': 'Mid',
        'periodEnd': 'Late',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Strict regulations for site protection.',
        'legendeVert': '🟢 Green: Calm period',
        'legendeOrange': '🟠 Orange: Moderate crowds',
        'legendeRouge': '🔴 Red: High season / Summer',
        'legendeGris': '⚪ Grey: Variable period',
        'conseilsTitle': 'Essentials & Info',
        'conseils': [
          [Icons.cloudy_snowing, "It rains a lot in Brittany! Check the weather and temperatures before leaving."],
          [Icons.block, "Beach access prohibited (Ecosystem protection)"],
          [Icons.waves, "Do not swim (Unstable cliffs)"],
          [Icons.directions_walk, "Walking shoes recommended"],
          [Icons.camera_alt_outlined, "Don't forget your camera!"],
        ],
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Navagio Beach (Greece) 🇬🇷', 'A spectacular cove framed by limestone cliffs and intense turquoise water.'],
          ['Maya Bay (Thailand) 🇹🇭', 'A paradise bay bordered by dizzying cliffs and crystal-clear waters.'],
          ['Cala Macarelleta (Spain) 🇪🇸', 'A cove with transparent waters surrounded by cliffs and lush vegetation.']
        ],
        'galerieTitle': 'Place Overview',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Warning: Check the weather and current access prohibitions before your visit.',
        'ileInfo': {
          'titre': 'Île de la Vierge Crozon',
          'titreAffichage': 'Virgin Island 🌊',
          'image': 'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
          'typeAcces': 'Crozon Peninsula / Brittany',
          'photos': [
            'assets/images/crique-ile-vierge-crozon.jpg',
            'assets/images/1000_F_571714788_cDQWVGIEK8a387ijfVo7Ii6TDqvbT1Ph.jpg',
            'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
          ]
        }
      };
    } else {
      return {
        'title': 'Île de la Vierge 🌊',
        'pageTitle': 'Île de la Vierge',
        'introTitle': '🏝️ Un air de Caraïbes en Bretagne',
        'introText': "Située à Crozon en Bretagne, l'île Vierge est célèbre pour sa plage paradisiaque aux eaux cristallines et au sable blanc. Cet endroit, qui ressemble aux Caraïbes, est souvent cité parmi les plus belles plages d'Europe et offre un spectacle naturel d'une beauté presque irréelle.",
        'seasonsTitle': 'Meilleures périodes',
        'seasonsHeader1': 'Statut',
        'seasonsHeader2': 'Météo & Couleurs',
        'seasons': [
          ['✅ Top', 'Mai à Septembre (Eaux turquoise)'],
          ['🌤️ Ok', 'Avril & Octobre (Belle lumière)'],
          ['🌧️ Prudence', 'Hiver (Vents forts & pluie)'],
        ],
        'hoursTitle': 'Horaires conseillés',
        'hoursHeader1': 'Moment',
        'hoursHeader2': 'Conseils',
        'hours': [
          ['✨ Matin', 'Idéal pour le calme (8 h - 10 h)'],
          ['☀️ Midi', 'Lumière max sur l\'eau turquoise'],
          ['🌅 Soir', 'Coucher de soleil sur les falaises'],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début',
        'periodMid': 'Milieu',
        'periodEnd': 'Fin',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Réglementation stricte pour la protection du site.',
        'legendeVert': '🟢 Vert : Période calme',
        'legendeOrange': '🟠 Orange : Affluence modérée',
        'legendeRouge': '🔴 Rouge : Haute saison / Été',
        'legendeGris': '⚪ Gris : Période variable',
        'conseilsTitle': 'Indispensables & Infos',
        'conseils': [
          [Icons.cloudy_snowing, "En Bretagne il pleut beaucoup ! Regarde bien la météo et les températures avant de partir."],
          [Icons.block, "Accès à la plage interdit (Écosystème)"],
          [Icons.waves, "Ne pas s'y baigner (Falaises instables)"],
          [Icons.directions_walk, "Chaussures de marche recommandées"],
          [Icons.camera_alt_outlined, "N'oubliez pas l'appareil photo !"],
        ],
        'similarPlacesTitle': '🌍 Endroits similaires dans le monde',
        'similarPlaces': [
          ['Plage de Navagio (Grèce) 🇬🇷', 'Une crique spectaculaire encadrée de falaises calcaires et d\'une eau turquoise intense.'],
          ['Maya Bay (Thaïlande) 🇹🇭', 'Une baie paradisiaque bordée de falaises vertigineuses et d\'eaux cristallines.'],
          ['Cala Macarelleta (Espagne) 🇪🇸', 'Une crique aux eaux transparentes entourée de falaises et d\'une végétation luxuriante.']
        ],
        'galerieTitle': 'Aperçu du lieu',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez la météo et les interdictions d\'accès en vigueur avant votre visite.',
        'ileInfo': {
          'titre': 'Île de la Vierge Crozon',
          'titreAffichage': 'Île de la Vierge 🌊',
          'image': 'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
          'typeAcces': 'Presqu\'île de Crozon / Bretagne',
          'photos': [
            'assets/images/crique-ile-vierge-crozon.jpg',
            'assets/images/1000_F_571714788_cDQWVGIEK8a387ijfVo7Ii6TDqvbT1Ph.jpg',
            'assets/images/presqu-ile-de-crozon-1-1200x675.jpeg',
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
    final Color turquoise = _currentColor;
    final bool isRtl = _currentLanguageCode == 'ar';
    final data = _getLocalizedData();
    final ileInfo = data['ileInfo'] as Map<String, dynamic>;
    final seasonsList = data['seasons'] as List;
    final hoursList = data['hours'] as List;
    final months = data['months'] as List;
    final conseilsList = data['conseils'] as List;
    final photos = ileInfo['photos'] as List;

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
                  // EN-TÊTE AVEC TITRE COURT ET SANS TRONCATURE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          data['pageTitle'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _toggleLanguage,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: turquoise.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: turquoise.withOpacity(0.4)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.language, color: turquoise, size: 16),
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
                      ileInfo['image'],
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
                      border: Border.all(color: turquoise.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ileInfo['titreAffichage'],
                          style: GoogleFonts.cinzel(
                            color: turquoise,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: turquoise.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            ileInfo['typeAcces'],
                            style: TextStyle(
                              color: turquoise,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 2. INTRODUCTION & DESCRIPTION
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
                            color: turquoise.withOpacity(0.9),
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
                        backgroundColor: turquoise,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => _openMap(ileInfo['titre']),
                      icon: const Icon(Icons.map, size: 18),
                      label: Text(
                        data['mapsLabel'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. TABLEAU PÉRIODES
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
                        _buildSectionTitle(data['seasonsTitle'], turquoise),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['seasonsHeader1'], data['seasonsHeader2']], isHeader: true, hColor: turquoise),
                            ...seasonsList.map((s) => _buildTableRow([s[0], s[1]])),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. TABLEAU HORAIRES CONSEILLÉS
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
                        _buildSectionTitle(data['hoursTitle'], turquoise),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['hoursHeader1'], data['hoursHeader2']], isHeader: true, hColor: turquoise),
                            ...hoursList.map((h) => _buildTableRow([h[0], h[1]])),
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

                  // 6. INDISPENSABLES & INFOS
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
                        _buildSectionTitle(data['conseilsTitle'], turquoise),
                        const SizedBox(height: 12),
                        ...conseilsList.map((info) => _buildTechRow(info[0], info[1], turquoise)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 6. BIS - ENDROITS SIMILAIRES À L'ÉTRANGER
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
                  _buildSectionTitle(data['galerieTitle'], turquoise),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.7), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, height: 1.4), softWrap: true)),
        ],
      ),
    );
  }
}