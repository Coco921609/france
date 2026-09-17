import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class MaraisSalantsAiguesMortesPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const MaraisSalantsAiguesMortesPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<MaraisSalantsAiguesMortesPage> createState() => _MaraisSalantsAiguesMortesPageState();
}

class _MaraisSalantsAiguesMortesPageState extends State<MaraisSalantsAiguesMortesPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant MaraisSalantsAiguesMortesPage oldWidget) {
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
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Juin (Pic / Meilleure période)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.orange},       // Juillet (Pic / Meilleure période)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Août
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.grey, 'bot': Colors.grey},     // Octobre
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
        'title': 'مستنقعات إيغ مورت الملحية 🧂',
        'pageTitle': 'مستنقعات إيغ مورت : جوهرة كامارغ',
        'introTitle': '✨ نفحة من بوليفيا (سالار دي أويوني) في جارد',
        'introText': "تتمتع ملاحات إيغ مورت بتاريخ غني يعود إلى العصور القديمة. استغلتها الإمبراطورية الرومانية وصاغت مشهد كامارغ. اليوم، توفر هذه المستنقعات مشهداً خيالياً بمياهها الوردية النابضة بالحياة، وهو عرض طبيعي مذهل.",
        'saisonsTitle': '📅 أفضل الفترات',
        'saisonHeader': 'الفترة',
        'conseilsHeader': 'التفاصيل والنصائح',
        'saisons': [
          ['🌿 منتصف يونيو', 'الفترة الموصى بها بشدة لمراقبة المياه الوردية بأفضل الظروف'],
          ['☀️ يونيو - يوليو', 'الذروة الموسمية الأساسية لاستكشاف الملاحات'],
        ],
        'horairesTitle': '⏰ أوقات العمل',
        'momentHeader': 'الفترة',
        'horairesHeader': 'الأوقات',
        'lastAdmHeader': 'آخر دخول',
        'horairesTable': [
          ['1 مارس - 31 مايو', '10:00 - 18:00', '17:00'],
          ['1 يونيو - 31 أغسطس', '9:00 - 19:00', '18:00'],
          ['1 سبتمبر - 31 أكتوبر', '10:00 - 18:00', '17:00'],
          ['1 نوفمبر - 28 فبراير', '10:00 - 17:00', '16:00'],
        ],
        'trainTitle': 'أسعار القطار الصغير (ساعة و 15 دقيقة)',
        'walkTitle': 'أسعار جولة المشي',
        'walkDesc': "المشي وفقاً لسرعتك لاستكشاف الأماكن والمناظر الطبيعية:\n- مسار نقطة إمتداظ الأسوار (حوالي 4 كم) و/أو مسار نقطة كاميل (حوالي 4 كم)\n- أو مسار 12 كم",
        'bikeTitle': 'الدراجات بحرية تامة (12 كم و 30 كم)',
        'bikeDesc': "تأجير الدراجات الكهربائية:\nاستمتع بجولة بحرية كاملة بفضل دراجاتنا الكهربائية المتوفرة في الموقع (بدون حجز مسبق، حسب التوفر).\nالسعر: 21.00 € (التأجير) + تذكرة الدخول (مسار 12 أو 30 كم).",
        'typeHeader': 'النوع',
        'priceHeader': 'السعر',
        'trainPrices': [
          ['بالغ', '14.00 €'],
          ['طفل (5-13 سنة)', '10.00 €'],
          ['طفل (3-4 سنوات)', 'مجاناً'],
          ['باقة عائلية (بالغين + طفلين)', '44.00 €'],
        ],
        'walkPrices': [
          ['بالغ', '9.60 €'],
          ['طفل (5-13 سنة)', '7.20 €'],
          ['باقة عائلية', '32.00 €'],
        ],
        'bikePrices': [
          ['بالغ (14 سنة فما فوق)', '22.30 €'],
          ['طفل (5-13 سنة)', '16.70 €'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.camera_alt, "صور موصى بها: مناظر طبيعية خلابة."],
          [Icons.train, "القطار: يُنصح بالحجز عبر الإنترنت بشدة. الحجز في الموقع محفوف بالخطر (القطار ممتلئ غالباً)."],
          [Icons.water_drop, "أحضر الماء: إمكانية وجود حرارة شديدة."],
          [Icons.directions_walk, "العربات والدراجات ثلاثية العجلات مقبولة مشياً على الأقدام."],
          [Icons.warning_amber, "تنبيه: الأوقات والأسعار قابلة للتغيير."],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل أو فترة انتقالية',
        'legendeRouge': '🔴 أحمر : ذروة الموسم وأفضل ألوان المياه الوردية',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول قبل زيارة الموقع.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['سالار دي أويوني (بوليفيا) 🇧🇴', 'أكبر مسطح ملحي في العالم، يوفر انعكاسات لا نهائية تشبه الألوان السحرية لكامارغ.'],
          ['بحيرة هيلير (أستراليا) 🇦🇺', 'بحيرة وردية ساطعة بشكل طبيعي محاطة بأشجار الأوكالبتوس، تذكرنا بالألوان المذهلة للملاحات.'],
          ['لاس كولوراداس (المكسيك) 🇲🇽', 'بحيرات وردية مذهلة بسبب التركيز الملحي العالي والكائنات الحية الدقيقة.']
        ],
        'siteInfo': {
          'titre': 'Marais Salants d\'Aigues-Mortes',
          'titreAffichage': 'مستنقعات إيغ الملحية - كامارغ',
          'image': 'assets/images/16.jpg',
          'typeAcces': 'دخول حر / ملاحات كامارغ',
          'histoire': 'تتمتع ملاحات إيغ مورت بتاريخ غني يعود إلى العصور القديمة. استغلتها الإمبراطورية الرومانية وصاغت مشهد كامارغ. اليوم، توفر هذه المستنقعات مشهداً خيالياً بمياهها الوردية النابضة بالحياة.',
          'photosVerticales': [
            'assets/images/14.jpg',
            'assets/images/15.jpg',
            'assets/images/17.jpg',
            'assets/images/18.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Aigues-Mortes Salt Marshes 🧂',
        'pageTitle': 'Aigues-Mortes Salt Marshes : Camargue Gem',
        'introTitle': '✨ A touch of Bolivia (Salar de Uyuni) in the Gard',
        'introText': "The salt marshes of Aigues-Mortes have a rich history dating back to antiquity. Already exploited by the Romans, they shaped the Camargue landscape. Today, these marshes offer an unreal landscape with their vibrant pink waters, a striking natural spectacle.",
        'saisonsTitle': '📅 Best Periods',
        'saisonHeader': 'Period',
        'conseilsHeader': 'Details & Tips',
        'saisons': [
          ['🌿 Mid-June', 'Strongly recommended period to observe pink waters in the best conditions'],
          ['☀️ June - July', 'Essential seasonal peak to explore the salt pans'],
        ],
        'horairesTitle': '⏰ Opening Hours',
        'momentHeader': 'Period',
        'horairesHeader': 'Hours',
        'lastAdmHeader': 'Last Adm.',
        'horairesTable': [
          ['Mar 1 - May 31', '10 AM - 6 PM', '5 PM'],
          ['Jun 1 - Aug 31', '9 AM - 7 PM', '6 PM'],
          ['Sep 1 - Oct 31', '10 AM - 6 PM', '5 PM'],
          ['Nov 1 - Feb 28', '10 AM - 5 PM', '4 PM'],
        ],
        'trainTitle': 'Little Train Prices (1h15)',
        'walkTitle': 'Walking Tour Prices',
        'walkDesc': "Walk at your own pace to explore places and landscapes:\n- Ramparts viewpoint trail (approx. 4 km) and/or Camelle viewpoint trail (approx. 4 km)\n- Or 12 km trail",
        'bikeTitle': 'Free Ride Bikes (12 km & 30 km)',
        'bikeDesc': "ELECTRIC BIKE RENTAL\nEnjoy complete freedom with our electric bikes available on site (no reservation, subject to availability).\nPrice: €21.00 (rental) + entry (12 or 30 km trail).",
        'typeHeader': 'Type',
        'priceHeader': 'Price',
        'trainPrices': [
          ['Adult', '14.00 €'],
          ['Child (5-13 yrs)', '10.00 €'],
          ['Child (3-4 yrs)', 'Free'],
          ['Family Package (2 ad. + 2 ch.)', '44.00 €'],
        ],
        'walkPrices': [
          ['Adult', '9.60 €'],
          ['Child (5-13 yrs)', '7.20 €'],
          ['Family Package', '32.00 €'],
        ],
        'bikePrices': [
          ['Adult (14 yrs +)', '22.30 €'],
          ['Child (5-13 yrs)', '16.70 €'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.camera_alt, "Recommended photos: breathtaking landscapes."],
          [Icons.train, "Train: Strongly recommend booking online. On-site is risky (train often full)."],
          [Icons.water_drop, "Bring water: strong heat possible."],
          [Icons.directions_walk, "Strollers and tricycles accepted on foot."],
          [Icons.warning_amber, "Note: hours/prices subject to change."],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds or transitional period',
        'legendeRouge': '🔴 Red: Peak season and best pink water colors',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Please check weather conditions and access rules before visiting the site.',
        'histoireLabel': 'Detailed History & Background',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Salar de Uyuni (Bolivia) 🇧🇴', 'The largest salt flat in the world, offering infinite reflections similar to the magical hues of Camargue.'],
          ['Lake Hillier (Australia) 🇦🇺', 'A naturally bright pink lake surrounded by eucalyptus trees, reminiscent of the spectacular hues of the salt pans.'],
          ['Las Coloradas (Mexico) 🇲🇽', 'Impressive pink lagoons due to high salinity and micro-organisms.']
        ],
        'siteInfo': {
          'titre': 'Marais Salants d\'Aigues-Mortes',
          'titreAffichage': 'Aigues-Mortes Salt Marshes - Camargue',
          'image': 'assets/images/16.jpg',
          'typeAcces': 'Free access / Camargue Salt Pans',
          'histoire': "The salt marshes of Aigues-Mortes have a rich history dating back to antiquity. Already exploited by the Romans, they shaped the Camargue landscape. Today, these marshes offer an unreal landscape with their vibrant pink waters.",
          'photosVerticales': [
            'assets/images/14.jpg',
            'assets/images/15.jpg',
            'assets/images/17.jpg',
            'assets/images/18.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Marais Salants 🧂',
        'pageTitle': 'Marais Salants d’Aigues-Mortes',
        'introTitle': '✨ Un air de Bolivie (Salar de Uyuni) dans le Gard',
        'introText': "Les salins d'Aigues-Mortes ont une histoire riche remontant à l'Antiquité. Déjà exploités par les Romains, ils ont façonné le paysage camarguais. Aujourd'hui, ces marais offrent un paysage irréel avec leurs eaux roses éclatantes, un spectacle naturel saisissant.",
        'saisonsTitle': '📅 Meilleures périodes',
        'saisonHeader': 'Période',
        'conseilsHeader': 'Détails & Conseils',
        'saisons': [
          ['🌿 Mi-juin', 'Période vivement conseillée afin d’observer les eaux roses dans les meilleures conditions'],
          ['☀️ Juin - Juillet', 'Pic de saison incontournable pour explorer les salins'],
        ],
        'horairesTitle': '⏰ Horaires d\'ouverture',
        'momentHeader': 'Période',
        'horairesHeader': 'Horaires',
        'lastAdmHeader': 'Dernière adm.',
        'horairesTable': [
          ['1 Mars - 31 Mai', '10h - 18h', '17h'],
          ['1 Juin - 31 Août', '9h - 19h', '18h'],
          ['1 Sept - 31 Oct', '10h - 18h', '17h'],
          ['1 Nov - 28 Fév', '10h - 17h', '16h'],
        ],
        'trainTitle': 'Tarifs Petit Train (1h15)',
        'walkTitle': 'Tarifs Balade à Pied',
        'walkDesc': "À pied avec votre rythme pour profiler endroits et paysages :\n- Parcours point de vue Remparts (environ 4 kms) et/ou parcours point de vue Camelle (environ 4 kms)\n- Ou parcours 12 kms",
        'bikeTitle': 'Vélo en liberté (12 km et 30 km)',
        'bikeDesc': "LOCATION DE VÉLO ÉLECTRIQUE\nProfitez d'une balade en toute liberté grâce à nos vélos électriques disponibles sur place (sans réservation, selon disponibilité).\nTarif : 21,00 € (location) + entrée (parcours 12 ou 30 km).",
        'typeHeader': 'Type',
        'priceHeader': 'Prix',
        'trainPrices': [
          ['Adulte', '14,00 €'],
          ['Enfant (5-13 ans)', '10,00 €'],
          ['Enfant (3-4 ans)', 'Gratuit'],
          ['Forfait Famille (2 ad. + 2 enf.)', '44,00 €'],
        ],
        'walkPrices': [
          ['Adulte', '9,60 €'],
          ['Enfant (5-13 ans)', '7,20 €'],
          ['Forfait Famille', '32,00 €'],
        ],
        'bikePrices': [
          ['Adulte (14 ans +)', '22,30 €'],
          ['Enfant (5-13 ans)', '16,70 €'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.camera_alt, "Photos recommandées : paysages à couper le souffle."],
          [Icons.train, "Train : Réservez vivement en ligne. Sur place, c'est risqué (train souvent complet)."],
          [Icons.water_drop, "Prévoyez de l'eau : forte chaleur possible."],
          [Icons.directions_walk, "Poussettes et tricycles acceptés à pied."],
          [Icons.warning_amber, "Attention : horaires/prix sujets à changement."],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Couleurs maximales (Eaux roses éclatantes)',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez la météo ainsi que les conditions d\'accès avant de visiter le site.',
        'histoireLabel': 'Histoire et récit détaillé',
        'similarPlacesTitle': '🌍 Endroits similaires aux Marais Salants dans le monde',
        'similarPlaces': [
          ['Salar de Uyuni (Bolivie) 🇧🇴', 'Le plus grand désert de sel au monde, offrant des reflets infinis semblables aux teintes magiques de Camargue.'],
          ['Lac Hillier (Australie) 🇦🇺', 'Un lac naturellement rose vif entouré d’eucalyptus, rappelant les teintes spectaculaires des salins.'],
          ['Las Coloradas (Mexique) 🇲🇽', 'Des lagunes roses impressionnantes dues à la concentration saline et aux micro-organismes.']
        ],
        'siteInfo': {
          'titre': 'Marais Salants d\'Aigues-Mortes',
          'titreAffichage': 'Marais Salants - Aigues-Mortes',
          'image': 'assets/images/16.jpg',
          'typeAcces': 'Accès libre / Salins de Camargue',
          'histoire': "Les salins d'Aigues-Mortes ont une histoire riche remontant à l'Antiquité. Déjà exploités par les Romains, ils ont façonné le paysage camarguais. Aujourd'hui, ces marais offrent un paysage irréel avec leurs eaux roses éclatantes, un spectacle naturel saisissant.",
          'photosVerticales': [
            'assets/images/14.jpg',
            'assets/images/15.jpg',
            'assets/images/17.jpg',
            'assets/images/18.jpg',
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
    final siteInfo = data['siteInfo'] as Map<String, dynamic>;

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
                                overflow: TextOverflow.ellipsis,
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
                      siteInfo['image'],
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
                          siteInfo['titreAffichage'],
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
                            siteInfo['typeAcces'],
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
                          siteInfo['histoire'],
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
                      onPressed: () => _openMap(siteInfo['titre']),
                      icon: const Icon(Icons.map, size: 18),
                      label: Text(
                        data['mapsLabel'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 4. ENDROITS SIMILAIRES (Drapeaux préservés avec attention[cite: 13])
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

                  // 5. MEILLEURES SAISONS (TABLEAU)
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

                  // 6. HORAIRES D'OUVERTURE (TABLEAU)
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
                          children: [
                            _buildTableRow([data['momentHeader'], data['horairesHeader'], data['lastAdmHeader']], isHeader: true, hColor: _currentColor),
                            ...((data['horairesTable'] as List).map((h) => _buildTableRow([h[0], h[1], h[2]]))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 7. TARIFS PETIT TRAIN
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
                          data['trainTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          children: [
                            _buildTableRow([data['typeHeader'], data['priceHeader']], isHeader: true, hColor: _currentColor),
                            ...((data['trainPrices'] as List).map((p) => _buildTableRow([p[0], p[1]]))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 8. TARIFS BALADE À PIED
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
                          data['walkTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          children: [
                            _buildTableRow([data['typeHeader'], data['priceHeader']], isHeader: true, hColor: _currentColor),
                            ...((data['walkPrices'] as List).map((p) => _buildTableRow([p[0], p[1]]))),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data['walkDesc'],
                          style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 9. VÉLO EN LIBERTÉ
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
                          data['bikeTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          children: [
                            _buildTableRow([data['typeHeader'], data['priceHeader']], isHeader: true, hColor: _currentColor),
                            ...((data['bikePrices'] as List).map((p) => _buildTableRow([p[0], p[1]]))),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data['bikeDesc'],
                          style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 10. CALENDRIER D'AFFLUENCE ET DE SAISONNALITÉ
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

                  // 11. INFOS PRATIQUES
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

                  // 12. GALERIE PHOTOS VERTICALES
                  Column(
                    children: [
                      _buildGalleryImage('assets/images/14.jpg'),
                      _buildGalleryImage('assets/images/15.jpg'),
                      _buildGalleryImage('assets/images/17.jpg'),
                      _buildGalleryImage('assets/images/18.jpg'),
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
          color: isHeader ? (hColor ?? const Color(0xFFF1C40F)) : Colors.white70,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.7), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, height: 1.4))),
        ],
      ),
    );
  }
}