import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class CheminCimesAlsacePage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const CheminCimesAlsacePage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFF27AE60),
  });

  @override
  State<CheminCimesAlsacePage> createState() => _CheminCimesAlsacePageState();
}

class _CheminCimesAlsacePageState extends State<CheminCimesAlsacePage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant CheminCimesAlsacePage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Fermé)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février (Fermé)
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.orange},   // Mars (Réouverture)
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Avril
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Juillet (Forte affluence)
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Août (Forte affluence)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Octobre (Automne)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre (Fermé)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Décembre (Fermé)
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
        'title': 'مسير القمم 🌳',
        'pageTitle': 'مسير القمم ألزاس : الطبيعة فوق الأشجار',
        'introTitle': '🇩🇪 جو من الغابة السوداء في ألزاس',
        'introText': 'يقع مسير القمم في قلب جبال الفوج الشمالية، ويدعوك في نزهة فريدة من نوعها في قمم الأشجار. مسار بانورامي مذهل يقدم منظورًا جديدًا تمامًا للغابة والمناظر المحيطة.',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['غابة الشوارزوالد (الغابة السوداء - ألمانيا) 🇩🇪', 'غابة أوروبية شهيرة تشارك نفس المpen والخصائص الطبيعية لجبال الفوج وألزاس.'],
          ['مسير القمم في بافاريا (ألمانيا) 🇩🇪', 'ممر خلاب فوق قمم الأشجار يتيح إطلالات مذهلة على الطبيعة البافارية العذراء.'],
          ['ممشى قمم الأشجار في بوهيميا (الجمهورية التشيكية) 🇨🇿', 'تجربة فريدة للمشي بين السحاب ومراقبة الغابات الجبلية المجاورة وسط مناظر خلابة.']
        ],
        'tarifsTitle': '🎟️ أسعار مسير القمم',
        'tarifs': [
          ['بالغ', '15,00 €'],
          ['طفل (4-14 سنة)*', '12,00 €'],
          ['تذكرة عائلية', '39,00 €'],
          ['سعر مخفض (أصحاب الهمم / طلاب / متقاعدون)', '13,00 €'],
          ['طفل أقل من 4 سنوات', 'مجاناً'],
          ['الزحلوقة (Toboggan)', '2,00 €'],
        ],
        'tarifsNote': '* الأطفال دون سن 14 عامًا برفقة شخص بالغ.',
        'aboTitle': '💳 اشتراك الموسم',
        'abo': [
          ['بالغ', '45,00 €'],
          ['سعر مخفض', '39,00 €'],
          ['طفل (4-14 سنة)', '32,00 €'],
          ['تذكرة عائلية', '99,00 €'],
        ],
        'combinesTitle': '🎫 التذاكر المجمعة',
        'combinesText': 'تذكرة عائلية (غابة المغامرات + مسير القمم) : 53,00 €',
        'horairesTitle': '🗓️ تقويم أوقات العمل',
        'fermetureText': 'الإغلاق السنوي: من نوفمبر إلى مارس.',
        'horairesTable': [
          ['أبريل', '10ص - 6م (مغلق أيام: 1، 2، 7، 28)'],
          ['مايو - يونيو', '10ص - 7م (مغلق أيام الثلاثاء)'],
          ['يوليو - سبتمبر', '10ص - 7م (سبتمبر: مغلق أيام الثلاثاء)'],
          ['أكتوبر', '10ص - 6م (مغلق أيام: 6، 13)'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'accesTitle': '🚗 الوصول وموقف السيارات',
        'accesText': 'عنوان نظام تحديد المواقع العالمي (GPS): Route de Schoenenbourg, 67160 Drachenbronn.\n\nيرجى إيقاف سيارتك في موقف السيارات المجاني الكبير بجانب مسبح 7 Fontaines. يوفر الموقف أماكن للسيارات، والحافلات، والدراجات الهوائية، بالإضافة إلى محطتي شحن Izivia. يُحظر الوقوف على طول الطرق لأسباب تتعلق بالسلامة. لا يمكن الوصول المباشر إلى المدخل بالسيارة أو الدراجة.',
        'navetteTitle': '🚌 الحافلة المكوكية والمشي',
        'navetteText': 'تأخذك حافلة مكوكية مجانية من موقف السيارات إلى المدخل. المحطة تقع بجوار الموقف مباشرة. استمتع بطبيعة جبال الفوج الشمالية الخلابة أثناء الرحلة!\n\nهل تفضل المشي؟ يتيح لك مسار المشي لمسافات طويلة الوصول إلى الموقع في غضون ساعة تقريباً، مع لوحات إرشادية ومناطق للاستراحة.',
        'vueTitle': '🗼 إطلالة 360 درجة',
        'vueText': 'يبلغ ارتفاع ارتفاع برج البانوراما 29 متراً على 10 طوابق. يمكن الوصول إليه عبر منحدر لولبي سلس ومناسب للكراسي المتحركة وعربات الأطفال. إطلالة فريدة على سهل الراين، الغابة السوداء، وجبال الفوج الشمالية.\n\nالأرقام: الطول 425 متراً، الميل 6%.',
        'tobogganTitle': '🎢 الزحلوقة',
        'tobogganText': 'زحلوقة نفقية بطول 75 متراً لهبوط حماسي! السعر: 2 يورو / نزول. بساط التزلج متاح من عمر 6 سنوات. مجاني لمن هم دون 6 سنوات برفقة الكبار. مغلقة في حالة المطر أو الثلج أو الرطوبة العالية.',
        'sentierTitle': '🌿 المسار',
        'sentierText': '1050 متراً من المسار الخالي من العوائق على ارتفاع يتراوح بين 5 و23 متراً. ألعاب تعليمية ومسارات توازن حول الحياة البرية المحلية للتعلم بمتعة كبيرة. آمن للغاية للأطفال.',
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: قد تتغير الأسعار والأوقات خلال العام. تحقق من الشروط والأوقات قبل المغادرة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الألوان والزوار',
        'legendeGris': '⚪ رمادي : إغلاق سنوي أو موسم منخفض',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ Attention : les prix et horaires peuvent changer au cours de l\'année. Vérifiez les conditions et ouvertures avant de partir.',
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Tree Top Walk 🌳',
        'pageTitle': 'Chemin des Cimes Alsace : Treetop Walk',
        'introTitle': '🇩🇪 A touch of Black Forest in Alsace',
        'introText': 'Perched in the heart of the Northern Vosges, the Chemin des Cimes invites you to a unique stroll at treetop level. A spectacular panoramic trail offering an unprecedented perspective on the forest and surrounding landscapes.',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['The Black Forest (Germany) 🇩🇪', 'Famous European forest sharing the exact same dense wooded vibe and natural ecosystem.'],
          ['Bavarian Treetop Walk (Germany) 🇩🇪', 'A breathtaking elevated walkway offering gorgeous views over pristine Bavarian nature.'],
          ['Bohemian Treetop Walk (Czech Republic) 🇨🇿', 'A unique walking experience high in the clouds overlooking neighboring mountain ranges.']
        ],
        'tarifsTitle': '🎟️ Chemin des Cimes Rates',
        'tarifs': [
          ['Adult', '15.00 €'],
          ['Child (4-14 yrs)*', '12.00 €'],
          ['Family Pass', '39.00 €'],
          ['Reduced (Disabled/Student/Senior)', '13.00 €'],
          ['Child < 4 yrs', 'Free'],
          ['Slide', '2.00 €'],
        ],
        'tarifsNote': '* Children under 14 accompanied by an adult.',
        'aboTitle': '💳 Season Pass',
        'abo': [
          ['Adult', '45.00 €'],
          ['Reduced Rate', '39.00 €'],
          ['Child (4-14 yrs)', '32.00 €'],
          ['Family Pass', '99.00 €'],
        ],
        'combinesTitle': '🎫 Combined Tickets',
        'combinesText': 'Family Pass (Adventure Forest + Chemin des Cimes) : 53.00 €',
        'horairesTitle': '🗓️ Opening Calendar',
        'fermetureText': 'Annual closure: from November to March.',
        'horairesTable': [
          ['April', '10am-6pm (Closed: 1, 2, 7, 28)'],
          ['May - June', '10am-7pm (Closed on Tuesdays)'],
          ['July - Sept', '10am-7pm (Sept: Closed on Tuesdays)'],
          ['October', '10am-6pm (Closed: 6, 13)'],
        ],
        'galerieTitle': '📸 Place Overview',
        'accesTitle': '🚗 Arrival & Parking',
        'accesText': 'GPS Address: Route de Schoenenbourg, 67160 Drachenbronn.\n\nPlease park in the large free parking lot next to the 7 Fontaines swimming pool. The parking offers spaces for cars, coaches, bikes, and two Izivia charging stations. Parking along roads is prohibited for safety reasons. Direct access by car or bike to the entrance is not possible.',
        'navetteTitle': '🚌 Shuttle & Walk',
        'navetteText': 'A free shuttle takes you from the parking lot to the entrance. The stop is located right next to it. Enjoy the impressive nature of the Northern Vosges during the ride!\n\nPrefer walking? A marked hiking trail allows you to reach the site in about an hour, with informational signs and rest areas.',
        'vueTitle': '🗼 360° View',
        'vueText': 'The panoramic tower reaches 29m over 10 floors. Accessible via a gentle spiral ramp for wheelchairs and strollers. Unique panorama over the Rhine plain, the Black Forest, and the Northern Vosges.\n\nFigures: Length 425m, Slope 6%.',
        'tobogganTitle': '🎢 Slide',
        'tobogganText': '75m tunnel slide for a fast descent! Price: €2/descent. Sliding mat from 6 years old. Free for under 6s accompanied. Closed in case of rain, snow, or high humidity.',
        'sentierTitle': '🌿 The Trail',
        'sentierText': '1050 meters of obstacle-free trail between 5 and 23m high. Educational games and balance courses on local fauna to learn while having fun. Very safe for children.',
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Prices and schedules may change during the year. Check conditions before leaving.',
        'legendeVert': '🟢 Green: Ideal and quiet period',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution advised',
        'legendeRouge': '🔴 Red: Peak visitors and colors',
        'legendeGris': '⚪ Grey: Annual closure / Low season',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Attention : les prix et horaires peuvent changer au cours de l\'année. Vérifiez les conditions et ouvertures avant de partir.',
      };
    } else {
      return {
        'title': 'Chemin des Cimes 🌳',
        'pageTitle': 'Chemin des Cimes Alsace',
        'introTitle': '🇩🇪 Un air de Forêt-Noire en Alsace',
        'introText': "Perché au cœur des Vosges du Nord, le Chemin des Cimes vous invite à une balade unique au sommet des arbres. Un sentier panoramique spectaculaire qui offre une perspective inédite sur la forêt et les paysages environnants.",
        'similarPlacesTitle': '🌍 Endroits similaires à l\'étranger',
        'similarPlaces': [
          ['La Forêt-Noire (Allemagne) 🇩🇪', 'Une vaste région boisée voisine partageant la même atmosphère mystique et les mêmes paysages forestiers denses.'],
          ['Le Sentier des cimes de Bavière (Allemagne) 🇩🇪', 'Une structure suspendue similaire offrant des vues spectaculaires sur les forêts montagneuses allemandes.'],
          ['Le Sentier des cimes en Tchéquie (République tchèque) 🇨🇿', 'Une passerelle panoramique au-dessus de la canopée idéale pour les amateurs de grands espaces naturels à l\'étranger.']
        ],
        'tarifsTitle': '🎟️ Tarifs Chemin des Cimes',
        'tarifs': [
          ['Adulte', '15,00 €'],
          ['Enfant (4-14 ans)*', '12,00 €'],
          ['Pass Famille', '39,00 €'],
          ['Tarif réduit (PMR/Étud/Retr)', '13,00 €'],
          ['Enfant < 4 ans', 'Gratuit'],
          ['Toboggan', '2,00 €'],
        ],
        'tarifsNote': "*Enfants de -14 ans accompagnés d'un adulte.",
        'aboTitle': '💳 Abonnement Saison',
        'abo': [
          ['Adulte', '45,00 €'],
          ['Tarif réduit', '39,00 €'],
          ['Enfant (4-14 ans)', '32,00 €'],
          ['Pass Famille', '99,00 €'],
        ],
        'combinesTitle': '🎫 Billets Combinés',
        'combinesText': "Pass famille (Forêt d'Aventure + Chemin des Cimes) : 53,00 €",
        'horairesTitle': '🗓️ Calendrier d\'ouverture',
        'fermetureText': "Fermeture annuelle : de novembre à mars.",
        'horairesTable': [
          ['Avril', '10h-18h (Fermé : 1, 2, 7, 28)'],
          ['Mai - Juin', '10h-19h (Fermé les mardis)'],
          ['Juil - Sept', '10h-19h (Sept: Fermé les mardis)'],
          ['Octobre', '10h-18h (Fermé : 6, 13)'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'accesTitle': '🚗 Arrivée & Parking',
        'accesText': "Adresse GPS : Route de Schoenenbourg, 67160 Drachenbronn.\n\nVeuillez vous garer sur le grand parking gratuit à côté de la piscine des 7 Fontaines. Le parking propose des emplacements voitures, autocars, vélos et deux bornes de recharge Izivia. Il est interdit de se garer le long des routes pour des raisons de sécurité. L'accès direct à l'entrée en voiture ou vélo n'est pas possible.",
        'navetteTitle': '🚌 Navette & Marche',
        'navetteText': "Une navette gratuite vous emmène du parking à l'entrée. L'arrêt est situé juste à côté. Profitez de la nature impressionnante des Vosges du Nord pendant le trajet ! \n\nVous préférez marcher ? Un sentier de randonnée balisé vous permet de rejoindre le site en environ une heure, avec des panneaux informatifs et des aires de repos.",
        'vueTitle': '🗼 Vue à 360°',
        'vueText': "La tour panoramique culmine à 29m sur 10 étages. Accessible en spirale douce aux fauteuils roulants et poussettes. Panorama unique sur la plaine du Rhin, la Forêt-Noire et les Vosges du Nord.\n\nChiffres : Longueur 425m, Pente 6%.",
        'tobogganTitle': '🎢 Toboggan',
        'tobogganText': "Toboggan tunnel de 75m pour une descente en trombe ! Prix : 2€/descente. Tapis de glisse dès 6 ans. Gratuit pour les -6 ans accompagnés. Fermé en cas de pluie, neige ou forte humidité.",
        'sentierTitle': '🌿 Le Sentier',
        'sentierText': "1050 mètres de sentier sans obstacles entre 5 et 23m de haut. Jeux éducatifs et parcours d'équilibre sur la faune locale pour apprendre en s'amusant. Très sécurisé pour les enfants.",
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Période estivale ou automnale',
        'legendeGris': '⚪ Basse saison / Fermeture annuelle',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': "⚠️ Attention : les prix et horaires peuvent changer au cours de l'année. Vérifiez les conditions et ouvertures avant de partir.",
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
                      'assets/images/55.jpg',
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

                  // AVERTISSEMENT MÉTÉO / INFO (Unique)
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

                  // --- ENDROITS SIMILAIRES À L'ÉTRANGER ---
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

                  // --- ABONNEMENT SAISON ---
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
                        Text(data['aboTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        _buildTable([
                          ['Type', 'Tarif'],
                          ...data['abo'],
                        ], _currentColor),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- BILLETS COMBINÉS ---
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
                        Text(data['combinesTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['combinesText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14)),
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
                        Text('🚗 Arrivée & Parking', style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
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
                            onPressed: () => _openMap('Route de Schoenenbourg, 67160 Drachenbronn'),
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

                  // --- NAVETTE & MARCHE ---
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
                        Text('🚌 Navette & Marche', style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['navetteText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- VUE À 360° ---
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
                        Text('🗼 Vue à 360°', style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['vueText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- TOBOGGAN ---
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
                        Text('🎢 Toboggan', style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['tobogganText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- LE SENTIER ---
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
                        Text('🌿 Le Sentier', style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        const SizedBox(height: 15),
                        Text(data['sentierText'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14, height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- GALERIE PHOTOS VERTICALES (UNE PAR UNE) ---
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(data['galerieTitle'], style: GoogleFonts.cinzel(color: _currentColor, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                      ),
                      _buildGalleryImage('assets/images/54.jpg'),
                      _buildGalleryImage('assets/images/66.jpg'),
                      _buildGalleryImage('assets/images/33.jpg'),
                      _buildGalleryImage('assets/images/36.jpg'),
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