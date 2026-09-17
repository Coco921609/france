import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class OrguesIlleSurTetPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const OrguesIlleSurTetPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<OrguesIlleSurTetPage> createState() => _OrguesIlleSurTetPageState();
}

class _OrguesIlleSurTetPageState extends State<OrguesIlleSurTetPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant OrguesIlleSurTetPage oldWidget) {
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
      {'top': Colors.orange, 'mid': Colors.green, 'bot': Colors.green},   // Mars (Printemps)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril (Idéal)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.red},    // Juin (Chaleur / Affluence)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet (Pic affluence & chaleur)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août (Pic affluence & chaleur)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Septembre (Idéal)
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Octobre (Automne)
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
        'title': 'أورغ إيل سور تيت 🏜️',
        'pageTitle': 'أورغ إيل سور تيت : الوادي الكاتالوني',
        'introTitle': '🇹🇷 الغرب الأمريكي في البرانيس الشرقية',
        'introText': 'منظر طبيعي معدني فريد في فرنسا. تقدم مداخن الفراشات المنحوتة بفعل التعرية ديكورًا قمريًا يذكرنا بالأودية الأمريكية أو كابادوكيا.',
        'translationsTitle': 'معاني التسميات والمصطلحات',
        'translations': [
          ['أرغن', 'أنابيب صخرية منحوتة'],
          ['إيل سور تيت', 'بلدية في البرانيس الشرقية'],
          ['مداخن الجن', 'مداخن الجنيات / أعمدة سديمية'],
        ],
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'الأجواء والتوصيات',
        'saisons': [
          ['🌸 الربيع', 'مثالي (مناخ معتدل وضوء جميل)'],
          ['🍂 الخريف', 'موصى به (ألوان مغرة متوهجة)'],
          ['☀️ الصيف', 'تجنب الزيارة بعد الظهيرة (حرارة شديدة)'],
          ['❄️ الشتاء', 'ممکن (إطلالة واضحة على جبل كانيجو)'],
        ],
        'horairesTitle': '⏰ الأوقات والمدد',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ الصباح', 'زيارة منعشة وازدحام أقل'],
          ['☀️ منتصف النهار', 'حار جداً صيفاً، يرجى التزود بالماء'],
          ['🌅 المساء', 'إضاءة رائعة على الصخور المغرة'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.confirmation_number_outlined, "يُفضل الشراء عبر الإنترنت"],
          [Icons.timer_outlined, "مدة الجولة حوالي ساعة واحدة (45 دقيقة إلى ساعة ونصف)"],
          [Icons.wb_sunny_outlined, "ظلال قليلة، يرجى إحضار قبعة وماء"],
          [Icons.camera_enhance_outlined, "إضاءة مثالية في نهاية اليوم"],
          [Icons.map_outlined, "تقع في إيل سور تيت (البرانيس الشرقية)"],
          [Icons.attach_money, "التذكرة العادية: 5,00 € (المخفضة: 4,00 €)"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل أو حرارة مرتفعة',
        'legendeRouge': '🔴 أحمر : ذروة الزوار والحرارة الصيفية',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: الأسعار إرشادية. يرجى التزود بالماء والقبعات في الصيف لقلة الظل.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['كابادوكيا (تركيا) 🇹🇷', 'أودية مذهلة من مداخن الجنيات المنحوتة بفعل التعرية في قلب الأناضول.'],
          ['برايس كانيون (أمريكا) 🇺🇸', 'مسرح طبيعي ضخم مليء بآلاف الأعمدة الصخرية الملونة.'],
          ['بارديناس رياليس (إسبانيا) 🇪🇸', 'منظر طبيعي شبه صحراوي يتميز بتكوينات صخرية متآكلة ومداخن الجنيات.']
        ],
        'altInfo': {
          'titre': "Orgues d'Ille-sur-Tet",
          'titreAffichage': "Orgues d'Ille-sur-Têt - مداخن الجنيات",
          'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
          'typeAcces': 'دخول بتذكرة / البرانيس الشرقية',
          'histoire': "تعتبر أورغ إيل سور تيت نتيجة لتعرية الصخور الرسوبية التي يعود تاريخها إلى 4 ملايين سنة. تشكل هذه المنحدرات الرملية والطينية أعمدة هشة تسمى مداخن الجنيات نحتتها المياه والرياح.",
          'saviezVous': "تتكون هذه المناظر الخلابة من الرمال والطين التي جرفتها الأنهار من جبال البرانيس قبل أن تصقلها الأمطار على مدى آلاف السنين.",
          'photoAstuce': "التقط الصور من أسفل الأعمدة لإبراز ارتفاع مداخن الجنيات الشاهقة تحت السماء الزرقاء.",
          'photosVerticales': [
            'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
            'assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif',
            'assets/images/orgues-ille-sur-tet-55.jpg',
            'assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': "Orgues of Ille-sur-Têt 🏜️",
        'pageTitle': "Orgues d'Ille-sur-Têt : The Catalan Canyon",
        'introTitle': "🇹🇷 The Wild West of Eastern Pyrenees",
        'introText': "A unique mineral landscape in France. These fairy chimneys carved by erosion offer a lunar scenery reminiscent of American canyons or Cappadocia.",
        'translationsTitle': 'Name Meaning & Terms',
        'translations': [
          ['Orgues', 'Pipe organs / Stone columns'],
          ['Ille-sur-Têt', 'Town in Pyrénées-Orientales'],
          ['Fairy chimneys', 'Fairy chimneys / Earth pyramids'],
        ],
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Ambience & Advice',
        'saisons': [
          ['🌸 Spring', 'Ideal (mild climate and beautiful light)'],
          ['🍂 Autumn', 'Recommended (flamboyant ochre colors)'],
          ['☀️ Summer', 'Avoid afternoon (intense heat)'],
          ['❄️ Winter', 'Possible (clear view of Mount Canigou)'],
        ],
        'horairesTitle': '⏰ Recommended Times & Duration',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Morning', 'Cool visit and fewer crowds'],
          ['☀️ Noon', 'Very hot in summer, bring water'],
          ['🌅 Evening', 'Magnificent low light on the ochre'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.confirmation_number_outlined, "Online ticket booking recommended"],
          [Icons.timer_outlined, "Plan about 1h walk (45 min - 1h30)"],
          [Icons.wb_sunny_outlined, "Little shade, bring hat and water"],
          [Icons.camera_enhance_outlined, "Ideal light late in the day"],
          [Icons.map_outlined, "Located in Ille-sur-Têt (Pyrénées-Orientales)"],
          [Icons.attach_money, "Adult ticket: €5.00 (reduced: €4.00)"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Prices are indicative. Bring water and hats in summer due to minimal shade.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds or high summer heat',
        'legendeRouge': '🔴 Red: Peak visitors and high temperatures',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Check weather conditions before visiting. High sun exposure during summer.',
        'histoireLabel': 'Detailed History & Geological Origin',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Cappadocia (Turkey) 🇹🇷', 'Spectacular valleys of fairy chimneys sculpted by erosion in Anatolia.'],
          ['Bryce Canyon (USA) 🇺🇸', 'A vast natural amphitheater filled with thousands of colorful rock hoodoos.'],
          ['Bardenas Reales (Spain) 🇪🇸', 'A semi-desert landscape with eroded rock formations and fairy chimneys.']
        ],
        'altInfo': {
          'titre': "Orgues d'Ille-sur-Tet",
          'titreAffichage': "Orgues d'Ille-sur-Têt - Fairy Chimneys",
          'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
          'typeAcces': 'Paid admission / Pyrénées-Orientales',
          'histoire': "The Orgues d'Ille-sur-Têt result from the erosion of 4-million-year-old sedimentary rocks. Carved by wind and rain, these sand and clay cliffs form delicate columns called fairy chimneys.",
          'saviezVous': "This fairy landscape consists of sand and clay carried down from the Pyrenees by ancient rivers before being shaped by rain for millennia.",
          'photoAstuce': "Position yourself at a low angle at the base of the columns to emphasize the height of the organs under the blue Roussillon sky.",
          'photosVerticales': [
            'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
            'assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif',
            'assets/images/orgues-ille-sur-tet-55.jpg',
            'assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg',
          ]
        }
      };
    } else {
      return {
        'title': "Les Orgues d'Ille 🏜️",
        'pageTitle': "Orgues d'Ille-sur-Têt : Le Canyon Catalan",
        'introTitle': "🇹🇷 Le Far West des Pyrénées-Orientales",
        'introText': "Un paysage minéral unique en France. Ces cheminées de fées sculptées par l'érosion offrent un décor lunaire qui rappelle les canyons américains ou la Cappadoce.",
        'translationsTitle': 'Comprendre les appellations',
        'translations': [
          ['Orgues', 'Colonnes rocheuses façon tuyaux d\'orgue'],
          ['Ille-sur-Têt', 'Commune des Pyrénées-Orientales'],
          ['Cheminées de fées', 'Pylônes d\'argile et de sable sculptés'],
        ],
        'saisonsTitle': '📅 Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Ambiance & Recommandation',
        'saisons': [
          ['🌸 Printemps', 'Idéal (climat doux et belle lumière)'],
          ['🍂 Automne', 'Recommandé (couleurs ocre flamboyantes)'],
          ['☀️ Été', 'À éviter l\'après-midi (forte chaleur)'],
          ['❄️ Hiver', 'Possible (vue dégagée sur le Canigou)'],
        ],
        'horairesTitle': '⏰ Horaires & Conseils de visite',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Matin', 'Visite au frais et moins d\'attente'],
          ['☀️ Midi', 'Très chaud en été, peu d\'ombre'],
          ['🌅 Soir', 'Lumière rasante sublime sur le sable ocre'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.confirmation_number_outlined, "Achat en ligne recommandé"],
          [Icons.timer_outlined, "Prévoir environ 45 min à 1h30 de visite"],
          [Icons.wb_sunny_outlined, "Peu d'ombre, prévoir eau et chapeau"],
          [Icons.camera_enhance_outlined, "Lumière idéale en fin de journée"],
          [Icons.map_outlined, "Situé à Ille-sur-Têt (Pyrénées-Orientales)"],
          [Icons.attach_money, "Tarif : 5,00 € (réduit : 4,00 € / enfant : 3,50 €)"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Les tarifs et créneaux sont donnés à titre indicatif.',
        'legendeVert': '🟢 Vert : Période idéale (températures douces, visite agréable)',
        'legendeOrange': '🟠 Affluence modérée / Forte chaleur l\'après-midi',
        'legendeRouge': '🔴 Forte affluence touristique et températures élevées',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Site très exposé au soleil. Prévoyez de l\'eau et privilégiez le matin en période estivale.',
        'histoireLabel': 'Histoire et géologie du site',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires aux Orgues dans le monde',
        'similarPlaces': [
          ['Cappadoce (Turquie) 🇹🇷', 'Des vallées spectaculaires de cheminées de fées sculptées par l’érosion au cœur de l’Anatolie.'],
          ['Bryce Canyon (États-Unis) 🇺🇸', 'Un amphithéâtre naturel rempli de milliers de colonnes rocheuses colorées (hoodoos).'],
          ['Bardenas Reales (Espagne) 🇪🇸', 'Un paysage semi-désertique avec des formations rocheuses érodées et des cheminées de fées.']
        ],
        'altInfo': {
          'titre': "Orgues d'Ille-sur-Tet",
          'titreAffichage': "Les Orgues d'Ille-sur-Têt - Cheminées de Fées",
          'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
          'typeAcces': 'Entrée payante / Pyrénées-Orientales',
          'histoire': "Les Orgues d'Ille-sur-Têt sont le résultat de l'érosion de roches sédimentaires âgées de 4 millions d'années. Sculptées par l'eau et le vent, ces falaises de sable et d'argile forment d'éphémères colonnes sculptées appelées cheminées de fées.",
          'saviezVous': "Ce paysage féerique est constitué de sédiments arrachés aux Pyrénées par les fleuves préhistoriques avant d'être façonnés par les pluies pendant des millénaires.",
          'photoAstuce': "Placez-vous en contre-plongée au pied des colonnes pour accentuer l'effet de hauteur des orgues sous le ciel bleu du Roussillon.",
          'photosVerticales': [
            'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
            'assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif',
            'assets/images/orgues-ille-sur-tet-55.jpg',
            'assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg',
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
                                Expanded(
                                  flex: 3,
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
                                  flex: 7,
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
                      _buildGalleryImage('assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg'),
                      _buildGalleryImage('assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif'),
                      _buildGalleryImage('assets/images/orgues-ille-sur-tet-55.jpg'),
                      _buildGalleryImage('assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg'),
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

  Widget _buildTranslationLine(String mainWord, String translation, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Text(mainWord, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          ),
          const SizedBox(width: 12),
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Text(translation, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15)),
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