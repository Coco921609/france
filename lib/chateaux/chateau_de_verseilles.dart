import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChateauDeVersaillesPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const ChateauDeVersaillesPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  State<ChateauDeVersaillesPage> createState() => _ChateauDeVersaillesPageState();
}

class _ChateauDeVersaillesPageState extends State<ChateauDeVersaillesPage> {
  late Color _currentColor;
  late String _currentLanguageCode;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.themeColor;
    _currentLanguageCode = widget.languageCode;
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

  /// Génération dynamique et hyper-réaliste (honnête) de la fréquentation
  List<Map<String, dynamic>> _generateDynamicMonths(String lang) {
    // Structure de fréquentation honnête pour Versailles :
    // Très forte affluence (rouge) du printemps jusqu'à la fin de l'été.
    final List<Map<String, Color>> baseSeasonData = [
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Janvier (Calme)
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.grey},     // Février (Vacances scolaires)
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.orange},   // Mars (Reprise touristique)
      {'top': Colors.orange, 'mid': Colors.red, 'bot': Colors.red},       // Avril (Pâques, Grandes Eaux, bondé)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Mai (Ponts, très forte affluence)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juin (Début de l'été, très bondé)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Juillet (Pic touristique absolu)
      {'top': Colors.red, 'mid': Colors.red, 'bot': Colors.red},          // Août (Pic touristique absolu)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Septembre (Reste très fréquenté)
      {'top': Colors.orange, 'mid': Colors.orange, 'bot': Colors.orange}, // Octobre (Vacances d'automne)
      {'top': Colors.grey, 'mid': Colors.grey, 'bot': Colors.grey},       // Novembre (Calme, froid)
      {'top': Colors.grey, 'mid': Colors.orange, 'bot': Colors.red},      // Décembre (Fêtes de fin d'année)
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
    if (_currentLanguageCode == 'ar') {
      return {
        'pageTitle': 'قصر فرساي : أعجوبة ملكية',
        'introTitle': 'قصر فرساي: رمز الملكية المطلقة والتاريخ العريق',
        'introText': 'تأسست نواة فرساي الأصلية كـمقر صيد بسيط للملك لويس الثالث عشر، قبل أن يتحول بفضل ابنه لويس الرابع عشر إلى قصر فخم يجسد مجد ورعونة الملكية المطلقة في فرنسا، ويصبح المركز السياسي والثقافي للبلاد.',
        'bestMonthsTitle': 'مستويات الازدحام والفترات المثالية للزيارة',
        'periodStart': 'أول الشهر',
        'periodMid': 'منتصف الشهر',
        'periodEnd': 'آخر الشهر',
        'months': _generateDynamicMonths('ar'),
        'legendeNote': '⚠️ تنبيه: يرجى التحقق من حالة الطقس في أول الشهر، منتصف الشهر وآخر الشهر.',
        'legendeVert': '🟢 أخضر : فترة مثالية (ازدحام قليل، طقس ممتاز، وأسعار مناسبة)',
        'legendeOrange': '🟠 برتقالي : ازدحام متوسط (فترة انتقالية، يتطلب حجزاً مسبقاً)',
        'legendeRouge': '🔴 أحمر : ازدحام شديد (ذروة السياحة، أسعار مرتفعة جداً)',
        'legendeGris': '⚪ رمادي : فترة منخفضة الموسم (طقس بارد أو ممطر، لكنها مثالية لتجنب الحشود الكبيرة)',
        'hauteSaisonTitle': 'مواعيد العمل في الموسم المرتفع (1 أبريل - 31 أكتوبر)',
        'hauteSaisonContent': '''
• القصر الرئيسي: 
مفتوح يومياً باستثناء أيام الاثنين. 
9:00 صباحاً – 6:30 مساءً (آخر دخول: 5:45 مساءً، شباك التذاكر: 5:30 مساءً).

• دومين تريانون: 
مفتوح يومياً باستثناء أيام الاثنين. 
12:00 ظهراً – 6:30 مساءً (آخر دخول: 5:45 مساءً).

• حديقة العطور: 
مفتوحة كل عطلة نهاية أسبوع من 9 مايو إلى 27 سبتمبر، 12:00 ظهراً – 6:30 مساءً.

• معرض العربات والمنحوتات: 
مفتوح أيام السبت والأحد والعطلات الرسمية من 12:30 ظهراً إلى 6:30 مساءً (دخول مجاني).

• قاعة لعبة المضرب: 
مفتوحة يومياً باستثناء أيام الاثنين، 12:30 ظهراً – 6:30 مساءً (دخول مجاني).

• الحدائق والمتنزه: 
مفتوحة يومياً من 7:00 صباحاً إلى 8:30 مساءً (باستثناء الظروف الجوية الاستثنائية).

• دومين مارلي: 
مفتوح يومياً من 7:00 صباحاً إلى 7:30 مساءً.''',
        'basseSaisonTitle': 'مواعيد العمل في الموسم المنخفض (1 نوفمبر - 31 مارس)',
        'basseSaisonContent': '''
• القصر الرئيسي ودومين تريانون: 
مفتوحان يومياً باستثناء أيام الاثنين. 
9:00 صباحاً – 5:30 مساءً (آخر دخول: 4:45 مساءً). مغلق 25 ديسمبر و1 يناير.

• معرض العربات: 
مفتوح أيام السبت والأحد من 12:30 ظهراً إلى 5:30 مساءً. مغلق 25 ديسمبر و1 يناير.

• قاعة لعبة المضرب: 
مفتوحة من الثلاثاء إلى الأحد من 12:30 ظهراً إلى 5:30 مساءً.

• الحدائق والمتنزه: 
مفتوحة من 8:00 صباحاً إلى 6:00 مساءً، آخر دخول 5:30 مساءً (باستثناء الظروف الجوية الاستثنائية).

• دومين مارلي: 
مفتوح للمشاة يومياً من 8:00 صباحاً إلى 6:00 مساءً.''',
        'histoireLabel': 'القصة والتاريخ المفصل',
        'saviezVousLabel': 'هل كنت تعلم؟',
        'photoAstuceLabel': '📸 نصيحة لأفضل صورة:',
        'mapsLabel': 'فتح في الخرائط',
        'avertissementMeteo': '⚠️ تنبيه: يرجى التحقق بعناية من حال الطقس وأسعار التذاكر ومواعيد الإغلاق قبل زيارة قصر فرساي، حيث قد تتغير الظروف والأسعار خلال العام.',
        'quartiers': [
          {
            'nomQuartier': 'المعالم والقصور الملكية الكبرى',
            'lieux': [
              {
                'titre': 'Château de Versailles',
                'titreAffichage': 'القصر الرئيسي (Château)',
                'image': 'assets/chateaux/versailles/2.jpeg',
                'typeAcces': 'مدفوع / تذكرة دخول شاملة',
                'histoire': 'بُني في الأصل كاستراحة صيد متواضعة من الطوب والحجر للملك لويس الثالث عشر في عام 1623، ليتحول لاحقاً بمعمار مذهل ويتوسع بشكل هائل على يد ابنه لويس الرابع عشر (الملك الشمس) بدءاً من عام 1661. أراد الملك الابتعاد عن اضطرابات باريس وتأسيس سلطته المطلقة. أصبح القصر المقر الرسمي للبلاط الملكي والحكومة الفرنسية، والرمز المطلق للملكية المطلقة حتى اندلاع الثورة الفرنسية عام 1789. بضمه لأكثر من 2300 غرفة وعمارة باروكية مذهلة صممها لو فو ومانسار، يجسد القصر ذروة الفن الكلاسيكي الفرنسي.',
                'saviezVous': 'تحتوي قاعة المرايا الشهيرة وحدها على 357 مرآة صُممت لتبهر السفراء الأجانب وتظهر ثروة فرنسا.',
                'photoAstuce': 'احرص على زيارة قاعة المرايا فور فتح الأبواب صباحاً لتجنب الازدحام والتقاط صور نقية لانعكاسات الثريات الذهبية.'
              },
              {
                'titre': 'Domaine de Trianon',
                'titreAffichage': 'دومين تريانون (Domaine de Trianon)',
                'image': 'assets/chateaux/versailles/3.webp',
                'typeAcces': 'مدفوع / ضمن التذكرة الكبرى',
                'histoire': 'يضم دومين تريانون القصر الكبير والقصر الصغير، وكان يوفر للملوك ملاذاً حميمياً هادئاً بعيداً عن صرامة البروتوكول والرقابة المستمرة للبلاط الرسمي في القصر الرئيسي. بُني القصر الكبير من الرخام الوردي بأمر من لويس الرابع عشر لييكون مخصصاً لعلاقاته الغرامية وحفلات الصيف. أما القصر الصغير، فهو تحفة نيوكلاسيكية أمر ببنائها لويس الخامس عشر، وأهداه لاحقاً لويس السادس عشر للملكة ماري أنطوانيت. هناك، خلقت الملكة عالمها الخاص بعيداً عن قيود فرساي، بما في ذلك "قرية الملكة" الشهيرة حيث كانت تستمتع بوهم الحياة الريفية الهادئة.',
                'saviezVous': 'أُهدي القصر الصغير للملكة ماري أنطوانيت التي جعلت منه مملكتها الخاصة والمستقلة تماماً.',
                'photoAstuce': 'التقط صوراً للواجهات الوردية للقصر الكبير في وقت متأخر من بعد الظهر لإبراز ألوان الرخام الباستيلية الدافئة.'
              },
              {
                'titre': 'Jardins du Château de Versailles',
                'titreAffichage': 'الحدائق الملكية (Les Jardins)',
                'image': 'assets/chateaux/versailles/4.webp',
                'typeAcces': 'مجاني غالباً (مدفوع أيام العروض الموسيقية)',
                'histoire': 'صممها مهندس المناظر الطبيعية العبقري أندريه لو نوتر بدءاً من عام 1661، وتمثل حدائق فرساي النموذج الأصلي والتحفة المطلقة لتصميم الحدائق الفرنسية الرسمية. تطلب إنشاؤها جهوداً جبارة في حفر ونقل الأتربة، بمشاركة آلاف الرجال لتجفيف المستنقعات الأصلية. تجمع الحدائق بين التناظر المثالي، والآفاق العظيمة، والأحواض الهندسية، ومئات التماثيل الأسطورية. كانت البساتين السرية والنوافير الضخمة تعمل بنظام هيدروليكي غير مسبوق التعقيد في ذلك الوقت، صُمم لإبهار البلاط أثناء الاحتفالات والمهرجانات الملكية الفخمة.',
                'saviezVous': 'كانت نافورات الحدائق تتطلب آليات هيدروليكية ضخمة عُرفت بآلة مارلي لضخ المياه من نهر السين إلى القصر.',
                'photoAstuce': 'قف عند قمة المنظور الكبير قرب نافورة لاتيونا لالتقاط الاتساع المذهل للممرات المؤدية للقناة الكبرى.'
              },
              {
                'titre': 'Grand Canal de Versailles',
                'titreAffichage': 'الحديقة الكبرى والقناة (Le Parc)',
                'image': 'assets/chateaux/versailles/5.jpg',
                'typeAcces': 'مجاني',
                'histoire': 'تمتد القناة الكبرى بشكل مهيب بطول 1670 متراً وصُممت على شكل صليب، وتُعد القطعة المركزية في حديقة فرساي. اكتملت في عام 1679، وهي تعكس شمس الغروب وتوسع المنظور البصري للقصر وصولاً إلى الأفق. خلال عهد لويس الرابع عشر، لم تكن هذه المسطحات المائية الضخمة للزينة فقط: بل كانت بمثابة ساحة لعب ضخمة للمهرجانات البحرية المذهلة. حتى أن "الملك الشمس" أنشأ أسطولاً صغيراً هناك، شمل قوارب طويلة، وجندولاً أهدته إياه البندقية، ونماذج حقيقية لسفن حربية مصغرة كانت تبحر في هذا الميناء الداخلي الحقيقي.',
                'saviezVous': 'تبلغ ضخامة القناة الكبرى لدرجة أنها استُخدمت كميناء مصغر لتسيير سفن حربية حقيقية صغرى للملك.',
                'photoAstuce': 'استأجر قارباً صغيراً في القناة الكبرى والتقط صورة منخفضة المستوى مع القصر يلوح في الأفق البعيد.'
              },
              {
                'titre': 'Salle du Jeu de paume',
                'titreAffichage': 'قاعة لعبة المضرب (Salle du Jeu de Paume)',
                'image': 'assets/chateaux/versailles/6.jpg',
                'typeAcces': 'مجاني / حسب الفترات التنظيمية',
                'histoire': 'بُنيت هذه القاعة ذات السقف العالي والنوافذ الكبيرة عام 1686 لتتيح لأفراد البلاط لعب "لعبة المضرب" (سلف التنس الحديث)، ودخلت التاريخ العالمي بطريقة غير متوقعة. في 20 يونيو 1789، وبعد أن أغلق الملك لويس السادس عشر قاعة اجتماعاتهم المعتادة، تحصن نواب الطبقة الثالثة بداخلها. وهناك أقسموا "قسم لعبة المضرب" الشهير، متعهدين بعدم التفرق أبداً حتى يقوموا بصياغة واعتماد دستور لفرنسا. مثّل هذا العمل التمردي نهاية الملكية المطلقة وأصبح الشرارة التأسيسية الحقيقية للثورة الفرنسية والديمقراطية الحديثة في البلاد.',
                'saviezVous': 'يُعتبر هذا القسم التاريخي النواة الأولى للديمقراطية البرلمانية الحديثة في فرنسا.',
                'photoAstuce': 'قم بالتركيز على اللوحات التذكارية التاريخية من الداخل لتوثيق الطابع الرمزي للمكان.'
              }
            ]
          }
        ]
      };
    } else if (_currentLanguageCode == 'en') {
      return {
        'pageTitle': 'Palace of Versailles : Royal Marvel',
        'introTitle': 'Palace of Versailles: The Absolute Symbol of Monarchy',
        'introText': 'Originally built as a hunting lodge by Louis XIII, the palace was transformed and expanded by his son Louis XIV to become the ultimate symbol of absolute monarchy and the political heart of France.',
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
        'hauteSaisonTitle': 'High Season Opening Hours (April 1st - October 31st)',
        'hauteSaisonContent': '''
• The Palace: 
Open every day except Mondays. 
9:00 am – 6:30 pm (Last entry: 5:45 pm, Ticket office: 5:30 pm).

• Estate of Trianon: 
Open every day except Mondays. 
12:00 pm – 6:30 pm (Last entry: 5:45 pm).

• Perfumer's Garden: 
Open every weekend from May 9 to September 27, 12:00 pm – 6:30 pm.

• Gallery of Coaches & Sculptures: 
Open Saturdays, Sundays and public holidays from 12:30 pm to 6:30 pm (Free access).

• Salle du Jeu de Paume: 
Open every day except Mondays, 12:30 pm – 6:30 pm (Free access).

• The Gardens & Park: 
Open every day from 7:00 am to 8:30 pm (except exceptional weather).

• Marly Estate: 
Open every day from 7:00 am to 7:30 pm.''',
        'basseSaisonTitle': 'Low Season Opening Hours (November 1st - March 31st)',
        'basseSaisonContent': '''
• The Palace & Estate of Trianon: 
Open every day except Mondays. 
9:00 am – 5:30 pm (Last entry: 4:45 pm). Closed Dec 25 and Jan 1.

• Gallery of Coaches: 
Open Saturdays and Sundays from 12:30 pm to 5:30 pm. Closed Dec 25 and Jan 1.

• Salle du Jeu de Paume: 
Open Tuesday to Sunday from 12:30 pm to 5:30 pm.

• The Gardens & Park: 
Open from 8:00 am to 6:00 pm, last access 5:30 pm (except exceptional weather).

• Marly Estate: 
Open to pedestrians every day from 8:00 am to 6:00 pm.''',
        'histoireLabel': 'Detailed History & Story',
        'saviezVousLabel': 'Did you know ?',
        'photoAstuceLabel': '📸 Best Photo Tip:',
        'mapsLabel': 'Open in Maps',
        'avertissementMeteo': '⚠️ Attention: Please carefully check the weather forecast, ticket prices, and closing times before visiting Versailles, as conditions may change throughout the year.',
        'quartiers': [
          {
            'nomQuartier': 'Main Monuments & Royal Estates',
            'lieux': [
              {
                'titre': 'Château de Versailles',
                'titreAffichage': 'The Main Palace (Château)',
                'image': 'assets/chateaux/versailles/2.jpeg',
                'typeAcces': 'Paid / Full Passport Ticket',
                'histoire': 'Originally built as a modest brick and stone hunting lodge by King Louis XIII in 1623, the palace was masterfully transformed and exponentially expanded by his son, Louis XIV (the Sun King), starting in 1661. He wanted to distance himself from the unrest in Paris and establish his absolute power. The palace became the official seat of the French royal court and government, serving as the ultimate symbol of absolute monarchy until the French Revolution in 1789. Boasting over 2,300 rooms and spectacular Baroque architecture by Le Vau and Mansart, it embodies the pinnacle of French classical art.',
                'saviezVous': 'The famous Hall of Mirrors features 357 mirrors designed to dazzle foreign ambassadors with financial opulence.',
                'photoAstuce': 'Visit the Hall of Mirrors right at opening time in the morning to avoid crowds and capture perfect reflections of the golden chandeliers.'
              },
              {
                'titre': 'Domaine de Trianon',
                'titreAffichage': 'The Trianon Estate (Domaine de Trianon)',
                'image': 'assets/chateaux/versailles/3.webp',
                'typeAcces': 'Paid / Included in Passport',
                'histoire': 'The Trianon Estate, comprising the Grand Trianon and the Petit Trianon, offered sovereigns an intimate refuge far from the rigid etiquette and constant scrutiny of the official court. The Grand Trianon, a palace of pink marble built by Louis XIV, was dedicated to his romantic liaisons and summer collations. The Petit Trianon, a neoclassical masterpiece commissioned by Louis XV, was later gifted by Louis XVI to Queen Marie-Antoinette. She created her own private universe there, free from the constraints of Versailles, including the famous Queen\'s Hamlet where she enjoyed the illusion of a rustic, pastoral life.',
                'saviezVous': 'The Petit Trianon was gifted by Louis XVI to Queen Marie-Antoinette, who ruled her own intimate rural sphere there.',
                'photoAstuce': 'Photograph the pink facades of the Grand Trianon in the late afternoon to capture the warm pastel tones of its marbles.'
              },
              {
                'titre': 'Jardins du Château de Versailles',
                'titreAffichage': 'The Gardens (Les Jardins)',
                'image': 'assets/chateaux/versailles/4.webp',
                'typeAcces': 'Usually Free (Paid on Fountain Show days)',
                'histoire': 'Designed by the brilliant landscape architect André Le Nôtre starting in 1661, the gardens of Versailles represent the archetype and absolute masterpiece of formal French garden design. Their creation required a titanic earth-moving effort, involving thousands of men to drain the original swamps. They combine perfect symmetry, grandiose perspectives, geometric parterres, and hundreds of mythological statues. The secret groves and monumental fountains were powered by a hydraulic system of unprecedented complexity for its time, designed to dazzle the court during lavish royal celebrations and festivals.',
                'saviezVous': 'The estate required massive hydraulic machinery, the Machine de Marly, to pump water from the Seine River to the basins.',
                'photoAstuce': 'Stand at the top of the Grand Perspective near Latona to capture the vastness of the pathways leading to the Grand Canal.'
              },
              {
                'titre': 'Grand Canal de Versailles',
                'titreAffichage': 'The Park & Grand Canal (Le Parc)',
                'image': 'assets/chateaux/versailles/5.jpg',
                'typeAcces': 'Free',
                'histoire': 'Stretching majestically for 1,670 meters and designed in the shape of a cross, the Grand Canal is the masterpiece of the Versailles park. Completed in 1679, it reflects the setting sun and visually extends the perspective of the palace all the way to the horizon. During the reign of Louis XIV, this vast body of water was not just decorative: it served as a huge playground for spectacular nautical festivals. The Sun King even established a miniature flotilla there, including longboats, gondolas gifted by Venice, and actual scale-model warships, navigating on this true inland port.',
                'saviezVous': 'The Grand Canal was so vast it served as a miniature port where King Louis XIV sailed armed model warships.',
                'photoAstuce': 'Rent a rowboat on the Grand Canal and take a low-angle photo with the palace in the distant background.'
              },
              {
                'titre': 'Salle du Jeu de paume',
                'titreAffichage': 'The Tennis Court (Salle du Jeu de Paume)',
                'image': 'assets/chateaux/versailles/6.jpg',
                'typeAcces': 'Free / Subject to schedules',
                'histoire': 'Built in 1686 to allow the court to play "jeu de paume" (the ancestor of modern tennis), this hall with its high ceilings and vast windows entered world history in an unexpected way. On June 20, 1789, after King Louis XVI locked them out of their usual meeting hall, the deputies of the Third Estate barricaded themselves inside. It was here that they swore the famous "Tennis Court Oath," pledging never to disband until they had drafted and adopted a Constitution for France. This act of defiance marked the end of absolute monarchy and became the true founding spark of the French Revolution and the country\'s modern democracy.',
                'saviezVous': 'This historic oath is considered the founding milestone of modern parliamentary democracy in France.',
                'photoAstuce': 'Focus on the internal historic commemorative plaques to document the symbolic nature of the venue.'
              }
            ]
          }
        ]
      };
    } else {
      return {
        'pageTitle': 'Château de Versailles : Merveille Royale',
        'introTitle': 'L\'Histoire du Château de Versailles',
        'introText': 'Construit à l\'origine comme pavillon de chasse par Louis XIII, le château a été transformé et agrandi par son fils Louis XIV pour devenir le symbole absolu de la monarchie absolue et le siège du pouvoir royal français.',
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
        'hauteSaisonTitle': 'Horaires Haute Saison (1er avril - 31 octobre)',
        'hauteSaisonContent': '''
• Le Château : 
Ouvert tous les jours sauf les lundis. 
9h – 18h30 (Dernière admission : 17h45, Caisses : 17h30).

• Le domaine de Trianon : 
Ouvert tous les jours sauf les lundis. 
12h – 18h30 (Dernière admission : 17h45).

• Le Jardin du Parfumeur : 
Ouvert tous les week-ends du 9 mai au 27 septembre, 12h – 18h30.

• La galerie des Carrosses & Sculptures : 
Ouvert samedis, dimanches et jours fériés de 12h30 à 18h30 (Accès gratuit).

• La salle du Jeu de Paume : 
Ouvert tous les jours sauf les lundis, 12h30 – 18h30 (Accès gratuit).

• Les Jardins et Le Parc : 
Ouverts tous les jours de 7h à 20h30 (sauf météo exceptionnelle).

• Le domaine de Marly : 
Ouvert tous les jours de 7h à 19h30.''',
        'basseSaisonTitle': 'Horaires Basse Saison (1er novembre - 31 mars)',
        'basseSaisonContent': '''
• Le Château & Domaine de Trianon : 
Ouverts tous les jours sauf le lundi. 
9h – 17h30 (Dernière admission : 16h45). Fermé le 25 déc. et 1er janv.

• La galerie des Carrosses : 
Ouverte samedis et dimanches de 12h30 à 17h30. Fermée le 25 déc. et 1er janv.

• La Salle du Jeu de Paume : 
Ouverte du mardi au dimanche de 12h30 à 17h30.

• Les Jardins & Le Parc : 
Ouverts de 8h à 18h, dernier accès 17h30 (sauf météo exceptionnelle).

• Le domaine de Marly : 
Ouvert aux piétons tous les jours de 8h à 18h.''',
        'histoireLabel': 'Histoire et récit détaillé',
        'saviezVousLabel': 'Saviez-vous ?',
        'photoAstuceLabel': '📸 Astuce photo :',
        'mapsLabel': 'Ouvrir dans Maps',
        'avertissementMeteo': '⚠️ Attention : Vérifiez attentivement la météo ainsi que les tarifs et horaires des billets avant de visiter Versailles, car les conditions peuvent changer au cours de l’année.',
        'quartiers': [
          {
            'nomQuartier': 'Les Domaines & Monuments Royaux',
            'lieux': [
              {
                'titre': 'Château de Versailles',
                'titreAffichage': 'Le château de Versailles',
                'image': 'assets/chateaux/versailles/2.jpeg',
                'typeAcces': 'Payant / Billet passeport',
                'histoire': 'Construit à l\'origine comme modeste pavillon de chasse de brique et de pierre par Louis XIII en 1623, le château a été magistralement transformé et agrandi par son fils Louis XIV, le Roi-Soleil, à partir de 1661. Il souhaitait s\'éloigner des tumultes de Paris et asseoir son pouvoir absolu. Le palais est devenu le siège officiel de la cour et du gouvernement français, symbole ultime de la monarchie absolue jusqu\'à la Révolution française en 1789. Avec ses 2300 pièces et son architecture baroque spectaculaire signée Le Vau et Mansart, il incarne l\'apogée de l\'art classique français.',
                'saviezVous': 'Saviez-vous que la célèbre Galerie des Glaces compte 357 miroirs et a été conçue pour impressionner les ambassadeurs étrangers par sa magnificence et sa démesure financière ?',
                'photoAstuce': 'Pour éviter la foule et saisir les reflets parfaits des lustres dorés, présentez-vous dès l\'ouverture le matin dans la Galerie des Glaces.'
              },
              {
                'titre': 'Domaine de Trianon',
                'titreAffichage': 'Domaine de Trianon',
                'image': 'assets/chateaux/versailles/3.webp',
                'typeAcces': 'Payant / Inclus dans le passeport',
                'histoire': 'Le domaine de Trianon, comprenant le Grand Trianon et le Petit Trianon, offrait aux souverains un refuge intimiste loin de l\'étiquette rigoureuse et de la cour officielle du Château principal. Le Grand Trianon, palais de marbre rose fait construire par Louis XIV, était dédié à ses amours et aux collations estivales. Le Petit Trianon, chef-d\'œuvre néoclassique commandé par Louis XV, fut plus tard offert par Louis XVI à la reine Marie-Antoinette. Elle y créa son propre univers, loin des contraintes de Versailles, incluant le célèbre Hameau de la Reine où elle aimait retrouver une vie d\'apparence paysanne et bucolique.',
                'saviezVous': 'Saviez-vous que le Petit Trianon a été offert par Louis XVI à la reine Marie-Antoinette, qui y tint un rôle de souveraine absolue de sa propre sphère intime et champêtre ?',
                'photoAstuce': 'Prenez les façades roses du Grand Trianon en fin d\'après-midi pour capturer les magnifiques teintes pastels de ses marbres.'
              },
              {
                'titre': 'Jardins du Château de Versailles',
                'titreAffichage': 'Les Jardins',
                'image': 'assets/chateaux/versailles/4.webp',
                'typeAcces': 'Gratuit (Sauf jours de Grandes Eaux)',
                'histoire': 'Aménagés par le génial paysagiste André Le Nôtre à partir de 1661, les jardins de Versailles représentent l\'archétype et le chef-d\'œuvre absolu du jardin à la française. Leur création a nécessité un travail titanesque de terrassement, impliquant des milliers d\'hommes pour assécher les marécages initiaux. Ils allient une symétrie parfaite, des perspectives grandioses, des parterres géométriques, et des centaines de statues mythologiques. Les bosquets secrets et les fontaines monumentales étaient animés par un système hydraulique d\'une complexité inédite pour l\'époque, conçu pour éblouir la cour lors des somptueuses fêtes royales.',
                'saviezVous': 'Saviez-vous que les fontaines des jardins nécessitaient une machinerie hydraulique gigantesque, la célèbre Machine de Marly, pour pomper l\'eau de la Seine jusqu\'aux bassins ?',
                'photoAstuce': 'Placez-vous au sommet de la Grande Perspective (près de Latone) pour immortaliser l\'immensité des allées menant au Grand Canal.'
              },
              {
                'titre': 'Grand Canal de Versailles',
                'titreAffichage': 'Le Parc',
                'image': 'assets/chateaux/versailles/5.jpg',
                'typeAcces': 'Gratuit',
                'histoire': 'S\'étendant majestueusement sur 1 670 mètres de long et conçu en forme de croix, le Grand Canal est la pièce maîtresse du parc de Versailles. Achevé en 1679, il reflète le soleil couchant et prolonge visuellement la perspective du château jusqu\'à l\'horizon. Sous le règne de Louis XIV, ce plan d\'eau n\'était pas seulement décoratif : il servait de vaste terrain de jeu pour des fêtes nautiques grandioses. Le Roi-Soleil y fit même construire une flottille miniature, comprenant des chaloupes, des gondoles offertes par Venise, et de véritables navires de guerre en modèle réduit, naviguant sur ce véritable port intérieur.',
                'saviezVous': 'Saviez-vous que le Grand Canal a des dimensions si vastes qu\'il a servi de port miniature où le roi Louis XIV faisait naviguer de véritables petits navires armés ?',
                'photoAstuce': 'Louez une barque sur le Grand Canal et prenez une photo à ras de l\'eau avec le château en arrière-plan au loin.'
              },
              {
                'titre': 'Salle du Jeu de paume',
                'titreAffichage': 'La Salle du Jeu de Paume',
                'image': 'assets/chateaux/versailles/6.jpg',
                'typeAcces': 'Gratuit / Accès selon programmation',
                'histoire': 'Édifiée en 1686 pour permettre à la cour de jouer au jeu de paume (l\'ancêtre du tennis), cette salle au plafond haut et aux vastes fenêtres est entrée dans la grande Histoire de manière inattendue. Le 20 juin 1789, face à la fermeture de leur salle de réunion habituelle par le roi Louis XVI, les députés du Tiers État s\'y barricadèrent. C\'est là qu\'ils prêtèrent le célèbre « Serment du Jeu de paume », jurant de ne jamais se séparer avant d\'avoir rédigé et adopté une Constitution pour la France. Cet acte de défiance marque la fin de la monarchie absolue et la véritable étincelle fondatrice de la Révolution française et de la démocratie moderne du pays.',
                'saviezVous': 'Ce serment fondateur est considéré comme l\'acte de naissance de la démocratie parlementaire française.',
                'photoAstuce': 'Cadrez l\'intérieur en mettant en valeur les plaques commémoratives historiques pour capturer la solennité des lieux.'
              }
            ]
          }
        ]
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
    final bool isRtl = _currentLanguageCode == 'ar';
    final data = _getLocalizedChateauData();
    final months = data['months'] as List;
    final quartiers = data['quartiers'] as List;

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
                            fontSize: 20,
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
                      GestureDetector(
                        onTap: _toggleLanguage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161821),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: _currentColor.withOpacity(0.4), width: 1.2),
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
                              Icon(Icons.language, color: _currentColor, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                _currentLanguageCode.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
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

                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF161821),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: _currentColor.withOpacity(0.3), width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['introTitle'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data['introText'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/chateaux/versailles/1.jpg',
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
                  const SizedBox(height: 24),

                  Container(
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
                        const SizedBox(height: 16),
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
                        const SizedBox(height: 16),
                        const Divider(color: Colors.white10),
                        const SizedBox(height: 12),
                        Text(
                          data['hauteSaisonTitle'],
                          style: TextStyle(
                            color: _currentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          data['hauteSaisonContent'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          data['basseSaisonTitle'],
                          style: TextStyle(
                            color: _currentColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          data['basseSaisonContent'],
                          style: const TextStyle(
                            color: Color(0xFFB0B4C3),
                            fontSize: 12,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  ...quartiers.map((quartier) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            quartier['nomQuartier'],
                            style: TextStyle(
                              color: _currentColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ...quartier['lieux'].map((lieu) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFF161821),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.white.withOpacity(0.06)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                                  child: Image.asset(
                                    lieu['image'],
                                    height: 180,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => Container(
                                      height: 180,
                                      color: const Color(0xFF1E2029),
                                      child: const Center(
                                        child: Icon(Icons.image_not_supported, color: Colors.white54, size: 30),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        lieu['titreAffichage'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
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
                                          lieu['typeAcces'],
                                          style: TextStyle(
                                            color: _currentColor,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        data['histoireLabel'],
                                        style: TextStyle(
                                          color: _currentColor,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        lieu['histoire'],
                                        style: const TextStyle(
                                          color: Color(0xFFB0B4C3),
                                          fontSize: 13,
                                          height: 1.5,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF0B0C10),
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.white10),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(Icons.lightbulb, color: Colors.amber, size: 16),
                                                const SizedBox(width: 6),
                                                Text(
                                                  data['saviezVousLabel'],
                                                  style: const TextStyle(
                                                    color: Colors.amber,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              lieu['saviezVous'],
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        '${data['photoAstuceLabel']} ${lieu['photoAstuce']}',
                                        style: const TextStyle(
                                          color: Colors.white60,
                                          fontSize: 12,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: _currentColor,
                                            foregroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                          ),
                                          onPressed: () => _openMap(lieu['titre']),
                                          icon: const Icon(Icons.map, size: 16),
                                          label: Text(data['mapsLabel']),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}