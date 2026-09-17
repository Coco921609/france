import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class CalanqueDeSugitonPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const CalanqueDeSugitonPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<CalanqueDeSugitonPage> createState() => _CalanqueDeSugitonPageState();
}

class _CalanqueDeSugitonPageState extends State<CalanqueDeSugitonPage> {
  late Color _currentColor;
  late String _currentLang;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLang = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant CalanqueDeSugitonPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.themeColor != widget.themeColor) {
      setState(() {
        _currentColor = widget.themeColor;
      });
    }
  }

  void _toggleLanguage() {
    setState(() {
      if (_currentLang == 'fr') {
        _currentLang = 'en';
      } else if (_currentLang == 'en') {
        _currentLang = 'ar';
      } else {
        _currentLang = 'fr';
      }
    });
  }

  List<Map<String, dynamic>> _generateDynamicMonths(String lang) {
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Calme)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Février (Petite affluence)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Mars (Printemps doux)
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Avril (Week-ends chargés)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Mai (Ponts, très fréquenté)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin (Début été, forte affluence)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet (Pic absolu, quotas/chaleur)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août (Pic absolu, surfréquenté)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Septembre (Encore du monde)
      {'top': Colors.orange, 'mid': Colors.grey, 'bot': Colors.grey},     // Octobre (Plus calme)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre (Tranquille)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},     // Décembre (Fêtes)
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
    if (_currentLang == 'ar') {
      return {
        'title': 'خليج سوجيتون 🌊',
        'pageTitle': 'خليج سوجيتون: جوهرة مرسيليا',
        'introTitle': 'خليج سوجيتون: جوهرة مرسيليا',
        'introText': 'يقع خليج سوجيتون في جنوب فرنسا، بالقرب من مرسيليا، وهو جوهرة حقيقية في سلسلة جبال كالونك. يتطلب الوصول إلى هذا المكان الساحر جهداً حقيقياً (بأمانة تامة، ليس خدعة سياحية، بل مسار حقيقي ومتطلب).',
        'translationsTitle': 'معاني الكلمات (البروفنسالية / المحلية)',
        'translations': [
          ['سوجيتون', 'القمة الصخرية أو الارتفاع المطل'],
          ['خَلَج', 'خليج صخري عميق بين المنحدرات'],
          ['لوميني', 'منطقة الغابات والمرتفعات الخضراء'],
        ],
        'saisonsTitle': '📅 الفصول الموصى بها',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'النصائح',
        'saisons': [
          ['🌱 الربيع', 'مثالي، درجات حرارة معتدلة وطبيعة مزهرة (انتبه لعطلات نهاية الأسبوع المزدحمة).'],
          ['🍂 الخريف', 'رائع، عدد أقل من الحشود الحرارة محتملة.'],
          ['☀️ الصيف', 'يُفضل تجنبه إن أمكن (حرارة عالية، حصص صارمة، وازدحام هائل).'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['🌅 باكراً في الصباح', 'قبل الساعة 8 صباحاً: ضروري للحصول على موقف سيارات والهدوء التام.'],
          ['☀️ منتصف النهار', 'يُجب تجنبه: حرارة مفرطة على الطريق الخرساني بلا ظل.'],
          ['🌇 المساء', 'مثالي لمشاهدة الغروب، لكن العودة ستكون تحت الشمس الحارقة.'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'parcoursTitle': '🗺️ مسار الرحلة من لوميني إلى سوجيتون',
        'etapes': [
          "البداية: مدرسة الهندسة المعمارية في لوميني.",
          "المسار: ممر حصوي واسع (علامات زرقاء).",
          "الاتجاه: الوصول إلى ممر كول دو سوجيتون.",
          "التفرع: إلى اليمين، مسار بنقاط حمراء.",
          "الانتقال: التقاطع مع الطريق الخرساني.",
          "نقطة الرؤية: المنعطف الخرساني الأخير.",
          "النزول الأخير: مسار طبيعي (نقاط حمراء).",
          "الوصول: خلجان سوجيتون.",
        ],
        'infosTitle': '📋 الضروريات والمعلومات (بأمانة تامة)',
        'infos': [
          [Icons.directions_walk, "البداية: لوميني"],
          [Icons.timer, "3.2 كم (55 دقيقة ذهاب / ساعة و15 دقيقة إياب)"],
          [Icons.water_drop, "نافورة مياه صالحة للشرب قبل الحاجز"],
          [Icons.landscape, "الصعوبة: نزهة سهلة ولكن متعبة صعوداً"],
          [Icons.warning, "نزول شديد الانحدار وأرضية مليئة بالحصى"],
          [Icons.sunny, "انتبه لشدة الانحدار عند العودة تحت أشعة الشمس"],
        ],
        'similarTitle': '🌍 أماكن تشبه خليج سوجيتون',
        'similarSub': 'اكتشف مناظر طبيعية مشابهة حول العالم:',
        'similarPlaces': [
          ['🇭🇷 خليج ستينيفا (كرواتيا)', 'خليج مخفي محاط بمنحدرات جيرية شاهقة يفتح على مياه فيروزية صافية.'],
          ['🇬🇷 شاطئ نافاجو (اليونان)', 'منحدرات بيضاء مذهلة تغوص في مياه صافية وكرستالية.'],
          ['🇪🇸 سا كالوبرا (مايوركا، إسبانيا)', 'مضيق دراماتيكي يفتح على خليج صخري بمياه زمردية.'],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من الازدحام الواقعي في سوجيتون لزيارة آمنة ومريحة.',
        'legendeVert': '🟢 أخضر : فترة هادئة ومثالية للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام متوسط، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة السياحة والحرارة والازدحام الشديد',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق بعناية من حالة الطقس، الحصص، وأوقات الزيارة قبل الذهاب إلى سوجيتون.',
        'histoireLabel': 'القصة والتاريخ المفصل',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'sugitonInfo': {
          'titre': 'Calanque de Sugiton',
          'titreAffichage': 'خليج سوجيتون المحمي',
          'image': 'assets/images/111.jpg',
          'typeAcces': 'مجاني / يخضع لحصص دخول في الصيف حماية للبيئة',
          'histoire': 'يعد خليج سوجيتون أحد أروع المعالم الطبيعية في حديقة الكالانك الوطنية بمرسيليا. يتميز بمياهه الفيروزية الصافية ومنحدراته الجيرية الشاهقة. نظراً للإقبال الهائل، وضعت السلطات نظاماً لحصص الحجز المسبق في فصل الصيف للحد من التعرية وحماية النباتات والحيوانات النادرة في الموقع.',
          'saviezVous': 'هل تعلم أن مسار سوجيتون يوفر إطلالة مذهلة تُعرف بـ "الرأس المكسورة" (Le Torpilleur) نظراً لشكل الصخرة الفريد الذي يشبه سفينة حربية.',
          'photoAstuce': 'التقط صوراً أفقية رائعة للمياه الفيروزية من منصة الإشراف العلوية، أو اصعد لالتقاط صور رأسية للمسار المتعرج وسط أشجار الصنوبر.',
          'photosVerticales': [
            'assets/images/999.jpg',
            'assets/images/777.jpg',
            'assets/images/6666.jpg',
          ]
        }
      };
    } else if (_currentLang == 'en') {
      return {
        'title': ' Sugiton Coves 🌊',
        'pageTitle': 'Sugiton Coves : A Marseille Gem',
        'introTitle': 'Sugiton Coves : A Marseille Gem',
        'introText': 'Located in the south of France, near Marseille, the Sugiton Calanque is a true gem of the Calanques massif. Reaching this enchanting place requires genuine effort (honestly speaking, not a tourist trap, but a real and demanding trail).',
        'translationsTitle': 'Provençal Translations',
        'translations': [
          ['Sugiton', 'The rocky peak or elevated vantage point'],
          ['Cove', 'Deep rocky cove between cliffs'],
          ['Luminy', 'Green forest and highland area'],
        ],
        'saisonsTitle': '📅 Recommended Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Tips',
        'saisons': [
          ['🌱 Spring', 'Ideal, mild temperatures and blooming nature (watch out for crowded weekends).'],
          ['🍂 Autumn', 'Perfect, fewer crowds and tolerable heat.'],
          ['☀️ Summer', 'Avoid if possible (heat, strict quotas, massive overcrowding).'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['🌅 Early morning', 'Before 8:00 AM: essential for parking and total tranquility.'],
          ['☀️ Midday', 'Avoid: excessive heat on the unshaded concrete road.'],
          ['🌇 Evening', 'Ideal for sunset views, but the return will be under the scorching sun.'],
        ],
        'galerieTitle': '📸 Place Overview',
        'parcoursTitle': '🗺️ Trail Route from Luminy to Sugiton',
        'etapes': [
          "Start: Luminy School of Architecture.",
          "Path: Wide gravel trail (blue markers).",
          "Direction: Reach the Col de Sugiton pass.",
          "Fork: To the right, red-dotted trail.",
          "Transition: Junction with the concrete road.",
          "Viewpoint: The last concrete turn.",
          "Final descent: Natural trail (red dots).",
          "Arrival: Sugiton coves.",
        ],
        'infosTitle': '📋 Essentials & Info (Honestly Speaking)',
        'infos': [
          [Icons.directions_walk, "Start: Luminy"],
          [Icons.timer, "3.2 km (55 min out / 1h15 back)"],
          [Icons.water_drop, "Drinking water fountain before the barrier"],
          [Icons.landscape, "Difficulty: Easy hike but tiring on the way up"],
          [Icons.warning, "Steep descent and gravel-covered terrain"],
          [Icons.sunny, "Watch out for the steep incline on the way back under the sun"],
        ],
        'similarTitle': '🌍 Places Similar to Sugiton',
        'similarSub': 'Discover similar landscapes around the world:',
        'similarPlaces': [
          ['🇭🇷 Stiniva Cove (Croatia)', 'A hidden cove enclosed by sheer limestone cliffs opening to turquoise waters.'],
          ['🇬🇷 Navagio Beach (Greece)', 'Spectacular white cliffs plunging into crystal-clear turquoise waters.'],
          ['🇪🇸 Sa Calobra (Mallorca, Spain)', 'A dramatic gorge opening into a rocky cove with emerald waters.'],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check real-time crowd levels in Sugiton for a safe and comfortable visit.',
        'legendeVert': '🟢 Green: Calm and ideal period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution or early arrival advised',
        'legendeRouge': '🔴 Red: Peak tourism, extreme heat, and heavy crowding',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Warning: Please carefully check weather conditions, quotas, and visiting hours before heading to Sugiton.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'sugitonInfo': {
          'titre': 'Calanque de Sugiton',
          'titreAffichage': 'The Protected Sugiton Calanque',
          'image': 'assets/images/111.jpg',
          'typeAcces': 'Free / Subject to summer access quotas for environmental protection',
          'histoire': 'The Sugiton Calanque is one of the most stunning natural landmarks in the Calanques National Park near Marseille. It is characterized by crystal-clear turquoise waters and towering limestone cliffs. Due to massive visitor turnout, authorities have implemented a pre-booking quota system in the summer to curb soil erosion and protect rare local flora and fauna.',
          'saviezVous': 'Did you know that the Sugiton trail offers an incredible viewpoint known as "The Broken Head" (Le Torpilleur) due to the unique rock formation resembling a warship.',
          'photoAstuce': 'Capture stunning landscape shots of the turquoise waters from the upper viewing platform, or hike up to capture vertical compositions of the winding trail amidst pine trees.',
          'photosVerticales': [
            'assets/images/999.jpg',
            'assets/images/777.jpg',
            'assets/images/6666.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Calanque de Sugiton 🌊',
        'pageTitle': 'Calanque de Sugiton : Joyau des Calanques',
        'introTitle': 'L\'Histoire et la réalité de Sugiton',
        'introText': "Située dans le sud de la France, près de Marseille, la Calanque de Sugiton est un joyau du massif des Calanques. Un effort est nécessaire pour atteindre ce lieu paradisiaque (et c'est une info honnête, pas une arnaque).",
        'translationsTitle': 'Traductions provençales',
        'translations': [
          ['Sugiton', 'Sommet rocheux ou hauteur escarpée'],
          ['Calanque', 'Vallon ou crique littorale encaissée'],
          ['Luminy', 'Domaine forestier et haut plateau verdoyant'],
        ],
        'saisonsTitle': '📅 Saisons recommandées',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Conseils',
        'saisons': [
          ['🌱 Printemps', 'Idéal, température douce et nature en fleur (attention aux week-ends très fréquentés).'],
          ['🍂 Automne', 'Parfait, moins de foule et chaleur supportable.'],
          ['☀️ Été', 'À éviter si possible (chaleur, quotas stricts, surfréquentation massive).'],
        ],
        'horairesTitle': '⏰ Horaires conseillés',
        'momentHeader': 'Moment',
        'horaires': [
          ['🌅 Tôt le matin', 'Avant 8h : indispensable pour le parking et la tranquillité.'],
          ['☀️ Milieu journée', 'À éviter : forte chaleur sur la route en béton sans ombre.'],
          ['🌇 Soir', 'Idéal pour le coucher de soleil, mais retour à prévoir sous la chaleur.'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'parcoursTitle': '🗺️ Parcours de Luminy à Sugiton',
        'etapes': [
          "Départ : École d'architecture de Luminy.",
          "Piste : Large sentier en gravier (balisage bleu).",
          "Direction : Atteindre le Col de Sugiton.",
          "Bifurcation : À droite, sentier en pointillés rouges.",
          "Transition : Jonction avec la route en béton.",
          "Point de vue : Dernier virage bétonné.",
          "Descente finale : Sentier naturel (pointillés rouges).",
          "Arrivée : Criques de Sugiton.",
        ],
        'infosTitle': '📋 Indispensables & Infos (Franchement)',
        'infos': [
          [Icons.directions_walk, "Départ : Luminy"],
          [Icons.timer, "3,2km (55min aller / 1h15 retour)"],
          [Icons.water_drop, "Fontaine d'eau potable avant la barrière"],
          [Icons.landscape, "Difficulté : Randonnée facile mais exigeante en montée"],
          [Icons.warning, "Descente raide et terrain caillouteux"],
          [Icons.sunny, "Attention à l'inclinaison au retour sous le soleil"],
        ],
        'similarTitle': '🌍 Endroits similaires à Sugiton',
        'similarSub': 'Découvrez des paysages semblables dans le monde :',
        'similarPlaces': [
          ['🇭🇷 Crique de Stiniva (Croatie)', 'Une crique cachée entourée de falaises calcaires vertigineuses ouvrant sur une mer turquoise.'],
          ['🇬🇷 Plage de Navagio (Grèce)', 'Des falaises blanches spectaculaires plongeant dans des eaux cristallines.'],
          ['🇪🇸 Sa Calobra (Majorque, Espagne)', 'Un canyon spectaculaire débouchant sur une crique rocheuse aux eaux émeraude.'],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle pour préserver le site et votre confort.',
        'legendeVert': '🟢 Vert : Période idéale (peu d’affluence, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence (pic estival, surfréquentation)',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez attentivement la météo ainsi que les quotas d\'accès et restrictions estivales avant de visiter Sugiton.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'sugitonInfo': {
          'titre': 'Calanque de Sugiton',
          'titreAffichage': 'La Calanque de Sugiton protégée',
          'image': 'assets/images/111.jpg',
          'typeAcces': 'Accès libre / Quotas de réservation en été pour préserver le site',
          'histoire': 'Nichée au cœur du Parc national des Calanques, Sugiton séduit par ses eaux turquoise et ses falaises vertigineuses. Face à son succès et pour enrayer l\'érosion des sols, des mesures de régulation estivale et des quotas d\'accès ont été instaurés afin de sauvegarder cet écosystème fragile.',
          'saviezVous': 'Saviez-vous que le rocher emblématique au milieu de l\'eau est surnommé "Le Torpilleur" en raison de sa forme caractéristique évoquant un navire militaire.',
          'photoAstuce': 'Pour immortaliser Sugiton, profitez des superbes vues plongeantes depuis le belvédère sommital, ou réalisez des clichés verticaux le long du sentier forestier en lacets.',
          'photosVerticales': [
            'assets/images/999.jpg',
            'assets/images/777.jpg',
            'assets/images/6666.jpg',
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

  @override
  Widget build(BuildContext context) {
    final bool isRtl = _currentLang == 'ar';
    final data = _getLocalizedData();
    final months = data['months'] as List;
    final sugitonInfo = data['sugitonInfo'] as Map<String, dynamic>;
    final verticalPhotos = sugitonInfo['photosVerticales'] as List<String>;
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
                  // EN-TÊTE : TITRE LIGNE COMPLÈTE & EN DESSOUS LANGUE
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
                                _currentLang.toUpperCase(),
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
                      sugitonInfo['image'],
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

                  // AVERTISSEMENT MÉTÉO / QUOTAS
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
                          sugitonInfo['titreAffichage'],
                          style: const TextStyle(
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
                            sugitonInfo['typeAcces'],
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

                  // 1. BIS - TRADUCTIONS PROVENÇALES
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['introText'],
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
                          sugitonInfo['histoire'],
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
                      onPressed: () => _openMap(sugitonInfo['titre']),
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
                          sugitonInfo['saviezVous'],
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
                          sugitonInfo['photoAstuce'],
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
                          style: const TextStyle(
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
                          style: const TextStyle(
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

                  // 8. ENDROITS SIMILAIRES À SUGITON
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
                          data['similarTitle'],
                          style: TextStyle(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['similarSub'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 13,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...((data['similarPlaces'] as List).map((p) => _buildSimilarPlaceRow(p[0], p[1], _currentColor))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 9. CALENDRIER D'AFFLUENCE (100% INTÉGRÉ)
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

                  // 10. PARCOURS ÉTAPE PAR ÉTAPE
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
                          data['parcoursTitle'],
                          style: TextStyle(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...((data['etapes'] as List).map((stepText) => _buildStep(stepText, _currentColor))),
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
                          style: TextStyle(
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: verticalPhotos.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        width: double.infinity,
                        height: 380,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            verticalPhotos[index],
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
                    },
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
          Expanded(child: Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildStep(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right, color: color, size: 20),
          const SizedBox(width: 5),
          Expanded(child: Text(text, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5))),
        ],
      ),
    );
  }

  Widget _buildSimilarPlaceRow(String title, String desc, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.place, color: color.withOpacity(0.7), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(desc, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 12, height: 1.4)),
              ],
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