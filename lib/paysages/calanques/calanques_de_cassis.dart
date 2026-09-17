import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CalanquesDeCassisPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const CalanquesDeCassisPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<CalanquesDeCassisPage> createState() => _CalanquesDeCassisPageState();
}

class _CalanquesDeCassisPageState extends State<CalanquesDeCassisPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant CalanquesDeCassisPage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Février
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Mars
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Avril
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Mai
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Septembre
      {'top': Colors.orange, 'mid': Colors.grey, 'bot': Colors.grey},     // Octobre
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Décembre
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
        'title': 'كالانك كاسي 🌊',
        'pageTitle': 'كالانك كاسي : جوهرة المتوسط',
        'introTitle': '🇫🇷 تاريخ وجمال كالانك كاسي',
        'introText': 'تقع كالانك كاسي في قلب خليج كاسي بالجنوب الفرنسي، وتوفر مناظر طبيعية خلابة تتميز بمنحدرات جيرية بيضاء شاهقة ومياه فيروزية صافية. يتطلب استكشاف هذه العجائب الطبيعية الساحلية حذاء مشي مناسباً للدروب الصخرية.',
        'translationsTitle': 'معاني الكلمات (البروفنسالية / المحلية)',
        'translations': [
          ['خَلَج', 'خليج صخري عميق'],
          ['كشمش أسود', 'صخرة / جرف ساحلي'],
          ['وغد', 'القمة الصخرية العالية'],
        ],
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'الأجواء والألوان',
        'saisons': [
          ['🌱 الربيع', 'مثالي، درجات حرارة معتدلة وطبيعة مزهرة'],
          ['🍂 الخريف', 'رائع، عدد أقل من الحشود ومياه دافئة'],
          ['☀️ الصيف', 'حرارة عالية، قيود وازدحام شديد في الموقع'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ الصباح', 'قبل الساعة 8 صباحاً للحصول على الهدوء والموقف'],
          ['☀️ منتصف النهار', 'يُنصح بتجنبه بسبب الحرارة الشديدة والشمس'],
          ['🌅 المساء', 'ضوء ساحر وغروب مميز على المنحدرات البيضاء'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.map_outlined, "تقع في كاسي (بوش دو رون)"],
          [Icons.directions_walk, "نزهة ومشي لمدة ساعتين إلى 4 ساعات"],
          [Icons.photo_camera, "الكاميرا: التقاط صور الخلجان الفيروزية"],
          [Icons.water_drop, "إحضار كمية كافية من الماء (لا توجد نوافير)"],
          [Icons.landscape, "مسار صخري جيري يحتاج حذاء مناسباً"],
          [Icons.flag_outlined, "محمية كالانك الوطنية البرية والبحرية"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول ومخاطر الحرائق صيفاً.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الزوار والحرارة الصيفية',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول إلى المسارات للحد من مخاطر الحرائق صيفاً.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['كريك ستينيفا (جزيرة فيس، كرواتيا) 🇭🇷', 'شاطئ معزول ومخفي بين منحدرات صخرية ضيقة ومياه فيروزية ساحرة.'],
          ['زاكينثوس - نافاجو (اليونان) 🇬🇷', 'تشتهر بمنحدراتها البيضاء الشاهقة وخليجها المعزول ذي المياه الفيروزية الساطعة.'],
          ['كالا غولوريتزي (ساردينيا، إيطاليا) 🇮🇹', 'شاطئ جنوني مخفي عند سفح المنحدرات الجيرية الشديدة مع مياه بلورية صافية.']
        ],
        'cassisInfo': {
          'titre': 'Calanques de Cassis',
          'titreAffichage': 'Calanques de Cassis - الجوهرة الجيرية',
          'image': 'assets/image/35.jpg',
          'typeAcces': 'دخول حر / تنظيم وإرشادات بيئية',
          'histoire': 'تعد كالانك كاسي واحدة من أروع التحف الطبيعية في فرنسا. نحتت الطبيعة هذه الفجوات المائية الشاهقة بين المنحدرات الكلسية البيضاء على مدى ملايين السنين، لتوفر مشاهد درامية تلتقي فيها الجبال بالبحر المتوسط.',
          'saviezVous': 'هل تعلم أن كالانك كاسي تطل على كاب كاناي (Cap Canaille)، والذي يُعد أعلى جرف بحري صخري في فرنسا بارتفاع يصل إلى 394 متراً!',
          'photoAstuce': 'التقط أفضل الصور من المرتفعات المطلة على الخلجان في الصباح الباكر لالتقاط انعكاس أشعة الشمس على المياه الفيروزية الجذابة.',
          'photosVerticales': [
            'assets/image/34.webp',
            'assets/image/37.webp',
            'assets/image/38.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Cassis Calanques 🌊',
        'pageTitle': 'Cassis Calanques : Jewel of the Sea',
        'introTitle': '🇫🇷 History & Beauty of Cassis Calanques',
        'introText': "Located near the charming port of Cassis, the Cassis Calanques feature spectacular white limestone cliffs plunging into crystal-clear turquoise waters. Proper hiking shoes are recommended to explore these natural wonders.",
        'translationsTitle': 'Provençal Word Meanings',
        'translations': [
          ['Coves', 'Deep rocky cove'],
          ['Cassis', 'Coastal rock / stone cliff'],
          ['Rascal', 'High cliff summit'],
        ],
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Ambience & Colors',
        'saisons': [
          ['🌱 Spring', 'Ideal, mild temperatures and blooming nature'],
          ['🍂 Autumn', 'Magnificent, fewer crowds and warm sea'],
          ['☀️ Summer', 'High heat, busy access and strict fire rules'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Morning', 'Before 8 AM for easy parking and tranquil trails'],
          ['☀️ Noon', 'Avoid hiking during intense midday sun'],
          ['🌅 Evening', 'Golden light and sunset on the limestone cliffs'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.map_outlined, "Located in Cassis (Bouches-du-Rhône)"],
          [Icons.directions_walk, "Hike of about 2h to 4h"],
          [Icons.photo_camera, "Camera: Take turquoise bay photos"],
          [Icons.water_drop, "Bring plenty of water (no taps on trails)"],
          [Icons.landscape, "Limestone trail: sturdy shoes required"],
          [Icons.flag_outlined, "Calanques National Park reserve"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions and fire access regulations in summer.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution or early arrival advised',
        'legendeRouge': '🔴 Red: Peak visitors and summer heat',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Please check weather conditions and summer fire access restrictions before hiking.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Stiniva Cove (Vis Island, Croatia) 🇭🇷', 'A secluded pebble beach hidden behind steep cliff walls with crystal clear waters.'],
          ['Zakynthos - Navagio (Greece) 🇬🇷', 'Famous for its sheer white cliffs and stunning secluded cove with vibrant turquoise waters.'],
          ['Cala Goloritzè (Sardinia, Italy) 🇮🇹', 'A pristine paradise beach nestled at the foot of dramatic limestone cliffs.']
        ],
        'cassisInfo': {
          'titre': 'Calanques de Cassis',
          'titreAffichage': 'Cassis Calanques - Mediterranean Jewel',
          'image': 'assets/image/35.jpg',
          'typeAcces': 'Free access / National Park regulations',
          'histoire': "The Calanques of Cassis are among the most impressive coastal features in France. Sculpted by marine erosion and time into sheer white limestone fjords, they display dazzling contrast between high cliffs and deep blue waters.",
          'saviezVous': "Did you know that Cassis borders Cap Canaille, one of the highest sea cliffs in Europe at 394 meters high!",
          'photoAstuce': "Take photos early in the morning from the cliff viewpoints to highlight the brilliant turquoise color of the sea.",
          'photosVerticales': [
            'assets/image/34.webp',
            'assets/image/37.webp',
            'assets/image/38.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Calanques de Cassis 🌊',
        'pageTitle': 'Calanques de Cassis : Joyau Méditerranéen',
        'introTitle': '🇫🇷 Histoire et beauté des Calanques de Cassis',
        'introText': "Nichées à proximité du port de Cassis, les Calanques de Cassis offrent des fjords spectaculaires façonnés dans le calcaire blanc, plongeant dans une eau turquoise limpide. Une bonne paire de chaussures est indispensable pour parcourir ces sentiers préservés.",
        'translationsTitle': 'Traductions provençales',
        'translations': [
          ['Calanque', 'Crique / Vallon emboîté'],
          ['Cassis', 'Rocher / Cavité littorale'],
          ['Canaille', 'Haute falaise / Cap marin'],
        ],
        'saisonsTitle': '📅 Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Ambiance & Couleurs',
        'saisons': [
          ['🌱 Printemps', 'Idéal, températures douces et végétation en fleur'],
          ['🍂 Automne', 'Superbe, moins de foule et eau encore chaude'],
          ['☀️ Été', 'Forte chaleur, accès réglementé selon météo'],
        ],
        'horairesTitle': '⏰ Horaires conseillés',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Matin', 'Avant 8h pour la tranquillité et se garer facilement'],
          ['☀️ Midi', 'À éviter en plein soleil sur le calcaire réchauffé'],
          ['🌅 Soir', 'Lumière dorée magnifique sur les falaises blanches'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.map_outlined, "Situé à Cassis (Bouches-du-Rhône)"],
          [Icons.directions_walk, "Randonnée d'environ 2h à 4h"],
          [Icons.photo_camera, "Camera : Prendre les eaux turquoise en photo"],
          [Icons.water_drop, "Prendre beaucoup d'eau (aucun point d'eau)"],
          [Icons.landscape, "Sentier calcaire : chaussures de marche requises"],
          [Icons.flag_outlined, "Parc National des Calanques"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez la météo et l’accès au massif (risques d’incendie en été).',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Chaleur estivale',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez les conditions météo et la réglementation d’accès au massif avant votre visite.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires aux Calanques de Cassis dans le monde',
        'similarPlaces': [
          ['Crique de Stiniva (Île de Vis, Croatie) 🇭🇷', 'Une crique spectaculaire et isolée enserrée entre d\'immenses falaises de roche.'],
          ['Plage de Navagio (Zakynthos, Grèce) 🇬🇷', 'Célèbre pour ses falaises blanches vertigineuses et sa crique aux eaux turquoise.'],
          ['Cala Goloritzè (Sardaigne, Italie) 🇮🇹', 'Une plage paradisiaque cachée au pied de falaises calcaires avec des eaux cristallines.']
        ],
        'cassisInfo': {
          'titre': 'Calanques de Cassis',
          'titreAffichage': 'Les Calanques de Cassis - Joyau Provençal',
          'image': 'assets/image/35.jpg',
          'typeAcces': 'Accès libre / Réglementation du Parc National',
          'histoire': "Les Calanques de Cassis constituent l'un des sites naturels les plus impressionnants de France. Façonnées par l'érosion marine et calcaire au fil des millénaires, elles offrent un paysage grandiose de falaises blanches plongeant directement dans des eaux turquoise.",
          'saviezVous': "Saviez-vous que Cassis abrite le Cap Canaille, l’une des plus hautes falaises maritimes d’Europe avec ses 394 mètres d’altitude !",
          'photoAstuce': "Privilégiez une prise de vue en matinée depuis les hauts sentiers pour capturer la clarté éclatante de l'eau turquoise.",
          'photosVerticales': [
            'assets/image/34.webp',
            'assets/image/37.webp',
            'assets/image/38.jpg',
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
    final cassisInfo = data['cassisInfo'] as Map<String, dynamic>;
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
                      cassisInfo['image'],
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
                          cassisInfo['titreAffichage'],
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
                            cassisInfo['typeAcces'],
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
                          cassisInfo['histoire'],
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
                      onPressed: () => _openMap(cassisInfo['titre']),
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
                          cassisInfo['saviezVous'],
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
                          cassisInfo['photoAstuce'],
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
                      _buildGalleryImage('assets/image/34.webp'),
                      _buildGalleryImage('assets/image/37.webp'),
                      _buildGalleryImage('assets/image/38.jpg'),
                      _buildGalleryImage('assets/image/35.jpg'),
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
          Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15)),
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