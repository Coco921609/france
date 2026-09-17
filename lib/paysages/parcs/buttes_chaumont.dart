import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class ButtesChaumontPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const ButtesChaumontPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<ButtesChaumontPage> createState() => _ButtesChaumontPageState();
}

class _ButtesChaumontPageState extends State<ButtesChaumontPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    // Utilise la couleur du thème (par défaut Bleu Ciel 0xFF5DADE2 si passée en paramètre)
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant ButtesChaumontPage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.green},      // Février
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Avril (Printemps)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.red},    // Mai
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin (Pique-niques)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Septembre
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Octobre (Automne)
      {'top': Colors.orange, 'mid': Colors.grey, 'bot': Colors.grey},     // Novembre
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
        'title': 'حديقة بوت شومون 🦢',
        'pageTitle': 'حديقة بوت شومون',
        'introTitle': '🇮🇹 ملاذ رومانسي في باريس',
        'introText': 'محجر قديم شديد الانحدار يوفر مناظر خلابة، كهوف سرية، وبحيرة معلقة يهيمن عليها معبد سيبيل.',
        'translationsTitle': 'إلهام الموقع',
        'translations': [
          ['باريس، الدائرة 19', 'أجواء إيطالية (تيفولي)'],
        ],
        'saisonsTitle': '📅 دليل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'تفاصيل الزيارة',
        'saisons': [
          ['🍂 الخريف', 'ألوان حمراء رائعة (موصى به)'],
          ['🌱 الربيع', 'نباتات مزهرة وانتعاش'],
          ['☀️ الصيف', 'مثالي للنزهات'],
          ['❄️ الشتاء', 'تجنب: البرد والرياح القوية'],
        ],
        'horairesTitle': '🕓 الازدحام والأوقات',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ مثالي', 'في الصباح الباكر أو أواخر بعد الظهر'],
          ['👥 مزدحم', '12:00 ظهراً - 2:00 بعد الظهر وعطلات نهاية الأسبوع'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 معلومات عملية',
        'infos': [
          [Icons.wc, "حمامات: نعم"],
          [Icons.wifi, "واي فاي: نعم"],
          [Icons.child_care, "طاولة تغيير للأطفال: نعم"],
          [Icons.local_drink, "آلة بيع المشروبات: لا"],
          [Icons.pets, "حيوانات أليفة: نعم (يجب ربطها)"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'legendeVert': '🟢 أخضر : فترة هادئة ومثالية',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل',
        'legendeRouge': '🔴 أحمر : ازدحام شديد (نزهات صيفية)',
        'legendeGris': '⚪ رمادي : طقس بارد جداً',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: الحديقة شديدة الانحدار، يُنصح بارتداء أحذية مريحة. قد تُغلق في حالة الرياح القوية.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['فيلا ديستي (تيفولي، إيطاليا) 🇮🇹', 'حدائق وشلالات رائعة ألهمت معبد سيبيل.'],
          ['سنترال بارك (نيويورك، أمريكا) 🇺🇸', 'واحة حضرية ضخمة مع بحيرات وجسور متعرجة.'],
          ['بارك غويل (برشلونة، إسبانيا) 🇪🇸', 'حديقة تلية ذات إطلالات خلابة وهندسة معمارية فريدة.']
        ],
        'altInfo': {
          'titre': 'حديقة بوت-شومو',
          'titreAffichage': 'حديقة بوت شومون',
          'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
          'typeAcces': 'دخول مجاني / باريس، الدائرة 19',
          'histoire': 'تم افتتاح الحديقة في عام 1867 خلال المعرض العالمي، وبُنيت على محاجر جبس سابقة. قام نابليون الثالث والبارون هوسمان بتحويل هذه الأرض القاحلة إلى منظر طبيعي رومانسي ببحيرتها وشلالها ومعبد سيبيل.',
          'saviezVous': 'هل تعلم أن معبد سيبيل الذي يتربع على قمة الجزيرة هو نسخة من معبد فيستا في تيفولي بإيطاليا؟',
          'photoAstuce': 'يوفر شروق الشمس من معبد سيبيل إطلالة خلابة على مونمارتر وكنيسة الساكري كور.',
          'photosVerticales': [
            'assets/images/960042-parc-buttes-chaumont-automne.jpg',
            'assets/images/OIP.webp',
            'assets/images/istockphoto-1200995129-612x612.jpg',
            'assets/images/istockphoto-1206218301-612x612.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Buttes-Chaumont Park 🦢',
        'pageTitle': 'Buttes-Chaumont Park',
        'introTitle': '🇮🇹 A romantic sanctuary in Paris',
        'introText': "A steep former quarry offering spectacular views, secret grottoes, and a suspended lake dominated by the Temple of the Sibyl.",
        'translationsTitle': 'Site Inspiration',
        'translations': [
          ['Paris 19th Arr.', 'A touch of Italy (Tivoli)'],
        ],
        'saisonsTitle': '📅 Seasons Guide',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Visit Details',
        'saisons': [
          ['🍂 Autumn', 'Magnificent reddish colors (Recommended)'],
          ['🌱 Spring', 'Blooming vegetation and freshness'],
          ['☀️ Summer', 'Perfect for picnics'],
          ['❄️ Winter', 'To avoid: cold and strong winds'],
        ],
        'horairesTitle': '🕓 Crowds & Schedules',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Ideal', 'Early morning or late afternoon'],
          ['👥 Crowded', '12:00 PM - 2:00 PM and Weekends'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Practical Info',
        'infos': [
          [Icons.wc, "Restrooms: Yes"],
          [Icons.wifi, "WIFI: Yes"],
          [Icons.child_care, "Changing table: Yes"],
          [Icons.local_drink, "Vending machine: No"],
          [Icons.pets, "Pets: Yes (leash mandatory)"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions as the park may close during strong winds.',
        'legendeVert': '🟢 Green: Quiet and ideal period',
        'legendeOrange': '🟠 Orange: Moderate crowds',
        'legendeRouge': '🔴 Red: Very crowded (summer picnics)',
        'legendeGris': '⚪ Grey: Too cold or bad weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: The park is very steep, comfortable shoes are recommended. May close during high winds.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Villa d\'Este (Tivoli, Italy) 🇮🇹', 'Magnificent gardens and waterfalls that inspired the Temple of the Sibyl.'],
          ['Central Park (New York, USA) 🇺🇸', 'A massive urban oasis with winding lakes and bridges.'],
          ['Park Güell (Barcelona, Spain) 🇪🇸', 'A hilly park with spectacular city views and unique architecture.']
        ],
        'altInfo': {
          'titre': 'Parc des Buttes-Chaumont',
          'titreAffichage': 'Parc des Buttes-Chaumont',
          'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
          'typeAcces': 'Free access / Paris 19th Arrondissement',
          'histoire': "Inaugurated in 1867 during the Universal Exhibition, the park was built on former gypsum quarries. Napoleon III and Baron Haussmann transformed this barren land into a romantic landscape with its lake, waterfall, and the Temple of the Sibyl.",
          'saviezVous': "Did you know that the Temple of the Sibyl, which crowns the belvedere island, is a copy of the Temple of Vesta in Tivoli, Italy?",
          'photoAstuce': "Sunrise from the Temple of the Sibyl offers a breathtaking view over Montmartre and the Sacré-Cœur.",
          'photosVerticales': [
            'assets/images/960042-parc-buttes-chaumont-automne.jpg',
            'assets/images/OIP.webp',
            'assets/images/istockphoto-1200995129-612x612.jpg',
            'assets/images/istockphoto-1206218301-612x612.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Parc des Buttes-Chaumont 🦢',
        'pageTitle': 'Parc des Buttes-Chaumont',
        'introTitle': '🇮🇹 Un sanctuaire romantique à Paris',
        'introText': "Une ancienne carrière escarpée offrant des vues spectaculaires, des grottes secrètes et un lac suspendu dominé par le Temple de la Sybille.",
        'translationsTitle': 'Inspiration du lieu',
        'translations': [
          ['Paris 19ème', 'Un air d\'Italie (Tivoli)'],
        ],
        'saisonsTitle': '📅 Guide des saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Détails de visite',
        'saisons': [
          ['🍂 Automne', 'Couleurs rougeâtres magnifiques (Recommandé)'],
          ['🌱 Printemps', 'Végétation fleurie et fraîcheur'],
          ['☀️ Été', 'Parfait pour les pique-niques'],
          ['❄️ Hiver', 'À éviter : froid et vents violents'],
        ],
        'horairesTitle': '🕓 Affluence & Horaires',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Idéal', 'Tôt le matin ou fin d\'après-midi'],
          ['👥 Chargé', '12h00 - 14h00 et Week-ends'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Infos pratiques',
        'infos': [
          [Icons.wc, "Toilettes : Oui"],
          [Icons.wifi, "WIFI : Oui"],
          [Icons.child_care, "Table à langer : Oui"],
          [Icons.local_drink, "Distributeur : Non"],
          [Icons.pets, "Animaux : Oui (laisse obligatoire)"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Le parc peut fermer en cas de vents violents.',
        'legendeVert': '🟢 Vert : Période idéale et calme',
        'legendeOrange': '🟠 Affluence modérée (beaux jours)',
        'legendeRouge': '🔴 Forte affluence (pique-niques estivaux)',
        'legendeGris': '⚪ Basse saison / Météo froide',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Le parc est très escarpé, prévoyez de bonnes chaussures. Fermeture possible en cas d\'intempéries.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires à travers le monde',
        'similarPlaces': [
          ['Villa d\'Este (Tivoli, Italie) 🇮🇹', 'Jardins magnifiques et cascades qui ont inspiré le temple de la Sibylle.'],
          ['Central Park (New York, États-Unis) 🇺🇸', 'Une immense oasis urbaine vallonnée avec ses lacs et ses ponts romanesques.'],
          ['Parc Güell (Barcelone, Espagne) 🇪🇸', 'Un parc en hauteur offrant des vues spectaculaires sur la ville et une architecture unique.']
        ],
        'altInfo': {
          'titre': 'Parc des Buttes-Chaumont',
          'titreAffichage': 'Parc des Buttes-Chaumont',
          'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
          'typeAcces': 'Accès libre / Paris 19ème, France',
          'histoire': "Inauguré en 1867 lors de l'Exposition universelle, le parc a été aménagé sur d'anciennes carrières de gypse. Napoléon III et le baron Haussmann ont transformé ce terrain aride en un paysage romantique avec son lac, sa cascade et le temple de la Sibylle.",
          'saviezVous': "Saviez-vous que le temple de la Sibylle, qui culmine sur l'île du belvédère, est une copie du temple de Vesta situé à Tivoli en Italie ?",
          'photoAstuce': "Le lever du soleil depuis le Temple de la Sibylle offre une vue imprenable et féérique sur Montmartre et le Sacré-Cœur.",
          'photosVerticales': [
            'assets/images/960042-parc-buttes-chaumont-automne.jpg',
            'assets/images/OIP.webp',
            'assets/images/istockphoto-1200995129-612x612.jpg',
            'assets/images/istockphoto-1206218301-612x612.jpg',
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

                  // 1. BIS - INSPIRATIONS EN FLÈCHE
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
                    children: (altInfo['photosVerticales'] as List<String>).map((path) {
                      return _buildGalleryImage(path);
                    }).toList(),
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

  Widget _buildTranslationLine(String word, String analogy, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(word, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(analogy, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15))),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.7), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}