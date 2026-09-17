import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class GorgesDuFierPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const GorgesDuFierPage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFF2E5A88),
  });

  @override
  State<GorgesDuFierPage> createState() => _GorgesDuFierPageState();
}

class _GorgesDuFierPageState extends State<GorgesDuFierPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant GorgesDuFierPage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.orange},   // Mars
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Avril
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Mai
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.red, 'mid': Colors.orange, 'bot': Colors.orange},    // Septembre
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
        'title': 'الجيوب الضيقة لنهر فييه 🌊',
        'pageTitle': 'مضائق فير : كامينيتو ديل ري في هاوت سافوا',
        'introTitle': '🇪🇸 "كامينيتو ديل ري" الخاصة بهاوت سافوا',
        'introText': "تجربة مذهلة تذكرنا بمضائق ملقة الشهيرة. امشِ فوق نهر فير على ممرات معلقة وأعجب بعمل التآكل على صخور الحجر الجيري.",
        'translationsTitle': 'المفاهيم والتشابهات',
        'translations': [
          ['الأودية', 'مضائق / أخدود ضيق'],
          ['فخور', 'اسم النهر المحلي'],
          ['جسر', 'جسر معلق على الصخر'],
        ],
        'saisonsTitle': '📅 الموسم والأوقات',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'التفاصيل والافتتاح',
        'saisons': [
          ['🗓️ الافتتاح', 'من منتصف مارس إلى منتصف أكتوبر'],
          ['⏰ الصباح', '9:30 صباحاً - 12:00 ظهراً (موصى به)'],
          ['🕓 بعد الظهر', '2:00 عصراً - 6:00 مساءً'],
        ],
        'horairesTitle': '⏰ الأسعار التقديرية',
        'momentHeader': 'نوع',
        'horaires': [
          ['🎟️ الدخول', '6 يورو (يرجى ملاحظة أن الأسعار قد تتغير)'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.camera_alt, "يوصى بشدة بالتعامل مع الكاميرا"],
          [Icons.euro_symbol, "السعر 6 يورو: قابل للتغيير"],
          [Icons.warning_amber_rounded, "ممرات ضيقة (اتجاه واحد)"],
          [Icons.explore, "تذكير: يشبه كامينيتو ديل ري وكانيونات كولورادو"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام وفترات الزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: مواسم الفتح محددة بدقة.',
        'legendeVert': '🟢 أخضر: فترة هادئة',
        'legendeOrange': '🟠 برتقالي: ازدحام معتدل',
        'legendeRouge': '🔴 أحمر: موسم الذروة / الصيف',
        'legendeGris': '⚪ رمادي: مغلق / خارج الموسم',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: تحقق من أوقات العمل والأسعار الحالية قبل زيارتك.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم (خارج فرنسا)',
        'similarPlaces': [
          ['كامينيتو ديل ري (مالقة، إسبانيا) 🇪🇸', 'ممرات معلقة مذهلة مثبتة على جدران الصخور فوق المضائق المائية العميقة.'],
          ['مضيق أريزيس (سويسرا) 🇨🇭', 'مسار خشبي معلق يقطع مضائق نهرية ضيقة ومذهلة في قلب الطبيعة السويسرية.'],
          ['مضيق بارتاخ (باڤاريا، ألمانيا) 🇩🇪', 'ممر مائي ضيق ومذهل منحوت داخل الصخور الشاهقة، يتيح تجربة مشي فريدة.']
        ],
        'siteInfo': {
          'titre': 'Gorges du Fier Annecy',
          'titreAffichage': 'Gorges du Fier - Le Caminito Savoyard',
          'image': 'assets/images/gorges-du-fier-annecy-4-768x960.jpg',
          'typeAcces': 'هاوت سافوا / أنسي',
          'histoire': 'تم نحت مضائق فير بواسطة التآكل المائي المستمر على مدار آلاف السنين. تعتبر الممرات المعلقة المنحوتة في الصخور تجربة فريدة للمشي فوق المياه.',
          'saviezVous': 'هل تعلم أن ممرات مضائق فير اُفتتحت للجمهور منذ عام 1869 وتعتبر واحدة من أقدم المواقع السياحية المهيأة في المنطقة.',
          'photoAstuce': 'فضل التصوير في منتصف النهار عندما تتخلل أشعة الشمس الصخور لتضيء المياه الفيروزية بالأسفل.',
          'photosVerticales': [
            'assets/images/gorges-du-fier-annecy-14-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-2-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-8-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-12.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Fier Gorges 🌊',
        'pageTitle': 'Gorges du Fier: Haute-Savoie Canyon',
        'introTitle': '🇪🇸 The Haute-Savoie "Caminito del Rey"',
        'introText': "A dizzying experience reminiscent of the famous gorges of Malaga. Walk above the Fier on suspended footbridges and admire the work of erosion on the limestone rock.",
        'translationsTitle': 'Concepts & Similarities',
        'translations': [
          ['Throats', 'Narrow Canyons / Gorges'],
          ['Proud', 'Local River Name'],
          ['Footbridge', 'Suspended bridge to the rock'],
        ],
        'saisonsTitle': '📅 Season & Hours',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Details & Openings',
        'saisons': [
          ['🗓️ Opening', 'Mid-March to mid-October'],
          ['⏰ Morning', '9:30 AM - 12:00 PM (Recommended)'],
          ['🕓 Afternoon', '2:00 PM - 6:00 PM'],
        ],
        'horairesTitle': '⏰ Indicative Prices',
        'momentHeader': 'Type',
        'horaires': [
          ['🎟️ Admission', '€6 (note prices may change)'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.camera_alt, "Camera strongly recommended"],
          [Icons.euro_symbol, "Price €6: subject to change"],
          [Icons.warning_amber_rounded, "Narrow footbridges (one-way)"],
          [Icons.explore, "Reminder: resembles Caminito del Rey and Colorado canyons"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Specific opening periods.',
        'legendeVert': '🟢 Green: Calm period',
        'legendeOrange': '🟠 Orange: Moderate crowds',
        'legendeRouge': '🔴 Red: High season / Summer',
        'legendeGris': '⚪ Grey: Closed / Off-season',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Check current opening hours and conditions before visiting.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World (Outside France)',
        'similarPlaces': [
          ['Caminito del Rey (Malaga, Spain) 🇪🇸', 'Spectacular suspended footbridges fixed along steep cliff walls over deep gorges.'],
          ['Aareschucht / Aare Gorge (Switzerland) 🇨🇭', 'Dizzying wooden footbridge cutting through narrow limestone rock canyons.'],
          ['Partnach Gorge (Bavaria, Germany) 🇩🇪', 'A dramatic narrow canyon carved by water with galleries carved straight into the rock.']
        ],
        'siteInfo': {
          'titre': 'Gorges du Fier Annecy',
          'titreAffichage': 'Gorges du Fier - Savoyard Caminito',
          'image': 'assets/images/gorges-du-fier-annecy-4-768x960.jpg',
          'typeAcces': 'Haute-Savoie / Annecy',
          'histoire': "Carved by water erosion over thousands of years, the Gorges du Fier offer an impressive natural spectacle with walkways suspended high above the riverbed.",
          'saviezVous': "Did you know that the footbridges of the Gorges du Fier opened to the public in 1869, making it one of the oldest natural tourist sites in the region.",
          'photoAstuce': "Take photos around mid-day when rays of sunlight hit the canyon bottom and illuminate the turquoise water below.",
          'photosVerticales': [
            'assets/images/gorges-du-fier-annecy-14-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-2-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-8-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-12.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Gorges du Fier 🌊',
        'pageTitle': 'Gorges du Fier : Le Caminito Savoyard',
        'introTitle': '🇪🇸 Le "Caminito del Rey" haut-savoyard',
        'introText': "Une expérience vertigineuse rappelant les célèbres gorges de Malaga. Marchez au-dessus du Fier sur des passerelles suspendues et admirez le travail de l'érosion sur la roche calcaire.",
        'translationsTitle': 'Notions & Équivalences',
        'translations': [
          ['Gorges', 'Canyons étroits / Défilé'],
          ['Fier', 'Nom de la rivière locale'],
          ['Passerelle', 'Pont suspendu à la roche'],
        ],
        'saisonsTitle': '📅 Saison & horaires',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Détails & Ouvertures',
        'saisons': [
          ['🗓️ Ouverture', 'De mi-mars à mi-octobre'],
          ['⏰ Matin', '9 h 30 - 12 h 00 (Conseillé)'],
          ['🕓 Après-midi', '14 h 00 - 18 h 00'],
        ],
        'horairesTitle': '⏰ Tarifs indicatifs',
        'momentHeader': 'Type',
        'horaires': [
          ['🎟️ Entrée', '6 € (attention les prix peuvent changer)'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.camera_alt, "Appareil photo fortement conseillé"],
          [Icons.euro_symbol, "Prix 6 € : attention peut changer"],
          [Icons.warning_amber_rounded, "Passerelles étroites (sens unique)"],
          [Icons.explore, "Rappel : ressemble au Caminito del Rey et canyons du Colorado"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Périodes d’ouverture strictes.',
        'legendeVert': '🟢 Vert : Période calme',
        'legendeOrange': '🟠 Orange : Affluence modérée',
        'legendeRouge': '🔴 Rouge : Haute saison / Été',
        'legendeGris': '⚪ Gris : Fermé / Hors saison',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez les horaires et les conditions d\'ouverture avant votre visite.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires aux Gorges du Fier dans le monde',
        'similarPlaces': [
          ['Caminito del Rey (Malaga, Espagne) 🇪🇸', 'Des passerelles suspendues spectaculaires à flanc de falaise au-dessus de gorges profondes.'],
          ['Gorges de l’Aare / Aareschlucht (Suisse) 🇨🇭', 'Une passerelle en bois vertigineuse qui serpente dans un canyon calcaire très étroit.'],
          ['Gorges de la Partnach / Partnachklamm (Bavière, Allemagne) 🇩🇪', 'Un défilé impressionnant creusé dans la roche abritant des galeries et passerelles au-dessus de l’eau.']
        ],
        'siteInfo': {
          'titre': 'Gorges du Fier Annecy',
          'titreAffichage': 'Gorges du Fier - Passerelles Suspendues',
          'image': 'assets/images/gorges-du-fier-annecy-4-768x960.jpg',
          'typeAcces': 'Annecy / Haute-Savoie',
          'histoire': "Sculptées par l'érosion au fil des millénaires, les Gorges du Fier offrent un spectacle naturel grandiose. Les passerelles fixées à flanc de rocher permettent de contempler la force de l'eau et les marmites de géants.",
          'saviezVous': "Saviez-vous que le site des Gorges du Fier est aménagé et ouvert au public depuis 1869, ce qui en fait l'un des plus anciens sites touristiques aménagés de la région.",
          'photoAstuce': "Privilégiez le milieu de journée pour vos photos, lorsque les rayons du soleil pénètrent au fond des gorges et illuminent la couleur de l'eau.",
          'photosVerticales': [
            'assets/images/gorges-du-fier-annecy-14-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-2-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-8-768x960.jpg',
            'assets/images/gorges-du-fier-annecy-12.jpg',
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
    final translationsList = data['translations'] as List;
    final photosVerticales = siteInfo['photosVerticales'] as List;

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

                  // 1. BIS - TRADUCTIONS ET NOTIONS EN FLÈCHE
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
                          siteInfo['saviezVous'],
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
                          siteInfo['photoAstuce'],
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

                  // 6. SAISONS ET HORAIRES (TABLEAU)
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

                  // 7. TARIFS INDICATIFS (TABLEAU)
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

                  // 10. GALERIE PHOTOS VERTICALES (STYLE ALTSCHLOSSFELSEN)
                  Column(
                    children: photosVerticales.map((path) => _buildGalleryImage(path)).toList(),
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
          SizedBox(
            width: 85,
            child: Text(
              ger,
              style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 14),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              fr,
              style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
        child: Text(
          cell,
          style: GoogleFonts.montserrat(
            color: isHeader ? hColor : Colors.white70,
            fontSize: 12,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
        ),
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
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}