import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class MontSaintMichelPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const MontSaintMichelPage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFFD4AF37),
  });

  @override
  State<MontSaintMichelPage> createState() => _MontSaintMichelPageState();
}

class _MontSaintMichelPageState extends State<MontSaintMichelPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant MontSaintMichelPage oldWidget) {
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
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Avril
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.red},    // Mai
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.green},  // Septembre
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
        'title': 'مونت سان ميشيل 🏰',
        'pageTitle': 'مونت سان ميشيل : أعجوبة الغرب',
        'introTitle': '🌊 أعجوبة الغرب',
        'introText': 'تُعد مونت سان ميشيل تحفة معمارية فريدة، وهي في المقام الأول بلدية يُتاح الوصول إلى صخرتها مجاناً بالكامل ليلاً ونهاراً. ومنذ أن عادت لتصبح جزيرة أثناء المد العالي، تتيح الاقتراب عبر الجسر الممر لإبهار الوصول إلى هذه التحفة الفنية. مكان ساحر يمكن الوصول إليه سيراً على الأقدام، أو بالدراجة، أو عبر حافلة "لي باسور" المجانية.',
        'factsTitle': '📋 الحقائق الأساسية',
        'facts': [
          ['الوصول', 'مجاني ومتاح 24 ساعة'],
          ['الخصوصية', 'يعود ليصبح جزيرة أثناء المد العالي'],
          ['الطابع', "سانت مايكل ماونت (كورنوال 🇬🇧)"],
        ],
        'seasonsTitle': '📅 أفضل المواسم',
        'seasonsHeader1': 'الموسم',
        'seasonsHeader2': 'الأجواء والنصائح',
        'seasons': [
          ['🌱 الربيع \n🍂 الخريف', 'موصى به: مناخ لطيف، إضاءة جميلة وفترات مثالية لمراقبة المد العالي.'],
          ['❄️ الشتاء', 'هادئ: عاصف وبارد، ولكنه يوفر أجواء سحرية وأزقة شبه خالية.'],
          ['☀️ الصيف', 'للتجنب: ازدحام سياحي كبير جداً، تصبح الأزقة الضيقة مزدحمة بسرعة.'],
        ],
        'hoursTitle': '⏰ الأوقات الموصى بها',
        'hoursHeader1': 'الوقت',
        'hoursHeader2': 'النصائح',
        'hours': [
          ['✨ الصباح (باكر)', 'موصى به: مثالي للتجول في الأسوار بكل هدوء قبل وصول الحشود.'],
          ['🌙 الليل', 'ساحر: الوصول إلى الصخرة مجاني 24/7. المنظر المضاء يقدم عرضاً لا يُنسى.'],
          ['☀️ 11 صباحاً - 4 عصراً', 'للتجنب: ذروة الازدحام اليومي. استغل هذا الوقت لزيارة الدير (مدفوع).'],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يوصى بالحجز المسبق عبر الإنترنت لدير الرهبان في موسم الذروة.',
        'legendeVert': '🟢 أخضر: فترة هادئة (الشتاء / الربيع / الخريف)',
        'legendeOrange': '🟠 برتقالي: ازدحام معتدل (مايو / يونيو / سبتمبر)',
        'legendeRouge': '🔴 أحمر: ازدحام شديد / موسم الذروة (يوليو - أغسطس)',
        'legendeGris': '⚪ رمادي: فترة عادية / متغيرة',
        'conseilsTitle': '📋 الضروريات والمعلومات',
        'conseils': [
          [Icons.map_outlined, "تقع في منطقة نورماندي"],
          [Icons.directions_bus, "حافلة «لي باسور» المجانية من مواقف السيارات"],
          [Icons.account_balance, "دخول القرية مجاني. الدير فقط مدفوع الثمن."],
          [Icons.waves, "تنبيه: تحقق من جداول المد والجزر قبل أي رحلة في الخليج"],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: تحقق من أوقات المد والجزر وشروط الوصول قبل الزيارة.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['سانت مايكل ماونت (كورنوال، بريطانيا) 🇬🇧', 'جزيرة مدية مذهلة تlockيها قلعة تاريخية، تشبه تماماً التميز الجغرافي والمعماري لمونت سان ميشيل.'],
          ['نوشوانシュتاйн (بافاريا، ألمانيا) 🇩🇪', 'قلعة خيالية شهيرة تقع فوق التلال الشامخة وتعكس العمارة الأوروبية التاريخية الساحرة.'],
          ['سان مارينو (سان مارينو) 🇸🇲', 'جمهورية جبلية صخرية قديمة تتميز بأسوارها التاريخية وإطلالاتها الساحرة التي تشبه أجواء القلاع العتيقة.']
        ],
        'montInfo': {
          'titre': 'Le Mont Saint-Michel',
          'titreAffichage': 'Le Mont Saint-Michel 🏰',
          'image': 'assets/image/29.jpg',
          'typeAcces': 'Normandie / Accès libre 24h/24',
          'histoire': "يُعد مونت سان ميشيل أعجوبة معمارية فريدة من نوعها تمتد جذورها عبر قرون من تاريخ العصور الوسطى، حيث تحولت الصخرة تدريجياً إلى مجمع رهباني وحصن منيع قاوم حصار التاريخ.",
          'saviezVous': "هل تعلم أن الخليج المحيط بالمونت يشهد أسرع وأكبر فروق مد وجزر في أوروبا قاطبة، حيث ينحسر الماء ويمتد لمسافات شاسعة بسرعة مذهلة.",
          'photoAstuce': "احرص على التقاط صور للمونت من السهول المحيطة أو الجسر الممر وقت شروق الشمس عندما يلفه الضباب الصباحي الساحر.",
          'photosVerticales': [
            'assets/image/25.jpg',
            'assets/image/27.jpg',
            'assets/image/30.jpg',
            'assets/image/31.webp',
            'assets/image/32.webp',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Le Mont Saint-Michel 🏰',
        'pageTitle': 'Le Mont Saint-Michel : The Wonder of the West',
        'introTitle': '🌊 The Wonder of the West',
        'introText': "A true architectural wonder, Le Mont Saint-Michel is above all a municipality where access to the rock is entirely free, day and night. Since it becomes an island again during high tides, approaching via the footbridge allows you to admire the arrival at this masterpiece. A magical place to reach on foot, by bike, or via the free 'Le Passeur' shuttle.",
        'factsTitle': '📋 Key Facts',
        'facts': [
          ['Access', 'Free and open 24/7'],
          ['Particularity', 'Becomes an island again during high tides'],
          ['Vibe', "St Michael's Mount (Cornwall 🇬🇧)"],
        ],
        'seasonsTitle': '📅 Best Seasons',
        'seasonsHeader1': 'Season',
        'seasonsHeader2': 'Vibe & Tips',
        'seasons': [
          ['🌱 Spring \n🍂 Autumn', 'RECOMMENDED: Pleasant climate, beautiful lighting, and ideal periods to observe high tides.'],
          ['❄️ Winter', 'CALM: Windy and cool, but offers a mystical atmosphere and nearly deserted alleys.'],
          ['☀️ Summer', 'TO AVOID: Very heavy tourist crowds, narrow alleys quickly become impassable.'],
        ],
        'hoursTitle': '⏰ Recommended Hours',
        'hoursHeader1': 'Time',
        'hoursHeader2': 'Tips',
        'hours': [
          ['✨ Morning (early)', 'RECOMMENDED: Ideal for walking the ramparts in peace before crowds arrive.'],
          ['🌙 Night', 'MAGICAL: Access to the rock is free 24/7. The illuminated Mont offers an unforgettable spectacle.'],
          ['☀️ 11 AM - 4 PM', 'TO AVOID: Daily peak crowd. Use this time to visit the Abbey (paid).'],
        ],
        'bestMonthsTitle': 'Crowd Levels & Seasonality Calendar',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Online booking strongly recommended for the Abbey in high season.',
        'legendeVert': '🟢 Green: Calm period (Winter / Spring / Autumn)',
        'legendeOrange': '🟠 Orange: Moderate crowds (May / June / September)',
        'legendeRouge': '🔴 Red: Heavy crowds / Peak season (July - August)',
        'legendeGris': '⚪ Grey: Normal / variable period',
        'conseilsTitle': '📋 Essentials & Info',
        'conseils': [
          [Icons.map_outlined, "Located in Normandy"],
          [Icons.directions_bus, "Free 'Le Passeur' shuttle from parking lots"],
          [Icons.account_balance, "Village access is free. Only the Abbey is paid."],
          [Icons.waves, "Warning: check tide schedules before heading out into the bay"],
        ],
        'galerieTitle': '📸 Place Overview',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Check tide schedules and access conditions before visiting.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ["St Michael's Mount (Cornwall, UK) 🇬🇧", 'A stunning tidal island topped by a medieval castle, sharing a striking architectural and geographical resemblance.'],
          ['Neuschwanstein Castle (Bavaria, Germany) 🇩🇪', 'A legendary fairytale castle perched high on rugged hills, reflecting majestic European history.'],
          ['San Marino (San Marino) 🇸🇲', 'An ancient fortified republic perched on dramatic rocky cliffs, offering breathtaking panoramic views and medieval charm.']
        ],
        'montInfo': {
          'titre': 'Le Mont Saint-Michel',
          'titreAffichage': 'Le Mont Saint-Michel 🏰',
          'image': 'assets/image/29.jpg',
          'typeAcces': 'Normandy / Free access 24/7',
          'histoire': "Le Mont Saint-Michel is a unique architectural marvel rooted in centuries of medieval history, evolving progressively from a rocky outcrop into a magnificent monastic complex and fortress.",
          'saviezVous': "Did you know that the bay surrounding the mount experiences some of the largest and fastest tidal ranges in Europe, completely surrounding the rock with water.",
          'photoAstuce': "Opt for early morning shots from the surrounding flats or the footbridge when a soft mist embraces the historical silhouette.",
          'photosVerticales': [
            'assets/image/25.jpg',
            'assets/image/27.jpg',
            'assets/image/30.jpg',
            'assets/image/31.webp',
            'assets/image/32.webp',
          ]
        }
      };
    } else {
      return {
        'title': 'Le Mont Saint-Michel 🏰',
        'pageTitle': 'Le Mont Saint-Michel : La Merveille de l’Occident',
        'introTitle': "🌊 La Merveille de l'Occident",
        'introText': "Véritable merveille architecturale, le Mont Saint-Michel est avant tout une commune dont l'accès au rocher est entièrement libre, de jour comme de nuit. Depuis qu'il redevient une île lors des grandes marées, l’approche par le pont-passerelle permet d'admirer l'arrivée sur ce chef-d'œuvre. Un lieu magique à rejoindre à pied, à vélo, ou grâce à la navette gratuite « Le Passeur ».",
        'factsTitle': '📋 Faits clés',
        'facts': [
          ['Accès', 'Gratuit et libre 24h/24'],
          ['Particularité', 'Redevient une île aux grandes marées'],
          ['Air de', "St Michael's Mount (Cornouailles 🇬🇧)"],
        ],
        'seasonsTitle': '📅 Meilleures saisons',
        'seasonsHeader1': 'Saison',
        'seasonsHeader2': 'Ambiance & Conseils',
        'seasons': [
          ['🌱 Printemps \n🍂 Automne', 'RECOMMANDÉ : Climat agréable, belles lumières et périodes idéales pour observer les grandes marées.'],
          ['❄️ Hiver', 'CALME : Venteux et frais, mais offre une atmosphère mystique et des ruelles presque désertes.'],
          ['☀️ Été', 'À ÉVITER : Très forte affluence touristique, les ruelles étroites deviennent rapidement impraticables.'],
        ],
        'hoursTitle': '⏰ Horaires conseillés',
        'hoursHeader1': 'Moment',
        'hoursHeader2': 'Conseils',
        'hours': [
          ['✨ Matin (tôt)', 'RECOMMANDÉ : Idéal pour parcourir les remparts en toute sérénité avant l\'arrivée des foules.'],
          ['🌙 Nuit', 'MAGIQUE : Accès au rocher libre 24h/24. Le Mont illuminé offre un spectacle inoubliable.'],
          ['☀️ 11h - 16h', 'À ÉVITER : Pic d\'affluence quotidien. Privilégiez ce moment pour visiter l\'Abbaye (payante).'],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Réservation en ligne fortement conseillée pour l’Abbaye en haute saison.',
        'legendeVert': '🟢 Vert : Période calme (Hiver / Printemps / Automne)',
        'legendeOrange': '🟠 Orange : Affluence modérée (Mai / Juin / Septembre)',
        'legendeRouge': '🔴 Rouge : Forte affluence / Haute saison (Juillet - Août)',
        'legendeGris': '⚪ Gris : Période normale / variable',
        'conseilsTitle': '📋 Indispensables & Infos',
        'conseils': [
          [Icons.map_outlined, "Situé en Normandie"],
          [Icons.directions_bus, "Navette « Le Passeur » gratuite depuis les parkings"],
          [Icons.account_balance, "L'accès au village est gratuit. Seule l'Abbaye est payante."],
          [Icons.waves, "Attention : vérifier les horaires des marées avant toute sortie dans la baie"],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez les horaires des marées ainsi que les conditions d\'accès avant de visiter.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires au Mont Saint-Michel dans le monde',
        'similarPlaces': [
          ["St Michael's Mount (Cornouailles, Royaume-Uni) 🇬🇧", 'Une île marémantique spectaculaires surmontée d’un château médiéval, rappelant immédiatement l’esprit du Mont Saint-Michel.'],
          ['Neuschwanstein (Bavière, Allemagne) 🇩🇪', 'Un château de conte de fées perché sur un éperon rocheux, offrant une architecture européenne majestueuse.'],
          ['San Marino (Saint-Marin) 🇸🇲', 'Une république fortifiée perchée sur des falaises rocheuses impressionnantes, offrant un panorama spectaculaire et un charme médiéval.']
        ],
        'montInfo': {
          'titre': 'Le Mont Saint-Michel',
          'titreAffichage': 'Le Mont Saint-Michel 🏰',
          'image': 'assets/image/29.jpg',
          'typeAcces': 'Normandie / Accès libre 24h/24',
          'histoire': "Le Mont Saint-Michel est un chef-d'œuvre architectural façonné par des siècles d'histoire médiévale, se dressant fièrement au milieu d'une baie immense célèbre pour ses marées.",
          'saviezVous': "Saviez-vous que la baie du Mont Saint-Michel connaît les plus grandes amplitudes de marée d'Europe continentale, transformant le mont en île lors des coefficients élevés.",
          'photoAstuce': "Privilégiez une prise de vue matinale depuis la passerelle lorsque la brume enveloppe les remparts pour une ambiance totalement féerique.",
          'photosVerticales': [
            'assets/image/25.jpg',
            'assets/image/27.jpg',
            'assets/image/30.jpg',
            'assets/image/31.webp',
            'assets/image/32.webp',
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
    final Color orSable = _currentColor;

    final bool isRtl = _currentLanguageCode == 'ar';
    final data = _getLocalizedData();
    final montInfo = data['montInfo'] as Map<String, dynamic>;
    final factsList = data['facts'] as List;
    final seasonsList = data['seasons'] as List;
    final hoursList = data['hours'] as List;
    final months = data['months'] as List;
    final conseilsList = data['conseils'] as List;
    final photosVerticales = montInfo['photosVerticales'] as List;

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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL UNIQUEMENT (SANS FAVORIS)
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
                            color: orSable.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: orSable.withOpacity(0.4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.language, color: orSable, size: 16),
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
                      montInfo['image'],
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
                      border: Border.all(color: orSable.withOpacity(0.3)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          montInfo['titreAffichage'],
                          style: GoogleFonts.cinzel(
                            color: orSable,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: orSable.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            montInfo['typeAcces'],
                            style: TextStyle(
                              color: orSable,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 1. BIS - FAITS CLÉS
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
                          data['factsTitle'],
                          style: TextStyle(
                            color: orSable,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...factsList.map((fact) => _buildTranslationLine(fact[0], fact[1], orSable)),
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
                            color: orSable.withOpacity(0.9),
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
                            color: orSable,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          montInfo['histoire'],
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
                        backgroundColor: orSable,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () => _openMap(montInfo['titre']),
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
                          montInfo['saviezVous'],
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
                          montInfo['photoAstuce'],
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

                  // 5. BIS - ENDROITS SIMILAIRES (ÉTRANGER)
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

                  // 6. TABLEAU PÉRIODES (MEILLEURES SAISONS)
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
                        _buildSectionTitle(data['seasonsTitle'], orSable),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['seasonsHeader1'], data['seasonsHeader2']], isHeader: true, hColor: orSable),
                            ...seasonsList.map((s) => _buildTableRow([s[0], s[1]])),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 7. TABLEAU HORAIRES CONSEILLÉS
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
                        _buildSectionTitle(data['hoursTitle'], orSable),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                          children: [
                            _buildTableRow([data['hoursHeader1'], data['hoursHeader2']], isHeader: true, hColor: orSable),
                            ...hoursList.map((h) => _buildTableRow([h[0], h[1]])),
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

                  // 9. INDISPENSABLES & INFOS PRATIQUES
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
                        _buildSectionTitle(data['conseilsTitle'], orSable),
                        const SizedBox(height: 12),
                        ...conseilsList.map((info) => _buildTechRow(info[0], info[1], orSable)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 10. GALERIE PHOTOS
                  _buildSectionTitle(data['galerieTitle'], orSable),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      ...photosVerticales.map((path) => _buildGalleryImage(path)),
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
          Expanded(child: Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15))),
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

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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