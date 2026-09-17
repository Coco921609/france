import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ForetDeBroceliandePage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const ForetDeBroceliandePage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFF27AE60),
  });

  @override
  State<ForetDeBroceliandePage> createState() => _ForetDeBroceliandePageState();
}

class _ForetDeBroceliandePageState extends State<ForetDeBroceliandePage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant ForetDeBroceliandePage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Basse saison)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février (Basse saison)
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.orange},   // Mars (Début de saison)
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Avril (Printemps idéal)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Juillet (Forte affluence)
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Août (Forte affluence)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Octobre (Automne magique)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre (Basse saison)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Décembre (Basse saison)
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
        'title': 'غابة بروسيلاند 🌳',
        'pageTitle': 'غابة بروسيلاند',
        'introTitle': '✨ مملكة أساطير الملك آرثر',
        'introText': 'غُص في قلب الغموض البريتوني. تشتهر غابة بروسيلاند بروابطها مع أساطير الملك آرثر، وتدعوك للتأمل بين أشجار البلوط المعمرة والبرك السرية والأحجار المشبعة بالتاريخ، حيث يلتقي الواقع بالخيال.',
        'tarifsTitle': '🎟️ الأسعار والأنشطة (بوابة الأسرار)',
        'tarifs': [
          ['بالغ', '7,00 €'],
          ['طفل (6-18 سنة)', '4,50 €'],
          ['تذكرة عائلية (بالغين + طفلين)', '20,00 €'],
          ['أقل من 6 سنوات', 'مجاناً'],
        ],
        'tarifsNote': '* أسعار تقريبية لمركز التفسير. الوصول إلى مسارات الغابة مجاني.',
        'horairesTitle': '🗓️ أوقات العمل',
        'fermetureText': 'الإغلاق والمواسم: تختلف أوقات الدخول بحسب المراكز ومكاتب السياحة.',
        'horairesTable': [
          ['أبريل - يونيو', '10:00 ص - 06:00 م'],
          ['يوليو - أغسطس', '09:30 ص - 07:00 م'],
          ['سبتمبر - أكتوبر', '10:00 ص - 06:00 م'],
          ['نوفمبر - مارس', 'مغلق أو ساعات محدودة'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'accesTitle': '🚗 الوصول وموقف السيارات',
        'accesText': 'عنوان نظام تحديد المواقع العالمي (GPS): Paimpont, 35380 Ille-et-Vilaine.\n\nتتوفر عدة مواقف مجانية للسيارات بالقرب من المواقع الرئيسية (تريهورنتوك، كونكوريت، بيمبون). يُنصح بالوقف في الأماكن المخصصة لحماية النظام البيئي للغابة.',
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: قد تتغير ظروف الوصول والطقس في الغابة.',
        'legendeVert': '🟢 أخضر : فترة مثالية وهادئة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل',
        'legendeRouge': '🔴 أحمر : ذروة الزوار (موسم الذروة)',
        'legendeGris': '⚪ رمادي : خارج Season أو ساعات محدودة',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: قد تتغير ظروف الوصول إلى المسارات وأوقات العمل حسب الطقس والموسم. تحقق من الشروط قبل المغادرة.',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['غابة هويا بياكا (رومانيا) 🇷🇴', 'غابة كثيفة وغامضة تحيط بها أساطير محلية، وتُعرف باسم "برمودا رومانيا".'],
          ['غابة بلاك هيلز (ساوث داكوتا، أمريكا) 🇺🇸', 'غابة مهيبة مليئة بأشجار الصنوبر الداكنة والتاريخ العريق والغموض.'],
          ['منتزه غابة ديارين (اليابان) 🇯🇵', 'طبيعة ساحرة وأشجار عملاقة تمنح شعورًا بالعوالم الخيالية الأسطورية.']
        ],
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Brocéliande Forest 🌳',
        'pageTitle': 'Brocéliande Forest',
        'introTitle': '✨ The realm of Arthurian legends',
        'introText': 'Dive into the heart of Breton mystery. Famous for its ties to Arthurian legends, Brocéliande invites you to meditate among ancient oaks, secret ponds, and history-laden stones where reality and wonder meet.',
        'tarifsTitle': '🎟️ Activities & Rates (Gate of Secrets)',
        'tarifs': [
          ['Adult', '7.00 €'],
          ['Child (6-18 yrs)', '4.50 €'],
          ['Family Pass (2 adults + 2 children)', '20.00 €'],
          ['Under 6 yrs', 'Free'],
        ],
        'tarifsNote': '* Indicative rates for the interpretation center. Free access to the forest paths.',
        'horairesTitle': '🗓️ Opening Hours',
        'fermetureText': 'Seasonal closures: Access times vary depending on centers and tourist offices.',
        'horairesTable': [
          ['April - June', '10:00 AM - 6:00 PM'],
          ['July - August', '09:30 AM - 7:00 PM'],
          ['Sept - October', '10:00 AM - 6:00 PM'],
          ['Nov - March', 'Closed or limited hours'],
        ],
        'galerieTitle': '📸 Place Overview',
        'accesTitle': '🚗 Arrival & Parking',
        'accesText': 'GPS Address: Paimpont, 35380 Ille-et-Vilaine, France.\n\nSeveral free parking lots are available near the main sites (Tréhorenteuc, Concoret, Paimpont). Please park in designated areas to protect the forest ecosystem.',
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Trail conditions and weather can change.',
        'legendeVert': '🟢 Green: Ideal and quiet period',
        'legendeOrange': '🟠 Orange: Moderate crowds',
        'legendeRouge': '🔴 Red: Peak visitors',
        'legendeGris': '⚪ Grey: Off-season / Limited hours',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Trail conditions and opening schedules may vary depending on weather and season. Check conditions before leaving.',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Hoia Baciu Forest (Romania) 🇷🇴', 'A dense, mysterious forest shrouded in local legends, often called the "Bermuda Triangle of Romania".'],
          ['Black Hills Forest (South Dakota, USA) 🇺🇸', 'A majestic forest filled with dark pine trees, deep history, and a touch of mystery.'],
          ['Daisetsuzan National Park Forests (Japan) 🇯🇵', 'Enchanting nature and ancient trees evoking deeply mystical fantasy worlds.']
        ],
      };
    } else {
      return {
        'title': 'Forêt de Brocéliande 🌳',
        'pageTitle': 'Forêt de Brocéliande',
        'introTitle': '✨ Le royaume des légendes arthuriennes',
        'introText': "Plongez au cœur du mystère breton. La forêt de Brocéliande, célèbre pour ses liens avec les légendes arthuriennes, invite à la méditation entre les chênes centenaires, les étangs secrets et les pierres chargées d'histoire. Un lieu où le réel et le merveilleux se rencontrent.",
        'tarifsTitle': '🎟️ Activités & Tarifs (Porte des Secrets)',
        'tarifs': [
          ['Adulte', '7,00 €'],
          ['Enfant (6-18 ans)', '4,50 €'],
          ['Pass Famille (2 adultes + 2 enfants)', '20,00 €'],
          ['Moins de 6 ans', 'Gratuit'],
        ],
        'tarifsNote': "* Tarifs indicatifs pour le centre d'interprétation. Accès libre à la forêt.",
        'horairesTitle': '🗓️ Horaires d\'ouverture',
        'fermetureText': "Fermeture annuelle et saisonnière : les horaires varient selon les sites et les offices de tourisme.",
        'horairesTable': [
          ['Avril - Juin', '10h00 - 18h00'],
          ['Juillet - Août', '09h30 - 19h00'],
          ['Sept - Octobre', '10h00 - 18h00'],
          ['Novembre - Mars', 'Fermé ou horaires réduits'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'accesTitle': '🚗 Arrivée & Parking',
        'accesText': "Adresse GPS : Paimpont, 35380 Ille-et-Vilaine.\n\nPlusieurs parkings gratuits sont aménagés aux abords des principaux sites (Tréhorenteuc, Concoret, Paimpont). Il est recommandé de stationner dans les zones autorisées pour préserver l'écosystème forestier.",
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Période estivale ou automnale',
        'legendeGris': '⚪ Basse saison / Fermeture ou horaires réduits',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': "⚠️ Attention : les conditions d'accès aux sentiers et les horaires des sites peuvent varier selon la météo et la saison. Vérifiez les ouvertures avant de partir.",
        'similarPlacesTitle': '🌍 Endroits similaires à la Forêt de Brocéliande dans le monde',
        'similarPlaces': [
          ['Forêt de Hoia Baciu (Roumanie) 🇷🇴', 'Une forêt dense et mystérieuse enveloppée de légendes locales, souvent qualifiée de triangle des Bermudes roumain.'],
          ['Black Hills (Dakota du Sud, États-Unis) 🇺🇸', 'Une forêt majestueuse peuplée de pins sombres, d’histoires anciennes et d’une aura mystique.'],
          ['Parc National de Daisetsuzan (Hokkaido, Japon) 🇯🇵', 'Une nature sauvage et ensorcelante rappelant les décors de contes de fées et de légendes anciennes.']
        ],
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

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(cell, style: GoogleFonts.montserrat(
              color: isHeader ? hColor : Colors.white70,
              fontSize: 12, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            )),
          )).toList(),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isRtl = _currentLanguageCode == 'ar';
    final data = _getLocalizedData();
    final months = data['months'] as List;

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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL UNIQUEMENT
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
                      'assets/image/55.jpg',
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

                  // TITRE & INTRODUCTION
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
                          data['title'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['introTitle'],
                          style: GoogleFonts.montserrat(
                            color: _currentColor.withOpacity(0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['introText'],
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- ENDROITS SIMILAIRES ---
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

                  // --- TARIFS ---
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
                        Text(data['tarifsTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        _buildTable([
                          ['Type', 'Tarif'],
                          ...data['tarifs'],
                        ], _currentColor),
                        const SizedBox(height: 10),
                        Text(data['tarifsNote'], style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- CALENDRIER D'OUVERTURE ---
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
                        Text(data['horairesTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['fermetureText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),
                        const SizedBox(height: 10),
                        _buildTable([
                          ['Période', 'Détails'],
                          ...data['horairesTable'],
                        ], _currentColor),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- CALENDRIER D'AFFLUENCE ET DE SAISONNALITÉ ---
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

                  // --- ACCÈS & PARKING ---
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
                        Text(data['accesTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['accesText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),
                        const SizedBox(height: 16),
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
                            onPressed: () => _openMap('Paimpont, 35380 Ille-et-Vilaine'),
                            icon: const Icon(Icons.map, size: 18),
                            label: Text(
                              data['mapsLabel'],
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- GALERIE PHOTOS VERTICALES ---
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(data['galerieTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      ),
                      _buildGalleryImage('assets/image/52.jpeg'),
                      _buildGalleryImage('assets/image/53.jpg'),
                      _buildGalleryImage('assets/image/54.jpg'),
                      _buildGalleryImage('assets/image/56.jpg'),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}