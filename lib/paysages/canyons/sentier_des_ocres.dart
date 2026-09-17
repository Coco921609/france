import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class SentierDesOcresPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const SentierDesOcresPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<SentierDesOcresPage> createState() => _SentierDesOcresPageState();
}

class _SentierDesOcresPageState extends State<SentierDesOcresPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    // Utiliser la couleur passée en paramètre
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant SentierDesOcresPage oldWidget) {
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
    // Top (Début), Mid (Milieu), Bot (Fin)
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Hiver = gris/froid)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février
      {'top': Colors.grey, 'mid': Colors.green, 'bot': Colors.green},     // Mars
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril (Printemps = Top)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.red},    // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet (Été = chaud/fréquenté)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août
      {'top': Colors.red, 'mid': Colors.orange, 'bot': Colors.green},     // Septembre
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Octobre (Automne = Top)
      {'top': Colors.green, 'mid': Colors.grey, 'bot': Colors.grey},      // Novembre
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
        'title': 'مسار المغرة 🏜️',
        'pageTitle': 'مسار المغرة : أريزونا الفرنسية',
        'introTitle': '🇺🇸 جو من أريزونا في فرنسا',
        'introText': 'تخيل أنك نُقلت إلى قلب الغرب المتوحش دون أن تغادر فرنسا. في روسيون، تشتعل الأرض لتكشف عن منحدرات منحوتة بظلال نارية. 🎨',
        'translationsTitle': 'الترجمات الجغرافية',
        'translations': [
          ['أورس ', 'صبغة أرضية طبيعية حمراء-صفراء'],
          ['روسيلون', 'قرية معروفة بألوانها النارية'],
        ],
        'saisonsTitle': '📅 أفضل المواسم والأجواء',
        'saisonHeader': 'الحالة',
        'conseilsHeader': 'المواسم والأجواء',
        'saisons': [
          ['✅ الأفضل', 'الخريف (أشجار ذهبية) والربيع'],
          ['☀️ جيد', 'الصيف (رائع لكن شديد الحرارة)'],
          ['❌ تجنب', 'الشتاء (كئيب وبارد)'],
        ],
        'horairesTitle': '⏰ الأوقات المنصوح بها',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ مثالي', 'في الصباح الباكر أو بعد 5 مساءً (صيف/ربيع)'],
          ['🌅 ممتاز', '11 صباحاً - 3 مساءً (خريف/شتاء)'],
          ['🚫 تجنب', '12 ظهراً - 4 مساءً في منتصف الصيف'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.map_outlined, "🧭 مساران (30 أو 60 دقيقة)"],
          [Icons.directions_run, "👟 وداعاً للأحذية البيضاء!"],
          [Icons.water_drop_outlined, "زجاجة مياه ضرورية"],
          [Icons.euro_symbol, "🎟️ السعر: ~3.50 يورو (يجب التحقق)"],
          [Icons.cleaning_services_rounded, "أحذية داكنة (المغرة تترك بقعاً)"],
          [Icons.no_food_outlined, "يمنع التنزه وتناول الطعام في الموقع"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس وشروط الوصول لجولة آمنة وممتعة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الألوان والزوار (حرارة الصيف العالية)',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: احذر من درجات الحرارة المرتفعة جداً في الصيف. تحقق دائماً من الطقس.',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['أنتيلوب كانيون (أريزونا، أمريكا) 🇺🇸', 'أخدود من الحجر الرملي بألوان مذهلة تذكرنا بمنحدرات روسيون.'],
          ['برايس كانيون (يوتا، أمريكا) 🇺🇸', 'مدرجات طبيعية من المداخن الصخرية العملاقة النارية.'],
          ['وادي القمر (أتاكاما، تشيلي) 🇨🇱', 'تكوينات صخرية فريدة في الصحراء تشبه ألوان المغرة.']
        ],
        'altInfo': {
          'titre': 'Sentier des Ocres, Roussillon',
          'titreAffichage': 'مسار المغرة - روسيون',
          'image': 'assets/images/des-ocres-des-couleurs.jpg',
          'typeAcces': 'رسوم الدخول: ~3.50€ / روسيون، فرنسا',
          'histoire': 'يقع مسار المغرة في قلب جبال لوبيرون. لقد تم تشكيله من خلال التآكل الطبيعي واستغلال الإنسان قديماً للمغرة. يوفر الموقع لوحة رائعة من الرمال والألوان، مما يجعله واحداً من أبرز المناظر الطبيعية في أوروبا.',
          'saviezVous': 'هل تعلم أن المغرة هي صبغة طبيعية استُخدمت منذ عصور ما قبل التاريخ لرسم اللوحات الجدارية في الكهوف، ولا تزال تحظى بتقدير كبير في الفن الحديث.',
          'photoAstuce': 'استفد من "الساعة الذهبية" (شروق أو غروب الشمس) لإبراز التباين بين الصخور البرتقالية المحترقة والسماء الزرقاء الصافية.',
          'photosVerticales': [
            'assets/images/des-ocres-des-couleurs (1).jpg',
            'assets/images/photo0jpg.jpg',
            'assets/images/de-belles-couleurs.jpg',
            'assets/images/photo4jpg.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Sentier des Ocres 🏜️',
        'pageTitle': 'Sentier des Ocres : A touch of Arizona',
        'introTitle': '🇺🇸 An Arizona vibe in France',
        'introText': "Imagine being transported to the heart of the Wild West without even leaving France. In Roussillon, the earth catches fire to reveal sculpted cliffs in shades of fire. 🎨",
        'translationsTitle': 'Geographical Translations',
        'translations': [
          ['Ochre', 'Natural red-yellow earthy pigment'],
          ['Roussillon', 'Village famous for its fiery colors'],
        ],
        'saisonsTitle': '📅 Best Seasons & Ambience',
        'saisonHeader': 'Status',
        'conseilsHeader': 'Season & Ambience',
        'saisons': [
          ['✅ Top', 'Autumn (Golden trees) & Spring'],
          ['☀️ Ok', 'Summer (Magnificent but very hot)'],
          ['❌ Avoid', 'Winter (Gloomy and cold)'],
        ],
        'horairesTitle': '⏰ Recommended Times',
        'momentHeader': 'Time',
        'horaires': [
          ['✨ Ideal', 'Early morning or after 5pm (Summer/Spring)'],
          ['🌅 Top', '11am - 3pm (Autumn/Winter)'],
          ['🚫 Avoid', '12pm - 4pm in mid-summer'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.map_outlined, "🧭 2 trails (30 or 60 min)"],
          [Icons.directions_run, "👟 Goodbye white sneakers!"],
          [Icons.water_drop_outlined, "Water bottle is essential"],
          [Icons.euro_symbol, "🎟️ Price: ~3.50€ (to be checked)"],
          [Icons.cleaning_services_rounded, "Dark shoes (ochre stains)"],
          [Icons.no_food_outlined, "Picnics forbidden on site"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions and access rules for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, caution or early arrival advised',
        'legendeRouge': '🔴 Red: Peak colors and visitors (Extreme summer heat)',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Beware of extreme heat during the summer. Always check weather forecasts.',
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Antelope Canyon (Arizona, USA) 🇺🇸', 'Navajo sandstone canyon with spectacular colors reminiscent of Roussillon.'],
          ['Bryce Canyon (Utah, USA) 🇺🇸', 'Natural amphitheaters of giant, fiery hoodoos.'],
          ['Valle de la Luna (Atacama, Chile) 🇨🇱', 'Unique desert rock formations resembling the ochre lands.']
        ],
        'altInfo': {
          'titre': 'Sentier des Ocres, Roussillon',
          'titreAffichage': 'Sentier des Ocres - Roussillon',
          'image': 'assets/images/des-ocres-des-couleurs.jpg',
          'typeAcces': 'Entry fee: ~3.50€ / Roussillon, France',
          'histoire': "Located in the heart of the Luberon, the Sentier des Ocres was shaped by both natural erosion and historical human ochre mining. It offers a fascinating palette of sands and colors, making it one of Europe's most striking landscapes.",
          'saviezVous': "Did you know that ochre is a natural pigment that has been used since prehistoric times for cave paintings and remains highly prized in modern art.",
          'photoAstuce': "Take advantage of the 'golden hour' (sunrise or sunset) to capture the stunning contrast between the burnt orange rocks and the deep blue sky.",
          'photosVerticales': [
            'assets/images/des-ocres-des-couleurs (1).jpg',
            'assets/images/photo0jpg.jpg',
            'assets/images/de-belles-couleurs.jpg',
            'assets/images/photo4jpg.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Sentier des Ocres 🏜️',
        'pageTitle': 'Sentier des Ocres : Un air d\'Arizona',
        'introTitle': '🇺🇸 Un air d\'Arizona aux USA',
        'introText': "Imaginez-vous transporté au cœur du Far West, sans même quitter l'Hexagone. À Roussillon, la terre s'embrase pour dévoiler des falaises sculptées aux nuances de feu. 🎨",
        'translationsTitle': 'Traductions géographiques',
        'translations': [
          ['Ocre', 'Pigment naturel terreux rouge-jaune'],
          ['Roussillon', 'Village réputé pour ses couleurs de feu'],
        ],
        'saisonsTitle': '📅 Calendrier de visite',
        'saisonHeader': 'Statut',
        'conseilsHeader': 'Saisons & Ambiance',
        'saisons': [
          ['✅ Top', 'Automne (Arbres d\'or) & Printemps'],
          ['☀️ Ok', 'Été (Magnifique mais très chaud)'],
          ['❌ Éviter', 'Hiver (Grisaille et froid)'],
        ],
        'horairesTitle': '⏰ Créneaux horaires',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Idéal', 'Tôt le matin ou +17h (Été/Pr)'],
          ['🌅 Top', '11h - 15h (Automne/Hiver)'],
          ['🚫 Éviter', '12h - 16h en plein été'],
        ],
        'galerieTitle': '📸 Aperçu du lieu',
        'infosTitle': '📋 Indispensables & Infos',
        'infos': [
          [Icons.map_outlined, "🧭 2 parcours (30 ou 60 min)"],
          [Icons.directions_run, "👟 Adieu les baskets blanches !"],
          [Icons.water_drop_outlined, "Gourde d'eau indispensable"],
          [Icons.euro_symbol, "🎟️ Tarif : ~3,50€ (à vérifier)"],
          [Icons.cleaning_services_rounded, "Chaussures sombres (l'ocre tâche)"],
          [Icons.no_food_outlined, "Pique-nique interdit sur site"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Chaleur estivale extrême',
        'legendeGris': '⚪ Basse saison / Météo fraîche ou hivernale',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Prenez garde à la chaleur extrême en plein été. Prévoyez toujours de l\'eau.',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'similarPlacesTitle': '🌍 Endroits similaires à travers le monde',
        'similarPlaces': [
          ['Antelope Canyon (Arizona, États-Unis) 🇺🇸', 'Canyon de grès Navajo aux couleurs spectaculaires rappelant Roussillon.'],
          ['Bryce Canyon (Utah, États-Unis) 🇺🇸', 'Amphithéâtres naturels formés de cheminées de fées géantes et flamboyantes.'],
          ['Valle de la Luna (Atacama, Chili) 🇨🇱', 'Formations rocheuses désertiques uniques rappelant les terres ocres.']
        ],
        'altInfo': {
          'titre': 'Sentier des Ocres, Roussillon',
          'titreAffichage': 'Sentier des Ocres - Roussillon',
          'image': 'assets/images/des-ocres-des-couleurs.jpg',
          'typeAcces': 'Entrée payante : ~3,50€ / Roussillon, France',
          'histoire': "Situé au cœur du Luberon, le Sentier des Ocres a été façonné par l'érosion naturelle et l'exploitation historique de l'ocre par l'homme. Le site offre une fabuleuse palette de sables et de couleurs, ce qui en fait l'un des paysages les plus dépaysants d'Europe.",
          'saviezVous': "Saviez-vous que l'ocre est un pigment naturel utilisé depuis la préhistoire pour les peintures rupestres, et qu'il reste très prisé dans l'art moderne.",
          'photoAstuce': "Profitez de la « golden hour » (lever ou coucher du soleil) pour saisir le contraste saisissant entre la roche orange brûlée et le ciel bleu azur.",
          'photosVerticales': [
            'assets/images/des-ocres-des-couleurs (1).jpg',
            'assets/images/photo0jpg.jpg',
            'assets/images/de-belles-couleurs.jpg',
            'assets/images/photo4jpg.jpg',
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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL (SANS FAVORIS)[cite: 10]
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

                  // 1. BIS - TRADUCTIONS GÉOGRAPHIQUES
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

                  // 5. BIS - ENDROITS SIMILAIRES (Internationaux)
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

  Widget _buildTranslationLine(String word, String analogie, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              word,
              style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 8),
          Expanded(
            flex: 3,
            child: Text(
              analogie,
              style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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