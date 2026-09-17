import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class PalaisIdealPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const PalaisIdealPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<PalaisIdealPage> createState() => _PalaisIdealPageState();
}

class _PalaisIdealPageState extends State<PalaisIdealPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant PalaisIdealPage oldWidget) {
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
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.green},    // Avril (Printemps)
      {'top': Colors.green, 'mid': Colors.orange, 'bot': Colors.orange},  // Mai
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juin
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Juillet
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Août
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Septembre
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.orange},    // Octobre (Automne)
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
        'title': 'القصر المثالي 🏰',
        'pageTitle': 'القصر المثالي : تحفة عامل البريد شيفال',
        'introTitle': '🇰🇭 لمحة من كمبوديا في قلب منطقة دوروم',
        'introText': 'بناه رجل واحد فقط، عامل البريد فرديناند شيفال، هذا القصر هو معلم فريد من نوعه في العالم. تذكرنا واجهاته المنحوتة المعابد الهندوسية والعمارة العضوية في جنوب شرق آسيا.',
        'analogieVille': 'هوتريف (Hauterives)',
        'analogieTemples': 'معابد أنغكور (كمبوديا)',
        'tarifsTitle': '🎫 الأسعار العامة',
        'tarifsNote': '⚠️ تنبيه: الأسعار قابلة للتغيير حسب الموسم.',
        'tarifsRest': '*تخفيض: الطلاب، الباحثون عن عمل، ذوو الاحتياجات الخاصة.',
        'tarifsGroupesTitle': '👥 أسعار المجموعات',
        'saisonsTitle': '📅 أفضل المواسم',
        'saisonHeader': 'الموسم',
        'conseilsHeader': 'النصيحة / الأجواء',
        'saisons': [
          ['🌸 الربيع', 'مثالي: درجات حرارة معتدلة'],
          ['🍂 الخريف', 'رائع مع الألوان الكهرمانية'],
          ['☀️ الصيف', 'زحام شديد، يُفضل الصباح'],
          ['❄️ الشتاء', 'هادئ ولكن بارد جداً (دوروم)'],
        ],
        'horairesTitle': '⏰ أوقات الزيارة',
        'momentHeader': 'الوقت',
        'horaires': [
          ['✨ الصباح', 'موصى به: إضاءة ناعمة'],
          ['🕛 12 ظهراً - 2 عصراً', 'حشود أقل'],
          ['🕓 بعد الظهر', 'للتجنب: ازدحام شديد'],
        ],
        'tarifsData': [
          ['الفئة', 'السعر'],
          ['بالغ', '8 يورو'],
          ['مخفض*', '6 يورو'],
          ['أطفال (3-16 سنة)', '5 يورو'],
          ['أقل من 5 سنوات', 'مجاناً'],
          ['دليل صوتي', '+ 2 يورو'],
        ],
        'groupesData': [
          ['نوع المجموعة', 'السعر'],
          ['أطفال (+15 شخصاً)', '4 يورو / طفل'],
          ['سائقي الحافلات', 'مجاناً'],
        ],
        'galerieTitle': '📸 لمحة عن المكان',
        'infosTitle': '📋 الضروريات والمعلومات',
        'infos': [
          [Icons.camera_enhance_outlined, "كاميرا ضرورية جداً لالتقاط الصور"],
          [Icons.map_outlined, "يقع في هوتريف (دوروم)"],
          [Icons.language, "يُصح بالحجز عبر الإنترنت"],
          [Icons.auto_awesome, "مصنف كمعلم تاريخي"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس لزيارة آمنة.',
        'legendeVert': '🟢 أخضر : فترة مثالية ومريحة للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل التبكير',
        'legendeRouge': '🔴 أحمر : ذروة الزوار والازحام',
        'legendeGris': '⚪ رمادي : موسم منخفض أو طقس بارد',
        'mapsLabel': 'فتح في الخرائط',
        'histoireLabel': 'قصة الموقع وتاريخه',
        'histoireText': 'كرس عامل البريد فرديناند شيفال 33 عاماً من حياته (1879-1912) لبناء هذا النصب الفريد مستوحى من الطبيعة والبطاقات البريدية التي كان يوزعها.',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'saviezVousText': 'جمع شيفال الحجارة أثناء جولاته اليومية لتوزيع البريد وبناها بيديه لتشكيل هذا القصر الخيالي.',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'photoAstuceText': 'التقط الصور تفاصيل التماثيل الصخرية المعقدة في الصباح الباكر للاستفادة من الظلال والضوء الطبيعي.',
        'similarPlacesTitle': '🌍 أماكن معمارية فريدة مشابهة حول العالم',
        'similarPlaces': [
          ['معابد أنغكور (سيام ريب، كمبوديا) 🇰🇭', 'المعابد الخميرية الأسطورية التي ألهمت بشدة الخيال المعماري لفرديناند شيفال.'],
          ['أبرار غاودي (برشلونة، إسبانيا) 🇪🇸', 'عمارة عضوية مذهلة مستوحاة من الأشكال الطبيعية تماماً مثل قصر الفعتر شيفال.'],
          ['أبراج واتس (لوس أنجلوس، أمريكا) 🇺🇸', 'منحوتات ضخمة فريدة أبدعها فرد واحد باستخدام مواد معاد تدويرها وأمشاج خرسانية.'],
        ],
        'altInfo': {
          'titre': 'Palais idéal du Facteur Cheval',
          'titreAffichage': 'القصر المثالي - عامل البريد شيفال',
          'image': 'assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg',
          'typeAcces': 'مفتوح للزيارة / هوتريف، فرانس',
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Palais idéal 🏰',
        'pageTitle': 'Palais idéal : The Facteur Cheval Masterpiece',
        'introTitle': '🇰🇭 A touch of Cambodia in the heart of Drôme',
        'introText': 'Built by a single man, postman Ferdinand Cheval, this palace is a unique monument in the world. Its sculpted facades recall Hindu temples and the organic architecture of Southeast Asia.',
        'analogieVille': 'Hauterives',
        'analogieTemples': 'Angkor Temples (Cambodia)',
        'tarifsTitle': '🎫 General Prices',
        'tarifsNote': '⚠️ Note: Prices are subject to change depending on the season.',
        'tarifsRest': '*Reduced: Students, job seekers, people with disabilities.',
        'tarifsGroupesTitle': '👥 Group Prices',
        'saisonsTitle': '📅 Best Seasons',
        'saisonHeader': 'Season',
        'conseilsHeader': 'Advice / Vibe',
        'saisons': [
          ['🌸 Spring', 'Ideal: Mild temperatures'],
          ['🍂 Autumn', 'Superb with amber colors'],
          ['☀️ Summer', 'Crowded, favor the morning'],
          ['❄️ Winter', 'Quiet but very cold (Drôme)'],
        ],
        'horairesTitle': '⏰ Visiting Hours',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Morning', 'Recommended: Soft light'],
          ['🕛 12 PM - 2 PM', 'Fewer crowds'],
          ['🕓 Afternoon', 'To avoid: High attendance'],
        ],
        'tarifsData': [
          ['Category', 'Price'],
          ['Adult', '8 €'],
          ['Reduced*', '6 €'],
          ['Children (3-16 yrs)', '5 €'],
          ['Under 5 yrs', 'Free'],
          ['Audioguide', '+ 2 €'],
        ],
        'groupesData': [
          ['Group Type', 'Price'],
          ['Children (+15 pers.)', '4 € / child'],
          ['Bus Drivers', 'Free'],
        ],
        'galerieTitle': '📸 Place Overview',
        'infosTitle': '📋 Essentials & Info',
        'infos': [
          [Icons.camera_enhance_outlined, "Camera indispensable"],
          [Icons.map_outlined, "Located in Hauterives (Drôme)"],
          [Icons.language, "Online booking recommended"],
          [Icons.auto_awesome, "Classified historic monument"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please check weather conditions for a safe trip.',
        'legendeVert': '🟢 Green: Ideal and quiet period',
        'legendeOrange': '🟠 Orange: Moderate crowds, early arrival advised',
        'legendeRouge': '🔴 Red: Peak visitors and high attendance',
        'legendeGris': '⚪ Grey: Low season or cool weather',
        'mapsLabel': 'Open in Maps',
        'histoireLabel': 'History and Background',
        'histoireText': 'Postman Ferdinand Cheval dedicated 33 years of his life (1879-1912) to building this singular monument inspired by nature and postcards.',
        'saviezVousLabel': 'Did you know?',
        'saviezVousText': 'Cheval collected stones during his daily mail delivery rounds and built this dream palace entirely by hand.',
        'photoAstuceLabel': '📸 Photo Tip',
        'photoAstuceText': 'Capture details of the complex rock sculptures in the early morning to leverage soft natural lighting.',
        'similarPlacesTitle': '🌍 Similar Unique Architectural Places Worldwide',
        'similarPlaces': [
          ['Angkor Wat (Siem Reap, Cambodia) 🇰🇭', 'The legendary Khmer temples that deeply inspired Facteur Cheval’s architectural imagination.'],
          ['Park Güell (Barcelona, Spain) 🇪🇸', 'Stunning organic architecture inspired by natural shapes just like Facteur Cheval’s palace.'],
          ['Watts Towers (Los Angeles, USA) 🇺🇸', 'Unique massive sculptures built single-handedly using recycled materials and concrete mortar.'],
        ],
        'altInfo': {
          'titre': 'Palais idéal du Facteur Cheval',
          'titreAffichage': 'Palais idéal - Facteur Cheval',
          'image': 'assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg',
          'typeAcces': 'Free access / Hauterives, France',
        }
      };
    } else {
      return {
        'title': 'Palais idéal 🏰',
        'pageTitle': 'Palais idéal : Le chef-d’œuvre du Facteur Cheval',
        'introTitle': '🇰🇭 Un air de Cambodge au cœur de la Drôme',
        'introText': "Édifié par un seul homme, le facteur Ferdinand Cheval, ce palais est un monument unique au monde. Ses façades sculptées rappellent les temples hindous et l'architecture organique d'Asie du Sud-Est.",
        'analogieVille': 'Hauterives',
        'analogieTemples': "Temples d'Angkor (Cambodge)",
        'tarifsTitle': 'Tarifs généraux',
        'tarifsNote': "⚠️ Attention : Les prix sont susceptibles de changer selon la saison.",
        'tarifsRest': "*Réduit : Étudiants, demandeurs d'emploi, situation de handicap.",
        'tarifsGroupesTitle': 'Tarifs groupes',
        'saisonsTitle': 'Meilleures saisons',
        'saisonHeader': 'Saison',
        'conseilsHeader': 'Conseil',
        'saisons': [
          ['🌸 Printemps', 'Idéal : Températures douces'],
          ['🍂 Automne', 'Superbe avec les couleurs ambrées'],
          ['☀️ Été', 'Beaucoup de monde, privilégier le matin'],
          ['❄️ Hiver', 'Calme mais très froid (Drôme)'],
        ],
        'horairesTitle': 'Horaires de visite',
        'momentHeader': 'Moment',
        'horaires': [
          ['✨ Matin', 'Recommandé : Lumière douce'],
          ['🕛 12h - 14h', 'Moins de foule'],
          ['🕓 Après-midi', 'À éviter : Forte affluence'],
        ],
        'tarifsData': [
          ['Catégorie', 'Tarif'],
          ['Adulte', '8 €'],
          ['Réduit*', '6 €'],
          ['Enfants (3-16 ans)', '5 €'],
          ['Moins de 5 ans', 'Gratuit'],
          ['Audioguide', '+ 2 €'],
        ],
        'groupesData': [
          ['Type de groupe', 'Tarif'],
          ['Enfants (+15 pers.)', '4 € / enfant'],
          ['Chauffeurs de bus', 'Gratuit'],
        ],
        'galerieTitle': 'Aperçu du lieu',
        'infosTitle': 'Indispensables',
        'infos': [
          [Icons.camera_enhance_outlined, "Appareil photo indispensable"],
          [Icons.map_outlined, "Situé à Hauterives (Drôme)"],
          [Icons.language, "Réservation en ligne conseillée"],
          [Icons.auto_awesome, "Classé monument historique"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Vérifiez l’affluence réelle et la météo pour votre sécurité.',
        'legendeVert': '🟢 Vert : Période idéale (tranquille, météo agréable)',
        'legendeOrange': '🟠 Affluence modérée (période de transition)',
        'legendeRouge': '🔴 Forte affluence / Couleurs maximales',
        'legendeGris': '⚪ Basse saison / Météo fraîche',
        'mapsLabel': 'Ouvrir dans Maps',
        'histoireLabel': 'Histoire et récit détaillé',
        'histoireText': "Le facteur Ferdinand Cheval a consacré 33 années de sa vie (1879-1912) à bâtir seul ce monument chimérique, inspiré par la nature et les cartes postales qu'il distribuait.",
        'saviezVousLabel': 'Saviez-vous ?',
        'saviezVousText': "Cheval ramassait les pierres lors de sa tournée quotidienne de distribution du courrier pour bâtir son palais pierre par pierre.",
        'photoAstuceLabel': '📸 Astuce photo',
        'photoAstuceText': "Privilégiez une prise de vue matinale pour capter les détails ciselés des sculptures de grès sous une lumière rasante.",
        'similarPlacesTitle': '🌍 Endroits similaires dans le monde',
        'similarPlaces': [
          ['Angkor Wat (Siem Reap, Cambodge) 🇰🇭', 'Les temples khmers légendaires qui ont profondément inspiré l’imaginaire fantastique du Facteur Cheval.'],
          ['Park Güell (Barcelone, Espagne) 🇪🇸', 'Une architecture organique spectaculaire inspirée des formes de la nature, tout comme l’œuvre du Facteur Cheval.'],
          ['Watts Towers (Los Angeles, États-Unis) 🇺🇸', 'Des sculptures monumentales uniques érigées par un seul homme à partir de matériaux de récupération.'],
        ],
        'altInfo': {
          'titre': 'Palais idéal du Facteur Cheval',
          'titreAffichage': 'Palais idéal - Facteur Cheval',
          'image': 'assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg',
          'typeAcces': 'Accès ouvert / Hauterives (Drôme)',
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
                      data['legendeNote'],
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

                  // 1. BIS - ANALOGIE & LIEU (LIGNE DE TRADUCTION / CORRESPONDANCE)
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
                          data['analogieVille'],
                          style: GoogleFonts.montserrat(
                            color: _currentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                data['analogieTemples'],
                                style: GoogleFonts.montserrat(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
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

                  // 7. BIS - TARIFS GÉNÉRAUX & GROUPES
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
                          data['tarifsTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          data['tarifsNote'],
                          style: GoogleFonts.montserrat(
                            color: Colors.white54,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          children: (data['tarifsData'] as List).asMap().entries.map((entry) {
                            int idx = entry.key;
                            List<String> row = entry.value;
                            return TableRow(
                              children: row.map((cell) => Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  cell,
                                  style: GoogleFonts.montserrat(
                                    color: idx == 0 ? _currentColor : Colors.white70,
                                    fontSize: 12,
                                    fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              )).toList(),
                            );
                          }).toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            data['tarifsRest'],
                            style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          data['tarifsGroupesTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          children: (data['groupesData'] as List).asMap().entries.map((entry) {
                            int idx = entry.key;
                            List<String> row = entry.value;
                            return TableRow(
                              children: row.map((cell) => Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  cell,
                                  style: GoogleFonts.montserrat(
                                    color: idx == 0 ? _currentColor : Colors.white70,
                                    fontSize: 12,
                                    fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              )).toList(),
                            );
                          }).toList(),
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

                  // 10. GALERIE PHOTOS
                  Column(
                    children: [
                      _buildGalleryImage('assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg'),
                      _buildGalleryImage('assets/images/Palais-ideal-une.jpg'),
                      _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-1.jpg'),
                      _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-2.jpg'),
                      _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-11.jpg'),
                      _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-9.jpg'),
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