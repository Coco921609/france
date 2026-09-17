import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class PlateauMilleEtangsPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const PlateauMilleEtangsPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<PlateauMilleEtangsPage> createState() => _PlateauMilleEtangsPageState();
}

class _PlateauMilleEtangsPageState extends State<PlateauMilleEtangsPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant PlateauMilleEtangsPage oldWidget) {
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

  String _getFlagEmoji() {
    if (_currentLanguageCode == 'fr') return '🇫🇷 FR';
    if (_currentLanguageCode == 'en') return '🇬🇧 EN';
    return '🇸🇦 AR';
  }

  List<Map<String, dynamic>> _generateDynamicMonths(String lang) {
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Hiver)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février (Hiver)
      {'top': Colors.grey, 'mid': Colors.green, 'bot': Colors.green},   // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril (Printemps)
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juillet
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Août
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Octobre (Automne / Couleurs max)
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
        'title': 'هضبة الألف بركة 🌲',
        'pageTitle': 'هضبة الألف بركة : فنلندا الصغيرة',
        'introTitle': '🇫🇮 فنلندا الصغيرة في هوت سون',
        'introText': 'يُعد هذا التراث الطبيعي الرائع وجهة برية تذكرنا بالمناظر الطبيعية في الدول الإسكندنافية. تشكلت عبر الجليد وعمل الرهبان، وتدعوكم هذه المنطقة الساحرة لاستكشاف شبكة واسعة من الغابات والبحيرات.',
        'factsTitle': '📊 الحقائق الأساسية',
        'superficieLabel': 'المساحة',
        'superficieVal': 'أكثر من 220 كم²',
        'formationLabel': 'التكوين',
        'formationVal': 'جليدي (قبل 12,000 سنة)',
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'الأجواء والنصائح',
        'saisons': [
          ['🍂 الخريف', 'موصى به، ألوان خريفية مذهلة تنعكس على صفحة الماء'],
          ['🌱 الربيع', 'ممتع، استيقاظ الطبيعة ونشاط الحياة البرية'],
          ['❄️ الشتاء', 'يُفضل تجنبه، برودة قاسية ومسارات قد تكون زلقة أو صعبة'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ الصباح', 'موصى به، ضباب ساحر وغامض يلف البحيرات'],
          ['🌅 المساء', 'موصى به، إضاءة هادئة وغروب الشمس فوق الماء'],
          ['☀️ منتصف النهار / الليل', 'يُفضل تجنبه، إضاءة قوية جداً نهاراً ومخاطر الضياع ليلاً'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.map_outlined, "تقع في هوت سون (بورغون-فرانش-كونته)"],
          [Icons.directions_walk, "مسارات عديدة للمشي لمسافات طويلة"],
          [Icons.nature, "مساحات برية وبحيرات خلابة"],
          [Icons.camera_alt, "يُفضل الخريف لالتقاط أجمل الصور"],
          [Icons.warning_amber_rounded, "تجنب الزيارة ليلاً وفي ذروة الشتاء"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الألوان والزوار (خاصة الخريف)',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد / شتاء',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'histoireText': 'تقع هضبة الألف بركة في إقليم هوت سون، وقد تشكلت نتيجة انحسار الأنهار الجليدية قبل 12,000 عام وتم تنظيمها وتطويرها بفضل جهود الرهبان عبر القرون. يوفر هذا المشهد الفريد أجواء مشابهة تماماً للطبيعة الإسكندنافية.',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'saviezVousText': 'هل تعلم أن هضبة الألف بركة تُعرف بلقب «فنلندا الصغيرة» نظراً لكثرة بحيراتها وتوربياتها المنتشرة وسط طبيعة برية عذراء.',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'photoAstuceText': 'يفضل التصوير في الصباح الباطل لالتقاط الضباب الساحر فوق البحيرات، أو في ألوان الخريف الذهبية.',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم (خارج فرنسا)',
        'similarPlaces': [
          ['بحيرة سايما (فنلندا) 🇫🇮', 'متاهة مائية هائلة ومذهلة من البحيرات والجزر المغطاة بالغابات، تشبه تماماً أجواء هضبة الألف بركة.'],
          ['حديقة نُوكسيو الوطنية (فنلندا) 🇫🇮', 'مناظر طبيعية خلابة للغابات والبحيرات الصخرية التي نحتها الجليد.'],
          ['منطقة البحيرات الفنلندية (فنلندا) 🇫🇮', 'امتداد واسع للمياه العذبة والغابات الصنوبرية في أجواء شمالية نقية.']
        ],
        'altInfo': {
          'titre': 'Plateau des 1000 Étangs',
          'titreAffichage': 'هضبة الألف بركة - فنلندا الصغيرة',
          'image': 'assets/image/3.jpg',
          'photosVerticales': [
            'assets/image/1.jpg',
            'assets/image/5.jpg',
            'assets/image/6.jpg',
            'assets/image/2.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Plateau of a Thousand Ponds 🌲',
        'pageTitle': 'Plateau of a Thousand Ponds : The Little Finland',
        'introTitle': '🇫🇮 The "Little Finland" of Haute-Saône',
        'introText': 'A true natural gem, this wild territory reveals raw landscapes reminiscent of Scandinavia. Shaped by ice and the work of monks, this mysterious place with multiple hikes invites you to explore a mosaic of forests and bodies of water.',
        'factsTitle': '📊 Key Facts',
        'superficieLabel': 'Area',
        'superficieVal': 'Over 220 km²',
        'formationLabel': 'Formation',
        'formationVal': 'Glacial (12,000 years ago)',
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Ambience & Advice',
        'saisons': [
          ['🍂 Autumn', 'RECOMMENDED, magnificent flamboyant tree colors reflected in the water'],
          ['🌱 Spring', 'Pleasant, awakening of nature and active wildlife'],
          ['❄️ Winter', 'TO AVOID, very harsh cold, slippery or impassable trails'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Morning', 'RECOMMENDED, mystical mist hovering over the ponds'],
          ['🌅 Evening', 'RECOMMENDED, soft light and sunsets reflecting on water'],
          ['☀️ Noon / Night', 'TO AVOID, harsh daylight and risk of getting lost at night'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.map_outlined, "Located in Haute-Saône (Bourgogne-Franche-Comté)"],
          [Icons.directions_walk, "Numerous hiking and walking trails"],
          [Icons.nature, "Wild spaces: forests and peat bogs"],
          [Icons.camera_alt, "Prioritize autumn for photography"],
          [Icons.warning_amber_rounded, "Avoid nighttime and deep winter visits"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution or early arrival advised',
        'legendeRouge': '🔴 Red: Peak colors and visitors (especially Autumn)',
        'legendeGris': '⚪ Grey: Low season or cool/winter weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'histoireLabel': 'Detailed History & Background',
        'histoireText': 'Located in Haute-Saône, the Plateau of a Thousand Ponds was shaped by receding glaciers 12,000 years ago and developed through centuries of human labor. This unique landscape undeniably evokes the great northern spaces.',
        'saviezVousLabel': 'Did you know ?',
        'saviezVousText': 'Did you know that the Plateau of a Thousand Ponds is nicknamed "Little Finland" due to its multitude of lakes and peat bogs scattered across wild nature.',
        'photoAstuceLabel': '📸 Photo Tip',
        'photoAstuceText': 'Opt for misty mornings or golden autumn light to capture the magic of reflections on the water.',
        'similarPlacesTitle': '🌍 Similar Places Around the World (Outside France)',
        'similarPlaces': [
          ['Lake Saimaa (Finland) 🇫🇮', 'A vast and stunning water labyrinth of lakes and forest-covered islands directly mirroring the landscape.'],
          ['Nuuksio National Park (Finland) 🇫🇮', 'Spectacular wild forest and rocky lake landscapes carved by ancient glacial activity.'],
          ['Finnish Lakeland (Finland) 🇫🇮', 'A vast expanse of fresh water and pine forests in a pure northern atmosphere.']
        ],
        'altInfo': {
          'titre': 'Plateau des 1000 Étangs',
          'titreAffichage': 'Plateau of a Thousand Ponds - Little Finland',
          'image': 'assets/image/3.jpg',
          'photosVerticales': [
            'assets/image/1.jpg',
            'assets/image/5.jpg',
            'assets/image/6.jpg',
            'assets/image/2.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Plateau des 1000 Étangs 🌲',
        'pageTitle': 'Plateau des 1000 Étangs : La Petite Finlande',
        'introTitle': '🇫🇮 La « Petite Finlande » de Haute-Saône',
        'introText': "Véritable joyau naturel, ce territoire sauvage dévoile des paysages bruts qui rappellent la Scandinavie. Façonné par la glace et l'œuvre des moines, ce lieu mystérieux aux multiples randonnées vous invite à explorer une mosaïque de forêts et de plans d'eau.",
        'factsTitle': '📊 Faits clés',
        'superficieLabel': 'Superficie',
        'superficieVal': 'Plus de 220 km²',
        'formationLabel': 'Formation',
        'formationVal': 'Glaciaire (il y a 12 000 ans)',
        'saisonsTitle': '📅 Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Ambiance & Conseils',
        'saisons': [
          ['🍂 Automne', 'RECOMMANDÉ : Magnifique, couleurs flamboyantes des arbres reflétées dans l\'eau'],
          ['🌱 Printemps', 'Agréable, réveil de la nature et faune active'],
          ['❄️ Hiver', 'À ÉVITER : Froid très rude, sentiers potentiellement glissants ou impraticables'],
        ],
        'horairesTitle': '⏰ Horaires conseillés',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Matin', 'RECOMMANDÉ : Brume mystique au-dessus des étangs'],
          ['🌅 Soir', 'RECOMMANDÉ : Lumière douce et couchers de soleil sur l\'eau'],
          ['☀️ Midi / Nuit', 'À ÉVITER : Lumière trop crue en journée, risque de se perdre la nuit'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.map_outlined, "Situé en Haute-Saône (Bourgogne-Franche-Comté)"],
          [Icons.directions_walk, "Nombreux sentiers de randonnée pédestre"],
          [Icons.nature, "Espaces sauvages : forêts et tourbières"],
          [Icons.camera_alt, "Privilégier l'automne pour la photographie"],
          [Icons.warning_amber_rounded, "Éviter la nuit et le plein hiver"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Couleurs maximales (Automne)',
        'legendeGris': '⚪ Basse saison / Météo fraîche / Hiver',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez la météo ainsi que les conditions d\'accès avant de visiter le site.',
        'histoireLabel': 'Histoire et récit détaillé',
        'histoireText': "Situé en Haute-Saône, le Plateau des 1000 Étangs est façonné par le retrait des glaciers il y a 12 000 ans et aménagé par l'homme au fil des siècles. Ce paysage unique évoque incontournablement les grands espaces nordiques.",
        'saviezVousLabel': 'Saviez-vous ?',
        'saviezVousText': "Saviez-vous que le Plateau des 1000 Étangs doit son surnom de « Petite Finlande » à sa multitude de lacs et de tourbières disséminés dans une nature sauvage.",
        'photoAstuceLabel': '📸 Astuce photo',
        'photoAstuceText': "Privilégiez les matinées brumeuses ou les lumières dorées de l'automne pour capturer la magie des reflets sur l'eau.",
        'similarPlacesTitle': '🌍 Endroits similaires à l\'étranger (Hors de France)',
        'similarPlaces': [
          ['Lac Saimaa (Finlande) 🇫🇮', 'Le plus grand labyrinthe lacustre de Finlande, composé de milliers d\'îles boisées et de paysages d\'eau infinis.'],
          ['Parc national de Nuuksio (Finlande) 🇫🇮', 'Des lacs sauvages, des forêts de conifères et des affleurements rocheux sculptés par les glaciers.'],
          ['Région des lacs finnois (Finlande) 🇫🇮', 'Une immense étendue bleue et verte rappelant trait pour trait l\'esprit du plateau.']
        ],
        'altInfo': {
          'titre': 'Plateau des 1000 Étangs',
          'titreAffichage': 'Plateau des 1000 Étangs - La Petite Finlande',
          'image': 'assets/image/3.jpg',
          'photosVerticales': [
            'assets/image/1.jpg',
            'assets/image/5.jpg',
            'assets/image/6.jpg',
            'assets/image/2.jpg',
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
    final photosVerticales = altInfo['photosVerticales'] as List;

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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL ET DRAPEAU CORRECT POUR L'ARABE (🇸🇦)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            fontSize: 13,
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
                                color: _currentColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: _currentColor.withOpacity(0.4)),
                              ),
                              child: Text(
                                _getFlagEmoji(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
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

                  // 1. TITRE & FAITS CLÉS
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
                        const SizedBox(height: 12),
                        _buildFactLine(data['superficieLabel'], data['superficieVal'], _currentColor),
                        const SizedBox(height: 6),
                        _buildFactLine(data['formationLabel'], data['formationVal'], _currentColor),
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
                          data['histoireText'],
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
                          data['saviezVousText'],
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
                          data['photoAstuceText'],
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

                  // 5. BIS - ENDROITS SIMILAIRES (À L'ÉTRANGER)
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
                    children: photosVerticales.map((p) => _buildGalleryImage(p)).toList(),
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

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14))),
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