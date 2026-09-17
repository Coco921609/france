import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class LeGouffreDePadiracPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const LeGouffreDePadiracPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<LeGouffreDePadiracPage> createState() => _LeGouffreDePadiracPageState();
}

class _LeGouffreDePadiracPageState extends State<LeGouffreDePadiracPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
  }

  @override
  void didUpdateWidget(covariant LeGouffreDePadiracPage oldWidget) {
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
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Fermé)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Février (Fermé)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.green},     // Mars (Réouverture fin mars)
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.orange},   // Avril (Printemps)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange},  // Mai
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},      // Juin
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet (Haute saison / Pic)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août (Haute saison / Pic)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.green},   // Septembre
      {'top': Colors.green, 'mid': Colors.green, 'bot': Colors.grey},    // Octobre (Fin de saison)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre (Fermé)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Décembre (Fermé / Vacances selon années)
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
        'title': 'جوف دي بادراك 🕳️',
        'pageTitle': 'جوف دي بادراك : الأعماق السحرية',
        'introTitle': '💎 رحلة رائعة على عمق 103 أمتار تحت الأرض',
        'introText': 'جوف دي بادراك هو أول موقع تراث تحت الأرض في فرنسا. نزول ضخم يفتح لك أبواب معرض مذهل تؤدي إلى نهر غامض، حيث تبدأ جولة بالقارب ينظمها ملاحون وسط تكوين عملاقة.',
        'factsTitle': '📋 الحقائق الأساسية',
        'facts': [
          ['الموقع', 'أوكسيتاني (لوت)'],
          ['النوع', 'تجويف طبيعي ونهري تحت الأرض'],
          ['الطابع', 'يشبه كوينتا دا ريجاليريا (البرتغال 🇵🇹)'],
        ],
        'tarifsIndivTitle': '💰 جدول الأسعار الفردية',
        'tarifsIndivHeaderFormule': 'الفئة / الجمهور',
        'tarifsIndivHeaderTarif': 'السعر',
        'tarifsIndiv': [
          ['زيارة حرة - بالغ (دليل صوتي + ملاح)', '24.00 €'],
          ['زيارة حرة - طفل من 4 إلى 12 سنة', '18.00 €'],
          ['زيارة حرة - أقل من 4 سنوات (تذكرة إجبارية)', '0.00 €'],
          ['زيارة حرة - طفل أكبر من 12 سنة وطالب', '22.00 €'],
          ['♿ تذكرة ذوي الاحتياجات الخاصة (بالغ)', '22.00 €'],
          ['♿ تذكرة ذوي الاحتياجات الخاصة (طفل 4-12 سنة)', '16.00 €'],
          ['♿ مرافق ذوي الاحتياجات الخاصة', '22.00 €'],
          ['✨ أسياد الاستكشاف (سعر البالغين)', '150.00 €'],
          ['✨ أسياد الاستكشاف (طفل 4-12 سنة)', '80.00 €'],
        ],
        'tarifsGroupesTitle': '👥 المجموعات والبالغين (من 20 شخصاً)',
        'tarifsGroupesHeader1': 'تذكرة بدليل صوتي',
        'tarifsGroupesHeader2': 'الموسم المنخفض',
        'tarifsGroupesHeader3': 'الموسم المرتفع',
        'tarifsGroupes': [
          ['بالغ', '16.00 €', '21.60 €'],
          ['طفل أكبر من 12 سنة', '14.80 €', '19.80 €'],
          ['طفل من 4 إلى 12 سنة', '11.20 €', '16.20 €'],
          ['طفل أقل من 4 سنوات', 'مجاناً', 'مجاناً'],
        ],
        'vipTitle': '👑 تجارب كبار الشخصيات الحصرية',
        'vipContent': '• زيارة VIP كلاسيكية (شمبانيا ومأكولات خفيفة حلوة)\n  من 1 إلى 4 زوار: 480.00€\n  زائر إضافي بالغ: 120.00€\n  زائر إضافي 4-12 سنة: 75.00€\n  أقل من 4 سنوات: مجاناً\n\n• زيارة VIP تذوق (كأس الاحتفال بمرور 130 عاماً ومأكولات مالحة)\n  من 1 إلى 4 زوار: 500.00€\n  زائر إضافي بالغ: 125.00€\n  زائر إضافي 4-12 سنة: 75.00€\n  أقل من 4 سنوات: مجاناً',
        'conseilsTitle': '📋 نصائح البقاء والسلامة',
        'conseils': [
          [Icons.ac_unit, "درجة حرارة ثابتة 13°م: يطلب ارتداء ملابس دافئة"],
          [Icons.scuba_diving, "بيئة رطبة: يرجى توفير أحذية مناسبة"],
          [Icons.schedule, "أوقات العمل حسب الموسم (مثال: 9:30-17:30 | 8:00-21:30)"],
          [Icons.timer, "مدة الزيارة: حوالي ساعة ونصف"],
          [Icons.no_accounts, "آخر دخول: قبل الإغلاق بـ 1 ساعة و 45 دقيقة"],
          [Icons.not_interested, "المسار غير مناسب / الحيوانات ممنوعة"],
          [Icons.child_care, "يوصى بحمل الأطفال (العربات غير مسموحة)"],
          [Icons.info_outline, "عروض VIP تخضع للتوفر، الدفع عند الطلب"],
          [Icons.warning_amber, "تنبيه: الأسعار والأوقات قابلة للتغيير خلال العام"],
        ],
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس والحجز المسبق لزيارة آمنة.',
        'legendeVert': '🟢 أخضر : فترة هادئة ومثالية للزيارة',
        'legendeOrange': '🟠 برتقالي : ازدحام معتدل، يفضل الحذر أو الحجز المبكر',
        'legendeRouge': '🔴 أحمر : ذروة الزوار (الصيف والذروة)',
        'legendeGris': '⚪ رمادي : إغلاق سنوي أو موسم منخفض',
        'galerieTitle': '📸 لمحة عن المكان',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى الحجز المسبق نظراً للإقبال الشديد على الموقع.',
        'similarPlacesTitle': '🌍 أماكن مشابهة حول العالم',
        'similarPlaces': [
          ['كهوف بوستوينا (سلوفينيا) 🇸🇮', 'شبكة رائعة من الكهوف الكارستية تحت الأرض يتم استكشافها جزئيًا عبر قطار كهربائي.'],
          ['كهوف وايتومو المضيئة (نيوزيلندا) 🇳🇿', 'كهوف تحت الأرض شهيرة تضيئها آلاف الديدان المضيئة الساحرة.'],
          ['فونغ نها-كيبانج (فيتنام) 🇻🇳', 'شبكة مهيبة من الكهوف والأنهار الجوفية المخفية في قلب الأدغال.'],
          ['كينتا دا ريجاليريا (البرتغال) 🇵🇹', 'معلم غامض يتميز بأنفاق جوفية فريدة وبئر استهلالية ساحرة.']
        ],
        'histoireLabel': 'قصة الموقع وتاريخه',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة',
        'gouffreInfo': {
          'titre': 'Le Gouffre de Padirac',
          'titreAffichage': 'Le Gouffre de Padirac',
          'image': 'assets/image/57.jpg',
          'typeAcces': 'موقع سياحي تحت الأرض / أكسيتاني',
          'histoire': 'تم اكتشاف جوف دي بادراك بواسطة أد和يل مارتيل في عام 1889، وهو يمثل مغامرة فريدة من نوعها في قلب الأرض عبر نهر تحت الأرض.',
          'saviezVous': 'هل تعلم أن القارب يُسير بواسطة ملاحين يدفدونه يدويًا دون محركات للحفاظ على هدوء ونقاء الموقع.',
          'photoAstuce': 'احرص على التقاط الصور عند الخروج من النفق وقبلركوب القارب حيث تكون الإضاءة الطبيعية ساحرة.',
          'photosVerticales': [
            'assets/image/59.jpg',
            'assets/image/60.jpg',
            'assets/image/61.jpg',
          ]
        }
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'title': 'Le Gouffre de Padirac 🕳️',
        'pageTitle': 'Le Gouffre de Padirac : The Magical Depths',
        'introTitle': '💎 A sublime journey 103 meters underground',
        'introText': "Le Gouffre de Padirac is the premier underground heritage site in France. A monumental descent opens the doors to an incredible gallery leading to a mysterious river, where a boat ride orchestrated by boatmen begins amidst giant concretions.",
        'factsTitle': '📋 Key Facts',
        'facts': [
          ['Location', 'Occitanie (Lot)'],
          ['Type', 'Natural cavity & Underground river'],
          ['Vibe', 'Reminiscent of Quinta da Regaleira (Portugal 🇵🇹)'],
        ],
        'tarifsIndivTitle': '💰 Individual Rates Grid',
        'tarifsIndivHeaderFormule': 'Formula / Public',
        'tarifsIndivHeaderTarif': 'Rate',
        'tarifsIndiv': [
          ['Free Visit - Adult (audioguide + boatman)', '24.00 €'],
          ['Free Visit - Child 4 to 12 years old', '18.00 €'],
          ['Free Visit - Under 4 years (MANDATORY ticket)', '0.00 €'],
          ['Free Visit - Child +12 yrs & student', '22.00 €'],
          ['♿ PSH Adult Entry', '22.00 €'],
          ['♿ PSH Child Entry 4-12 yrs', '16.00 €'],
          ['♿ PSH Companion Entry', '22.00 €'],
          ['✨ EXPLORERS EVENING - Adult rate', '150.00 €'],
          ['✨ EXPLORERS EVENING - Child 4-12 yrs', '80.00 €'],
        ],
        'tarifsGroupesTitle': '👥 Adult & Mixed Groups (from 20 pers.)',
        'tarifsGroupesHeader1': 'Audioguided Ticket',
        'tarifsGroupesHeader2': 'Low Season',
        'tarifsGroupesHeader3': 'High Season',
        'tarifsGroupes': [
          ['Adult', '16.00 €', '21.60 €'],
          ['Child over 12 yrs', '14.80 €', '19.80 €'],
          ['Child 4 to 12 yrs', '11.20 €', '16.20 €'],
          ['Child under 4 yrs', 'free', 'free'],
        ],
        'vipTitle': '👑 Exclusive VIP Experiences',
        'vipContent': '• CLASSIC VIP VISIT (Champagne and sweet snacks)\n  1 to 4 visitors: 480.00€\n  Extra adult visitor: 120.00€\n  Extra 4-12 yrs visitor: 75.00€\n  Under 4 yrs: free\n\n• TASTING VIP VISIT (130th Anniversary Cuvée and savory snacks)\n  1 to 4 visitors: 500.00€\n  Extra adult visitor: 125.00€\n  Extra 4-12 yrs visitor: 75.00€\n  Under 4 yrs: free',
        'conseilsTitle': '📋 Survival & Practical Tips',
        'conseils': [
          [Icons.ac_unit, "Constant temperature at 13°C: warm clothing required"],
          [Icons.scuba_diving, "Humid environment: bring suitable shoes"],
          [Icons.schedule, "Opening hours depend on season (e.g. 9:30-17:30 | 8:00-21:30)"],
          [Icons.timer, "Visit duration: approximately 1h30"],
          [Icons.no_accounts, "Last admission: 1h45 before closing"],
          [Icons.not_interested, "Path not suitable / Animals prohibited"],
          [Icons.child_care, "Baby carrier recommended (Strollers excluded)"],
          [Icons.info_outline, "VIP offers subject to availability, payment upon order"],
          [Icons.warning_amber, "Note: prices and schedules are subject to change during the year"],
        ],
        'bestMonthsTitle': 'Crowd Levels & Best Times to Visit',
        'periodStart': 'Early Month',
        'periodMid': 'Mid Month',
        'periodEnd': 'Late Month',
        'months': _generateDynamicMonths('en'),
        'legendeNote': '⚠️ Note: Please book in advance due to high popularity.',
        'legendeVert': '🟢 Green: Ideal and quiet period to visit',
        'legendeOrange': '🟠 Orange: Moderate crowds, early booking advised',
        'legendeRouge': '🔴 Red: Peak visitors (Summer season)',
        'legendeGris': '⚪ Grey: Annual closure or low season',
        'galerieTitle': '📸 Place Overview',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Note: Advance booking is strongly recommended due to high visitor volume.',
        'similarPlacesTitle': '🌍 Similar Places Around the World',
        'similarPlaces': [
          ['Postojna Cave (Slovenia) 🇸🇮', 'A magnificent subterranean karst cave system explored via an underground electric train.'],
          ['Waitomo Glowworm Caves (New Zealand) 🇳🇿', 'Famous subterranean caves illuminated by thousands of magical glowworms.'],
          ['Phong Nha-Kẻ Bàng (Vietnam) 🇻🇳', 'A majestic network of underground caves and rivers hidden deep inside untouched jungles.'],
          ['Quinta da Regaleira (Portugal) 🇵🇹', 'A mystical estate featuring enigmatic subterranean tunnels and an initiation well.']
        ],
        'histoireLabel': 'Detailed History & Background',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Photo Tip',
        'gouffreInfo': {
          'titre': 'Le Gouffre de Padirac',
          'titreAffichage': 'Le Gouffre de Padirac',
          'image': 'assets/image/57.jpg',
          'typeAcces': 'Underground heritage site / Occitanie',
          'histoire': "Le Gouffre de Padirac was discovered in 1889 by Édouard-Alfred Martel, considered the father of modern speleology.",
          'saviezVous': "Did you know that the boats inside are poled manually by boatmen to preserve the serene silence and purity of the underground river.",
          'photoAstuce': "Capture photos right after emerging from the giant shaft where natural light hits the lush greenery around the rim.",
          'photosVerticales': [
            'assets/image/59.jpg',
            'assets/image/60.jpg',
            'assets/image/61.jpg',
          ]
        }
      };
    } else {
      return {
        'title': 'Le Gouffre de Padirac 🕳️',
        'pageTitle': 'Le Gouffre de Padirac : Les Profondeurs Magiques',
        'introTitle': '💎 Sublime voyage à 103 mètres sous terre',
        'introText': "Le Gouffre de Padirac est le premier site du patrimoine souterrain en France. Une descente monumentale vous ouvre les portes d'une incroyable galerie menant à une rivière mystérieuse, où commence une promenade en barque orchestrée par les bateliers au milieu de concrétions géantes.",
        'factsTitle': '📋 Faits clés',
        'facts': [
          ['Localisation', 'Occitanie (Lot)'],
          ['Type', 'Cavité naturelle & Rivière souterraine'],
          ['Air de', 'Quinta da Regaleira (Portugal 🇵🇹)'],
        ],
        'tarifsIndivTitle': '💰 Grille des Tarifs Individuels',
        'tarifsIndivHeaderFormule': 'Formule / Public',
        'tarifsIndivHeaderTarif': 'Tarif',
        'tarifsIndiv': [
          ['Visite Libre - Adulte (audioguide + batelier)', '24.00 €'],
          ['Visite Libre - Enfant de 4 à 12 ans', '18.00 €'],
          ['Visite Libre - Moins de 4 ans (Billet OBLIGATOIRE)', '0.00 €'],
          ['Visite Libre - Enfant +12 ans et étudiant', '22.00 €'],
          ['♿ Entrée PSH Adulte', '22.00 €'],
          ['♿ Entrée PSH Enfant 4-12 ans', '16.00 €'],
          ['♿ Entrée PSH accompagnateur', '22.00 €'],
          ['✨ SOIRÉE EXPLORATEURS - Tarif adulte', '150.00 €'],
          ['✨ SOIRÉE EXPLORATEURS - Enfant 4-12 ans', '80.00 €'],
        ],
        'tarifsGroupesTitle': '👥 Groupes d’Adultes & Mixtes (dès 20 pers.)',
        'tarifsGroupesHeader1': 'Billet Audioguidé',
        'tarifsGroupesHeader2': 'Basse Saison',
        'tarifsGroupesHeader3': 'Haute Saison',
        'tarifsGroupes': [
          ['Adulte', '16.00 €', '21.60 €'],
          ['Enfant de + de 12 ans', '14.80 €', '19.80 €'],
          ['Enfant de 4 à 12 ans', '11.20 €', '16.20 €'],
          ['Enfant de moins de 4 ans', 'gratuit', 'gratuit'],
        ],
        'vipTitle': '👑 Expériences VIP Exclusives',
        'vipContent': '• VISITE VIP CLASSIQUE (Champagne et mets sucrés)\n  De 1 à 4 visiteurs : 480.00€\n  Visiteur supplémentaire adulte : 120.00€\n  Visiteur supplémentaire 4-12 ans : 75.00€\n  Enfant de - de 4 ans : gratuit\n\n• VISITE VIP DÉGUSTATION (Cuvée des 130 ans et mets salés)\n  De 1 à 4 visiteurs : 500.00€\n  Visiteur supplémentaire adulte : 125.00€\n  Visiteur supplémentaire 4-12 ans : 75.00€\n  Enfant de - de 4 ans : gratuit',
        'conseilsTitle': '📋 Conseils de survie',
        'conseils': [
          [Icons.ac_unit, "Température constante à 13°C : vêtement chaud requis"],
          [Icons.scuba_diving, "Milieu humide : prévoyez des chaussures adaptées"],
          [Icons.schedule, "Horaires selon saison (ex: 9h30-17h30 | 8h00-21h30)"],
          [Icons.timer, "Durée de la visite : environ 1h30"],
          [Icons.no_accounts, "Dernière admission : 1h45 avant la fermeture"],
          [Icons.not_interested, "Parcours non adapté / Animaux interdits"],
          [Icons.child_care, "Porte bébé recommandé (Poussettes exclues)"],
          [Icons.info_outline, "Offres VIP soumises à disponibilité, règlement à la commande"],
          [Icons.warning_amber, "Attention : les prix et horaires peuvent changer au cours de l'année"],
        ],
        'bestMonthsTitle': 'Calendrier d’affluence et de saisonnalité',
        'periodStart': 'Début de mois',
        'periodMid': 'Milieu de mois',
        'periodEnd': 'Fin de mois',
        'months': _generateDynamicMonths('fr'),
        'legendeNote': '⚠️ Attention : Réservation en ligne fortement conseillée en raison de l’affluence.',
        'legendeVert': '🟢 Vert : Période idéale / Moins d’affluence (Printemps)',
        'legendeOrange': '🟠 Orange : Affluence modérée (Juin / Septembre)',
        'legendeRouge': '🔴 Rouge : Forte affluence / Haute saison (Juillet - Août)',
        'legendeGris': '⚪ Gris : Fermeture annuelle ou basse saison',
        'galerieTitle': '📸 Galerie',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Réservation obligatoire/fortement conseillée pour accéder au site.',
        'similarPlacesTitle': '🌍 Endroits similaires au Gouffre de Padirac dans le monde',
        'similarPlaces': [
          ['Grottes de Postojna (Slovénie) 🇸🇮', 'Un réseau spectaculaire de grottes souterraines karstiques exploré en partie via un train électrique.'],
          ['Grottes de Waitomo Glowworm (Nouvelle-Zélande) 🇳🇿', 'Des rivières souterraines célèbres illuminées par des milliers de vers luisants magiques.'],
          ['Phong Nha-Kẻ Bàng (Vietnam) 🇻🇳', 'Un complexe majestueux de rivières et de cavités souterraines cachées au cœur de la jungle.'],
          ['Quinta da Regaleira (Portugal) 🇵🇹', 'Un domaine mystique avec des galeries souterraines énigmatiques et un puits initiatique.']
        ],
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo',
        'gouffreInfo': {
          'titre': 'Le Gouffre de Padirac',
          'titreAffichage': 'Le Gouffre de Padirac',
          'image': 'assets/image/57.jpg',
          'typeAcces': 'Cavité naturelle & Rivière souterraine',
          'histoire': "Le Gouffre de Padirac a été exploré pour la première fois en 1889 par Édouard-Alfred Martel, le père de la spéléologie moderne.",
          'saviezVous': "Saviez-vous que les barques qui naviguent sur la rivière souterraine sont manœuvrées à la perche par des bateliers pour préserver le calme absolu du lieu.",
          'photoAstuce': "Immortalisez le moment de la sortie du puits béant où la lumière naturelle illumine la végétation luxuriante.",
          'photosVerticales': [
            'assets/image/59.jpg',
            'assets/image/60.jpg',
            'assets/image/61.jpg',
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
    final gouffreInfo = data['gouffreInfo'] as Map<String, dynamic>;
    final tarifsIndivList = data['tarifsIndiv'] as List;
    final tarifsGroupesList = data['tarifsGroupes'] as List;
    final factsList = data['facts'] as List;
    final conseilsList = data['conseils'] as List;
    final months = data['months'] as List;
    final photosVerticales = gouffreInfo['photosVerticales'] as List;

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
                  // EN-TÊTE AVEC BOUTON INTERNATIONAL (SANS FAVORIS)
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
                      gouffreInfo['image'],
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
                          gouffreInfo['titreAffichage'],
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
                            gouffreInfo['typeAcces'],
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
                            color: _currentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...factsList.map((fact) => _buildTranslationLine(fact[0], fact[1], _currentColor)),
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
                          gouffreInfo['histoire'],
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
                      onPressed: () => _openMap(gouffreInfo['titre']),
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
                          gouffreInfo['saviezVous'],
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
                          gouffreInfo['photoAstuce'],
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

                  // 5. BIS - ENDROITS SIMILAIRES (AVEC PORTUGAL & DRAPEAUX VÉRIFIÉS)
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

                  // 6. TABLEAU TARIFS INDIVIDUELS
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
                          data['tarifsIndivTitle'],
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(2), 1: FlexColumnWidth(1)},
                          children: [
                            _buildTableRow([data['tarifsIndivHeaderFormule'], data['tarifsIndivHeaderTarif']], isHeader: true, hColor: _currentColor),
                            ...tarifsIndivList.map((t) => _buildTableRow([t[0], t[1]])),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 7. TABLEAU TARIFS GROUPES
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
                          data['tarifsGroupesTitle'],
                          style: GoogleFonts.cinzel(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Table(
                          border: TableBorder.all(color: Colors.white10, width: 1),
                          columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1)},
                          children: [
                            _buildTableRow([data['tarifsGroupesHeader1'], data['tarifsGroupesHeader2'], data['tarifsGroupesHeader3']], isHeader: true, hColor: _currentColor),
                            ...tarifsGroupesList.map((g) => _buildTableRow([g[0], g[1], g[2]])),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 8. EXPÉRIENCES VIP EXCLUSIVES
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
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                data['vipTitle'],
                                style: const TextStyle(
                                  color: Colors.amber,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data['vipContent'],
                          style: GoogleFonts.montserrat(
                            color: Colors.white70,
                            fontSize: 13,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 9. CALENDRIER D'AFFLUENCE ET DE SAISONNALITÉ
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

                  // 10. CONSEILS DE SURVIE & INFOS PRATIQUES
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
                          data['conseilsTitle'],
                          style: GoogleFonts.cinzel(
                            color: _currentColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...conseilsList.map((info) => _buildTechRow(info[0], info[1], _currentColor)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 11. GALERIE PHOTOS VERTICALES
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