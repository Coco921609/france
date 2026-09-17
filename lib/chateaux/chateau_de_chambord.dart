import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChateauDeChambordPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const ChateauDeChambordPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<ChateauDeChambordPage> createState() => _ChateauDeChambordPageState();
}

class _ChateauDeChambordPageState extends State<ChateauDeChambordPage> {
  late Color _currentColor;
  late String _currentLang;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLang = widget.languageCode;
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.grey},
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.orange},
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange},
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange},
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.red},
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange},
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange},
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.orange},
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

  Map<String, dynamic> _getLocalizedChateauData() {
    if (_currentLang == 'ar') {
      return {
        'pageTitle': 'قصر شامبور: جوهرة عصر النهضة',
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس في أول الشهر، منتصف الشهر وآخر الشهر.',
        'legendeVert': '🟢 أخضر: فترة مثالية (ازدحام قليل، طقس ممتاز، وأسعار مناسبة)',
        'legendeOrange': '🟠 برتقالي: ازدحام متوسط (فترة انتقالية، يتطلب حجزاً مسبقاً)',
        'legendeRouge': '🔴 أحمر: ازدحام شديد (ذروة السياحة، أسعار مرتفعة جداً)',
        'legendeGris': '⚪ رمادي: فترة منخفضة الموسم (طقس بارد أو ممطر، لكنها مثالية لتجنب الحشود الكبيرة)',
        'horairesTitle': 'مواعيد العمل والإغلاق',
        'horairesContent': '''
• الموسم المرتفع (أبريل - أكتوبر): 
  من الساعة 9:00 صباحاً حتى 6:00 مساءً.

• الموسم المنخفض (نوفمبر - مارس): 
  من الساعة 9:00 صباحاً حتى 5:00 مساءً.

• آخر دخول: 
  قبل 30 دقيقة من إغلاق القصر.

• أيام الإغلاق السنوي: 
  1 يناير و 25 ديسمبر فقط.''',
        'parkingTitle': 'تفاصيل مواقف السيارات والرسوم',
        'parkingContent': '''
• أوقات عمل المواقف: 
  مفتوحة 24/7 (بدون حجز مسبق).

• وسائل الدفع: 
  - نقداً: في صالة الاستقبال (9:00 ص - 5:30 م صيفاً / 4:30 م شتاءً).
  - بالبطاقات: 24/7 عبر الأجهزة الآلية.

• موقف P0 (على بعد 600 متر - للسيارات < 2.10 م): 
  8 يورو / اليوم (مجاني لذوي الإعاقة عند تقديم الإثبات والتذكرة).

• موقف P1 (على بعد 600 متر - للحافلات والمركبات الكبيرة): 
  حافلات صغيرة: 15 يورو / اليوم | حافلات كبيرة: 100 يورو / اليوم.

• موقف P2 (على بعد 750 متر): 
  سيارات عادية: 8 يورو / اليوم | مقطورات وسيارات مرتفعة: 15 يورو / 24 ساعة (بدون مياه أو كهرباء).

• موقف P3 (على بعد 850 متر): 
  8 يورو / اليوم (خاص بالسيارات).

• بطاقة اشتراك 10 مرات موقف: 
  10 يورو، صالحة لمدة سنة (تُطلب من شباك التذاكر).''',
        'histoireLabel': 'القصة والتاريخ المفصل',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق بعناية من حالة الطقس وأسعار التذاكر ومواعيد الإغلاق قبل زيارة قصر شامبور.',
        'chateauInfo': {
          'titre': 'Château de Chambord',
          'titreAffichage': 'قصر شامبور الملكي',
          'image': 'assets/chateaux/cham/2.jpg',
          'typeAcces': 'مدفوع / تذكرة دخول القصر والحدائق',
          'histoire': 'أمر الملك فرنسوا الأول ببدء تشييد قصر شامبور في عام 1519 لتخليد انتصاراته وتجسيد عظمة حكمه في عصر النهضة. لم يُصمم القصر ليكون مقراً إقامتياً دائماً، بل استُخدم كاستراحة صيد فخمة وموقع لاستعراض النفوذ أمام الملوك والوفود الأجنبية. يتميز المعمار بدمج مذهل بين العمارة القوطية الفرنسية التقليدية وتأثيرات عصر النهضة الإيطالية، ويحتوي على السلم الحلزوني المزدوج الشهير المستوحى من مخططات ليوناردو دا فينشي.',
          'saviezVous': 'يضم القصر سلماً حلزونياً مزدوجاً مذهلاً، يسمح لشخصين بالصعود وهبوط السلم في نفس الوقت دون أن يلتقيا على الإطلاق.',
          'photoAstuce': 'قف أمام الحدائق الفرنسية عند الغروب لالتقاط انعكاس واجهة القصر المهيبة على المياه، أو التقط صوراً رأسية ملفتة للسلم الحلزوني من الداخل.',
          'photosVerticales': [
            'assets/chateaux/cham/1.jpg',
            'assets/chateaux/cham/3.jpg',
            'assets/chateaux/cham/4.jpg',
          ]
        }
      };
    } else if (_currentLang == 'en') {
      return {
        'pageTitle': 'Château de Chambord: Renaissance Masterpiece',
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions at early, mid, and late month periods.',
        'legendeVert': '🟢 Green: Ideal period (low crowds, great weather, and reasonable prices)',
        'legendeOrange': '🟠 Orange: Moderate crowds (transition period, advance booking recommended)',
        'legendeRouge': '🔴 Red: Heavy crowds (peak tourism, very high prices)',
        'legendeGris': '⚪ Grey: Low season period (cooler or rainy weather, but ideal for avoiding massive crowds)',
        'horairesTitle': 'Opening Hours & Closures',
        'horairesContent': '''
• High Season (April - October): 
  9:00 am – 6:00 pm.

• Low Season (November - March): 
  9:00 am – 5:00 pm.

• Last Entry: 
  30 minutes before castle closing time.

• Annual Closure: 
  January 1st and December 25th only.''',
        'parkingTitle': 'Parking Information & Rates',
        'parkingContent': '''
• Parking Access: 
  Open 24/7 (No advance booking needed).

• Payment Methods: 
  - Cash: Available at main reception hall (9:00 am - 5:30 pm in summer / 4:30 pm in winter).
  - Credit Card: Available 24/7 at automated pay stations.

• Parking P0 (600m from castle - Height < 2.10m): 
  €8 / day (Free for disabled visitors with proof and ticket).

• Parking P1 (600m from castle - Buses & Coaches): 
  Minibuses: €15 / day | Coaches: €100 / day.

• Parking P2 (750m from castle): 
  Cars: €8 / day | Motorhomes & High Vehicles: €15 / 24h (No water/electricity hookups).

• Parking P3 (850m from castle): 
  €8 / day (Cars only).

• 10-Pass Parking Card: 
  €10, valid for 1 year (Available at ticket counters).''',
        'histoireLabel': 'Detailed History & Riches',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Attention: Please carefully check weather forecasts, parking fees, and seasonal hours before visiting Chambord.',
        'chateauInfo': {
          'titre': 'Château de Chambord',
          'titreAffichage': 'The Royal Château de Chambord',
          'image': 'assets/chateaux/cham/2.jpg',
          'typeAcces': 'Paid / Castle & Gardens Admission',
          'histoire': 'Construction of Chambord began in 1519 under King Francis I to celebrate his military victories and showcase French Renaissance grandeur. Never intended as a permanent residence, it functioned as a grand hunting lodge and short-term royal reception venue. Its architecture fuses traditional French medieval forms with Italian Renaissance innovation, highlighted by the central double-helix staircase designed after ideas by Leonardo da Vinci.',
          'saviezVous': 'The castle features a world-famous double-helix staircase, allowing two people to ascend and descend simultaneously without ever crossing paths.',
          'photoAstuce': 'Capture stunning vertical compositions of the intricate roof lanterns or frame the main facade from across the moat at sunset.',
          'photosVerticales': [
            'assets/chateaux/cham/1.jpg',
            'assets/chateaux/cham/3.jpg',
            'assets/chateaux/cham/4.jpg',
          ]
        }
      };
    } else {
      return {
        'pageTitle': 'Château de Chambord : Joyau de la Renaissance',
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Mi-mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Veuillez vérifier la météo début mois, mi-mois et fin mois.',
        'legendeVert': '🟢 Vert : Période idéale (peu d’affluence, météo agréable et tarifs avantageux)',
        'legendeOrange': '🟠 Orange : Affluence modérée (période de transition, réservation conseillée)',
        'legendeRouge': '🔴 Rouge : Forte affluence (pic touristique, prix très élevés)',
        'legendeGris': '⚪ Gris : Basse saison (météo fraîche ou pluvieuse, mais idéal pour éviter la foule)',
        'horairesTitle': 'Horaires d\'ouverture',
        'horairesContent': '''
• Haute Saison (Avril - Octobre) : 
  De 9h00 à 18h00.

• Basse Saison (Novembre - Mars) : 
  De 9h00 à 17h00.

• Dernier accès : 
  30 minutes avant la fermeture du château.

• Fermetures annuelles : 
  1er janvier et 25 décembre uniquement.''',
        'parkingTitle': 'Informations & Tarifs Parkings',
        'parkingContent': '''
• Accès aux parkings : 
  Ouverts 24h/24 (aucune réservation nécessaire).

• Modes de règlement : 
  - Espèces : En Halle d'accueil (9h00 - 17h30 en été / 16h30 en hiver).
  - Carte bancaire : 24h/24 aux bornes automatiques.

• Parking P0 (à 600m du château - Hauteur < 2,10 m) : 
  8 € / jour (Gratuit pour PMR sur présentation du justificatif).

• Parking P1 (à 600m du château - Bus & Minibus) : 
  Minibus : 15 € / jour | Autocars : 100 € / jour.

• Parking P2 (à 750m du château) : 
  Voitures : 8 € / jour | Camping-cars : 15 € / 24h (sans eau/électricité).

• Parking P3 (à 850m du château) : 
  8 € / jour (Voitures uniquement).

• Pass 10 stationnements : 
  10 €, valable 1 an (disponible en billetterie).''',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez attentivement la météo ainsi que les tarifs et horaires du château de Chambord, car les conditions peuvent varier au fil de l’année.',
        'chateauInfo': {
          'titre': 'Château de Chambord',
          'titreAffichage': 'Le château de Chambord',
          'image': 'assets/chateaux/cham/2.jpg',
          'typeAcces': 'Payant / Billet d\'entrée au château',
          'histoire': 'Mis en chantier en 1519 à l\'initiative du roi François Ier, le château de Chambord devait célébrer la gloire du souverain au retour de ses campagnes d\'Italie. Conçu non pas comme un lieu de résidence habituel mais comme un prestigieux relais de chasse, il impressionnait les ambassadeurs et souverains invités. Son architecture unique mêle les traditions féodales françaises aux innovations majeures de la Renaissance italienne, incarnées notamment par son spectaculaire escalier à double révolution inspiré des esquisses de Léonard de Vinci.',
          'saviezVous': 'Saviez-vous que le château abrite un escalier central à double révolution, conçu pour que deux personnes puissent monter et descendre en même temps sans jamais se croiser ?',
          'photoAstuce': 'Pour capturer toute la magnificence du château, privilégiez des angles verticaux sur les nombreuses tours et tourelles, ou prenez du recul le long des canaux au coucher du soleil.',
          'photosVerticales': [
            'assets/chateaux/cham/1.jpg',
            'assets/chateaux/cham/3.jpg',
            'assets/chateaux/cham/4.jpg',
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
    final data = _getLocalizedChateauData();
    final months = data['months'] as List;
    final chateauInfo = data['chateauInfo'] as Map<String, dynamic>;
    final verticalPhotos = chateauInfo['photosVerticales'] as List<String>;

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
                  // Ligne 1 : Bouton retour et Titre sur toute la largeur
                  Row(
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // En dessous : Langue uniquement
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // BOUTON DE CHANGEMENT DE LANGUE ULTRA JOLIE
                      GestureDetector(
                        onTap: _toggleLanguage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                _currentColor.withOpacity(0.25),
                                _currentColor.withOpacity(0.05),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: _currentColor.withOpacity(0.6),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: _currentColor.withOpacity(0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.language,
                                color: _currentColor,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                _currentLang.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
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
                      chateauInfo['image'],
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

                  // AVERTISSEMENT MÉTÉO
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
                          chateauInfo['titreAffichage'],
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
                            chateauInfo['typeAcces'],
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

                  // 2. HISTOIRE DÉTAILLÉE
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
                          chateauInfo['histoire'],
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
                      onPressed: () => _openMap(chateauInfo['titre']),
                      icon: const Icon(Icons.map, size: 18),
                      label: Text(
                        data['mapsLabel'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. SAVIEZ-VOUS ?
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
                            Text(
                              data['saviezVousLabel'],
                              style: const TextStyle(
                                color: Colors.amber,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chateauInfo['saviezVous'],
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

                  // 4. ASTUCE PHOTO
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
                            Text(
                              data['photoAstuceLabel'],
                              style: const TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          chateauInfo['photoAstuce'],
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

                  // 5. CALENDRIER D'AFFLUENCE
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
                                      Column(
                                        children: [
                                          Text(data['periodStart'], style: const TextStyle(color: Colors.white54, fontSize: 10)),
                                          const SizedBox(height: 4),
                                          Container(width: 16, height: 16, decoration: BoxDecoration(color: m['top'], shape: BoxShape.circle)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(data['periodMid'], style: const TextStyle(color: Colors.white54, fontSize: 10)),
                                          const SizedBox(height: 4),
                                          Container(width: 16, height: 16, decoration: BoxDecoration(color: m['mid'], shape: BoxShape.circle)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(data['periodEnd'], style: const TextStyle(color: Colors.white54, fontSize: 10)),
                                          const SizedBox(height: 4),
                                          Container(width: 16, height: 16, decoration: BoxDecoration(color: m['bot'], shape: BoxShape.circle)),
                                        ],
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

                  // 6. HORAIRES D'OUVERTURE
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
                        Row(
                          children: [
                            Icon(Icons.access_time, color: _currentColor, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              data['horairesTitle'],
                              style: TextStyle(
                                color: _currentColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['horairesContent'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 12,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 7. PARKINGS & TARIFS
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
                        Row(
                          children: [
                            Icon(Icons.local_parking, color: _currentColor, size: 18),
                            const SizedBox(width: 8),
                            Text(
                              data['parkingTitle'],
                              style: TextStyle(
                                color: _currentColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['parkingContent'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 12,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 8. GALERIE PHOTOS VERTICALES
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
}