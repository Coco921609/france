import 'package:france/paysages/canyons/dune_du_pilat.dart' as dune_du_pilat;
import 'package:france/paysages/canyons/orgues_d_ille.dart' as orgues_d_ille;
import 'package:france/paysages/canyons/rougier_de_camares.dart' as rougier_de_camares;
import 'package:france/paysages/canyons/sentier_des_ocres.dart' as sentier_des_ocres;
import 'package:france/paysages/eaux/cascades_des_tufs.dart' as cascades_des_tufs;
import 'package:france/paysages/eaux/gorges_du_fier.dart' as gorges_du_fier;
import 'package:france/paysages/eaux/gorges_du_verdon.dart' as gorges_du_verdon;
import 'package:france/paysages/eaux/ile_de_la_vierge.dart' as ile_de_la_vierge;
import 'package:france/paysages/eaux/lac_d_allos.dart' as lac_d_allos;
import 'package:france/paysages/eaux/lac_de_lorceyrette.dart' as lac_de_lorceyrette;
import 'package:france/paysages/eaux/meandre_de_queuille.dart' as meandre_de_queuille;
import 'package:france/paysages/eaux/plateau_des_1000_etangs.dart' as plateau_des_1000_etangs;
import 'package:france/paysages/panoramas/etretat.dart' as etretat;
import 'package:france/paysages/panoramas/marais_d_aigues_mortes.dart' as marais_d_aigues_mortes;
import 'package:france/paysages/panoramas/pont_du_gard.dart' as pont_du_gard;
import 'package:france/paysages/panoramas/puy_de_dome.dart' as puy_de_dome;
import 'package:france/paysages/parcs/buttes_chaumont.dart' as buttes_chaumont;
import 'package:france/paysages/parcs/chemin_des_cimes.dart' as chemin_des_cimes;
import 'package:france/paysages/parcs/foret_de_broceliande.dart' as foret_de_broceliande;
import 'package:france/paysages/parcs/foret_fontainebleau.dart' as foret_fontainebleau;
import 'package:france/paysages/parcs/gouffre_de_padirac.dart' as gouffre_de_padirac;
import 'package:france/paysages/parcs/mont_saint_michel.dart' as mont_saint_michel;
import 'package:france/paysages/parcs/palais_ideal.dart' as palais_ideal;
import 'package:france/paysages/parcs/parc_monceau.dart' as parc_monceau;

import 'paysages/canyons/sentier_des_ocres.dart';
import 'paysages/canyons/orgues_d_ille.dart';
import 'paysages/canyons/rougier_de_camares.dart';
import 'paysages/canyons/altschlossfelsen.dart';
import 'paysages/canyons/dune_du_pilat.dart';

// ==========================================
// 🏰 Châteaux & Patrimoine Historique / Castles & Historical Heritage / القلاع والتراث التاريخي
// ==========================================
import 'chateaux/chateau_de_verseilles.dart';
import 'chateaux/chateau_de_chambord.dart';
import 'chateaux/chateau_de_chenonceau.dart';
import 'chateaux/cheverny.dart';
import 'chateaux/chaumont_sur_loire.dart';
import 'chateaux/villandry.dart';
import 'chateaux/azay_le_rideau.dart';
import 'chateaux/rigny_usse.dart';
import 'chateaux/brissac.dart';

// ==========================================
// 🛶 Gorges & Eaux Turquoises / Gorges & Turquoise Waters / المضايق والمياه الفيروزية
// ==========================================
import 'paysages/eaux/gorges_du_verdon.dart';
import 'paysages/eaux/ile_de_la_vierge.dart';
import 'paysages/eaux/gorges_du_fier.dart';
import 'paysages/eaux/cascades_des_tufs.dart';
import 'paysages/eaux/meandre_de_queuille.dart';
import 'paysages/eaux/lac_de_lorceyrette.dart';
import 'paysages/eaux/lac_d_allos.dart';
import 'paysages/eaux/plateau_des_1000_etangs.dart';
import 'paysages/eaux/gorges_de_nouailles.dart';
import 'paysages/eaux/les_4_lacs.dart';
import 'paysages/eaux/pont_d_arc.dart';
import 'paysages/eaux/lac_d_oo.dart';
import 'paysages/eaux/lac_de_capitello.dart';
import 'paysages/eaux/marais_poitevin.dart';
import 'paysages/eaux/lac_d_annecy.dart';
import 'paysages/eaux/sillans_la_cascade.dart';
import 'paysages/eaux/cascades_du_herisson.dart';
import 'paysages/eaux/lac_bleu.dart';
import 'paysages/eaux/gorges_du_tarn.dart';

// ==========================================
// 🏛️ Parcs & Monuments Insolites / Unusual Parks & Monuments / الحدائق والآثار غير التقليدية
// ==========================================
import 'paysages/parcs/buttes_chaumont.dart';
import 'paysages/parcs/palais_ideal.dart';
import 'paysages/parcs/parc_monceau.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// ==========================================
// 🏜️ Canyons & Déserts / Canyons & Deserts / الأخدود والصحاري
// ==========================================
import 'paysages/canyons/sentier_des_ocres.dart';
import 'paysages/canyons/orgues_d_ille.dart';
import 'paysages/canyons/rougier_de_camares.dart';
import 'paysages/canyons/altschlossfelsen.dart';
import 'paysages/canyons/dune_du_pilat.dart';

// ==========================================
// 🏰 Châteaux & Patrimoine Historique / Castles & Historical Heritage / القلاع والتراث التاريخي
// ==========================================
import 'chateaux/chateau_de_verseilles.dart';
import 'chateaux/chateau_de_chambord.dart';
import 'chateaux/chateau_de_chenonceau.dart';
import 'chateaux/cheverny.dart';
import 'chateaux/chaumont_sur_loire.dart';
import 'chateaux/villandry.dart';
import 'chateaux/azay_le_rideau.dart';
import 'chateaux/rigny_usse.dart';
import 'chateaux/brissac.dart';

// ==========================================
// 🛶 Gorges & Eaux Turquoises / Gorges & Turquoise Waters / المضايق والمياه الفيروزية
// ==========================================
import 'paysages/eaux/gorges_du_verdon.dart';
import 'paysages/eaux/ile_de_la_vierge.dart';
import 'paysages/eaux/gorges_du_fier.dart';
import 'paysages/eaux/cascades_des_tufs.dart';
import 'paysages/eaux/meandre_de_queuille.dart';
import 'paysages/eaux/lac_de_lorceyrette.dart';
import 'paysages/eaux/lac_d_allos.dart';
import 'paysages/eaux/plateau_des_1000_etangs.dart';
import 'paysages/eaux/gorges_de_nouailles.dart';
import 'paysages/eaux/les_4_lacs.dart';
import 'paysages/eaux/pont_d_arc.dart';
import 'paysages/eaux/lac_d_oo.dart';
import 'paysages/eaux/lac_de_capitello.dart';
import 'paysages/eaux/marais_poitevin.dart';
import 'paysages/eaux/lac_d_annecy.dart';
import 'paysages/eaux/sillans_la_cascade.dart';
import 'paysages/eaux/cascades_du_herisson.dart';
import 'paysages/eaux/lac_bleu.dart';
import 'paysages/eaux/gorges_du_tarn.dart';

// ==========================================
// 🏛️ Parcs & Monuments Insolites / Unusual Parks & Monuments / الحدائق والآثار غير التقليدية
// ==========================================
import 'paysages/parcs/buttes_chaumont.dart';
import 'paysages/parcs/palais_ideal.dart';
import 'paysages/parcs/parc_monceau.dart';
import 'paysages/parcs/foret_fontainebleau.dart';
import 'paysages/parcs/chemin_des_cimes.dart';
import 'paysages/parcs/mont_saint_michel.dart';
import 'paysages/parcs/foret_de_broceliande.dart';
import 'paysages/parcs/gouffre_de_padirac.dart';

// ==========================================
// 🌋 Panoramas Uniques / Unique Panoramas / المناظر الطبيعية الفريدة
// ==========================================
import 'paysages/panoramas/puy_de_dome.dart';
import 'paysages/panoramas/pont_du_gard.dart';
import 'paysages/panoramas/marais_d_aigues_mortes.dart';
import 'paysages/panoramas/etretat.dart';
import 'paysages/panoramas/mont_blanc.dart';
import 'paysages/panoramas/montagne_sainte_victoire.dart';
import 'paysages/panoramas/camargue.dart';
import 'paysages/panoramas/massif_de_l_esterel.dart';
import 'paysages/panoramas/aiguilles_de_bavella.dart';
import 'paysages/panoramas/pic_du_canigou.dart';
import 'paysages/panoramas/cirque_de_navacelles.dart';
import 'paysages/panoramas/dentelles_de_montmirail.dart';
import 'paysages/panoramas/cote_de_granit_rose.dart';
import 'paysages/panoramas/reserve_de_scandola.dart';

// ==========================================
// 🌊 Les Calanques de France / The Coves of France / خلجان فرنسا
// ==========================================
import 'paysages/calanques/calanque_de_sugiton.dart' as sugiton;
import 'paysages/calanques/calanques_de_cassis.dart' as cassis;
import 'paysages/calanques/calanques_de_piana.dart' as piana;
import 'paysages/canyons/altschlossfelsen.dart' as altschlossfelsen;

import 'parametres.dart';
import 'favoris.dart';

// ==========================================
// SYSTÈME DE DESIGN / DESIGN SYSTEM / نظام التصميم
// ==========================================
class ModernTheme {
  static const Color background = Color(0xFF070913);
  static const Color surface = Color(0xFF13182C);
  static const Color surfaceCard = Color(0xFF1A2238);
  static const Color primaryAccent = Color(0xFF6366F1);
  static const Color secondaryAccent = Color(0xFFEC4899);
  static const Color textLight = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color borderLight = Color(0xFF2A3655);
}

// ==========================================
// CLIPPER DE BARRE DE NAVIGATION / CURVED NAVBAR CLIPPER / قصاص شريط التنقل المنحني
// ==========================================
class CurvedNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    path.moveTo(0, 24);
    path.quadraticBezierTo(0, 0, 24, 0);
    path.lineTo(w * 0.33, 0);

    path.cubicTo(
      w * 0.40, 0,
      w * 0.40, 42,
      w * 0.50, 42,
    );
    path.cubicTo(
      w * 0.60, 42,
      w * 0.60, 0,
      w * 0.67, 0,
    );

    path.lineTo(w - 24, 0);
    path.quadraticBezierTo(w, 0, w, 24);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// ==========================================
// ÉCRAN D'ACCUEIL / HOME SCREEN / شاشة الاستقبال
// ==========================================
class AccueilScreen extends StatefulWidget {
  final String userName;
  final String languageCode;
  final String selectedAvatar;
  final Color themeColor;

  const AccueilScreen({
    super.key,
    required this.userName,
    required this.languageCode,
    required this.selectedAvatar,
    required this.themeColor,
  });

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  late String _currentLang;
  late String _userName;
  late String _selectedAvatar;
  late Color _themeColor;
  int _currentIndex = 1; // 0: Châteaux, 1: Accueil (centre), 2: Paysages
  List<String> _favoriteKeys = [];

  final List<int> _tabHistory = [1];

  final Map<String, Map<String, String>> _translations = {
    'fr': {
      'welcome': 'Bonjour',
      'explore': 'Explore la France',
      'franceIntro': 'Partez à la découverte des plus beaux trésors, monuments historiques et paysages spectaculaires de la France à travers un voyage inoubliable.',
      'chateauxIntro': 'Plongez au cœur de l’histoire royale en explorant les plus majestueux châteaux et domaines du patrimoine français.',
      'paysagesIntro': 'Évadez-vous à travers des canyons grandioses, des lacs cristallins et des panoramas naturels d’exception.',
      'sectionChateaux': 'Châteaux Historiques',
      'sectionPaysages': 'Paysages & Nature',
      'chateaux': 'Châteaux',
      'home': 'Évasion',
      'paysages': 'Paysages',
      'favorisBtn': 'Mes Favoris',
      'selectAllFavs': 'Tout ajouter aux favoris',
      'removeAllFavs': 'Tout retirer des favoris',
      'defaultDesc': 'Découvrez la richesse et le patrimoine de cette destination.',
      'changeLangLabel': 'Changer la langue :',
      'discover': 'Découvrir',
      'catChateauxHeritage': '🏰 Châteaux & Patrimoine Historique',
      'catCanyons': '🏜️ Canyons & Déserts',
      'catGorges': '🛶 Gorges & Eaux Turquoises',
      'catParks': '🏛️ Parcs & Monuments Insolites',
      'catPanoramas': '🌋 Panoramas Uniques',
      'catCalanques': '🌊 Les Calanques de France',
    },
    'en': {
      'welcome': 'Hello',
      'explore': 'Explore France',
      'franceIntro': 'Set out to discover France’s most beautiful treasures, historical monuments, and spectacular landscapes through an unforgettable journey.',
      'chateauxIntro': 'Dive into royal history by exploring the most majestic castles and estates of French heritage.',
      'paysagesIntro': 'Escape through grandiose canyons, crystalline lakes, and exceptional natural panoramas.',
      'sectionChateaux': 'Historical Castles',
      'sectionPaysages': 'Landscapes & Nature',
      'chateaux': 'Castles',
      'home': 'Explore',
      'paysages': 'Landscapes',
      'favorisBtn': 'My Favorites',
      'selectAllFavs': 'Add all to favorites',
      'removeAllFavs': 'Remove all from favorites',
      'defaultDesc': 'Discover the richness and heritage of this destination.',
      'changeLangLabel': 'Change language:',
      'discover': 'Discover',
      'catChateauxHeritage': '🏰 Castles & Historical Heritage',
      'catCanyons': '🏜️ Canyons & Deserts',
      'catGorges': '🛶 Gorges & Turquoise Waters',
      'catParks': '🏛️ Unusual Parks & Monuments',
      'catPanoramas': '🌋 Unique Panoramas',
      'catCalanques': '🌊 The Coves of France',
    },
    'ar': {
      'welcome': 'أهلاً',
      'explore': 'استكشف فرنسا',
      'franceIntro': 'انطلق في اكتشاف أجمل كنوز فرنسا ومعالمها التاريخية ومناظرها الطبيعية الخلابة من خلال رحلة لا تنسى.',
      'chateauxIntro': 'غوصوا في أعماق التاريخ الملكي من خلال استكشاف أروع القلاع والمعالم التاريخية الفرنسية.',
      'paysagesIntro': 'اهربوا إلى طبيعة خلابة بين الأخدود المذهلة، البحيرات الصافية والمناظر الطبيعية الاستثنائية.',
      'sectionChateaux': 'القلاع التاريخية',
      'sectionPaysages': 'الطبيعة والمناظر',
      'chateaux': 'القلاع',
      'home': 'الرئيسية',
      'paysages': 'المناظر',
      'favorisBtn': 'المفضلة',
      'selectAllFavs': 'إضافة الكل إلى المفضلة',
      'removeAllFavs': 'إزالة الكل من المفضلة',
      'defaultDesc': 'اكتشف ثراء وتراث هذه الوجهة.',
      'changeLangLabel': 'تغيير اللغة:',
      'discover': 'اكتشف',
      'catChateauxHeritage': '🏰 القلاع والتراث التاريخي',
      'catCanyons': '🏜️ الأخدود والصحاري',
      'catGorges': '🛶 المضايق والمياه الفيروزية',
      'catParks': '🏛️ الحدائق والآثار غير التقليدية',
      'catPanoramas': '🌋 المناظر الطبيعية الفريدة',
      'catCalanques': '🌊 خلجان فرنسا',
    },
  };

  List<Map<String, dynamic>> get _chateauxCategories => [
    {
      'categoryKey': 'catChateauxHeritage',
      'items': [
        {
          'key': 'chateau_de_verseilles',
          'name': {'fr': '🏰 Château de Versailles', 'en': '🏰 Palace of Versailles', 'ar': '🏰 قصر فرساي'}[_currentLang]!,
          'desc': {'fr': 'Ancienne résidence royale des rois de France.', 'en': 'Former royal residence of the kings of France.', 'ar': 'المقر الملكي السابق لملوك فرنسا.'}[_currentLang]!,
          'imagepath': 'assets/chateaux/versailles/1.jpg'
        },
        {
          'key': 'chateau_de_chambord',
          'name': {'fr': '🏰 Château de Chambord', 'en': '🏰 Chambord Castle', 'ar': '🏰 قلعة شامبور'}[_currentLang]!,
          'desc': {'fr': 'Chef-d’œuvre de la Renaissance française.', 'en': 'Masterpiece of the French Renaissance.', 'ar': 'تحفة عصر النهضة الفرنسية.'}[_currentLang]!,
          'imagepath': 'assets/chateaux/cham/2.jpg'
        },
      ],
    },
  ];

  List<Map<String, dynamic>> get _paysagesCategories => [
    {
      'categoryKey': 'catCanyons',
      'items': [
        {
          'key': 'sentier_des_ocres',
          'name': {'fr': '🏜️ Sentier des ocres', 'en': '🏜️ Ochre Trail', 'ar': '🏜️ مسار الأوكر'}[_currentLang]!,
          'desc': {'fr': 'Paysage flamboyant aux accents de Colorado.', 'en': 'Flamboyant landscape with Colorado accents.', 'ar': 'مشهد مذهل بألوان كولورادو.'}[_currentLang]!,
          'imagepath': 'assets/images/20190528-165859-largejpg.jpg'
        },
        {
          'key': 'orgues_d_ille',
          'name': {'fr': '⛰️ Les orgues d’Ille', 'en': '⛰️ Orgues d’Ille', 'ar': '⛰️ أورغ إيل'}[_currentLang]!,
          'desc': {'fr': 'Chemins de fées et cheminées de fées.', 'en': 'Fairy paths and fairy chimneys.', 'ar': 'مسارات الجنيات ومداخن الجنيات.'}[_currentLang]!,
          'imagepath': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg'
        },
        {
          'key': 'rougier_de_camares',
          'name': {'fr': '🤠 Rougier de Camarès', 'en': '🤠 Rougier de Camarès', 'ar': '🤠 روجيه دي كاماريس'}[_currentLang]!,
          'desc': {'fr': 'Terre rouge et paysages lunaires.', 'en': 'Red earth and lunar landscapes.', 'ar': 'أرض حمراء ومناظر طبيعية تشبه القمر.'}[_currentLang]!,
          'imagepath': 'assets/images/45.jpg'
        },
        {
          'key': 'altschlossfelsen',
          'name': {'fr': '🧗 Altschlossfelsen', 'en': '🧗 Altschlossfelsen', 'ar': '🧗 ألتشلوسفيلسن'}[_currentLang]!,
          'desc': {'fr': 'Grès sculpté et falaises mystérieuses.', 'en': 'Sculpted sandstone and mysterious cliffs.', 'ar': 'الحجر الرملي المنحوت والمنحدرات الغامضة.'}[_currentLang]!,
          'imagepath': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg'
        },
        {
          'key': 'dune_du_pilat',
          'name': {'fr': '🐪 La dune du Pilat', 'en': '🐪 Dune of Pilat', 'ar': '🐪 كثبان بيلا'}[_currentLang]!,
          'desc': {'fr': 'La plus haute dune de sable d’Europe.', 'en': 'The highest sand dune in Europe.', 'ar': 'أعلى كثبان رملية في أوروبا.'}[_currentLang]!,
          'imagepath': 'assets/images/sudouest-photo-1-32378160-1600.jpg'
        },
      ],
    },
    {
      'categoryKey': 'catGorges',
      'items': [
        {
          'key': 'gorges_du_verdon',
          'name': {'fr': '🛶 Gorges du Verdon', 'en': '🛶 Verdon Gorges', 'ar': '🛶 مضيق فيردون'}[_currentLang]!,
          'desc': {'fr': 'Le Grand Canyon européen aux eaux émeraude.', 'en': 'The European Grand Canyon with emerald waters.', 'ar': 'الأخدود الأوروبي الكبير بمياهه الزمردية.'}[_currentLang]!,
          'imagepath': 'assets/images/VERDON.jpg'
        },
        {
          'key': 'ile_de_la_vierge',
          'name': {'fr': '🏝️ Île de la Vierge', 'en': '🏝️ Virgin Island', 'ar': '🏝️ جزيرة العذراء'}[_currentLang]!,
          'desc': {'fr': 'Eaux cristallines et beauté sauvage en Bretagne.', 'en': 'Crystalline waters and wild beauty in Brittany.', 'ar': 'مياه صافية وجمال بري في بريتاني.'}[_currentLang]!,
          'imagepath': 'assets/images/crique-ile-vierge-crozon.jpg'
        },
        {
          'key': 'gorges_du_fier',
          'name': {'fr': '🌉 Gorges du Fier', 'en': '🌉 Fier Gorges', 'ar': '🌉 مضيق فيير'}[_currentLang]!,
          'desc': {'fr': 'Canyon spectaculaire creusé par l’eau.', 'en': 'Spectacular canyon carved by water.', 'ar': 'أخدود رائع حفرته المياه.'}[_currentLang]!,
          'imagepath': 'assets/images/gorges-du-fier-annecy-15.jpg'
        },
        {
          'key': 'cascades_des_tufs',
          'name': {'fr': '💧 Cascades des Tufs', 'en': '💧 Tufs Waterfalls', 'ar': '💧 شلالات توف'}[_currentLang]!,
          'desc': {'fr': 'Chutes d’eau féeriques et moussues.', 'en': 'Fairy and mossy waterfalls.', 'ar': 'شلالات ساحرة ومغطاة بالطحالب.'}[_currentLang]!,
          'imagepath': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg'
        },
        {
          'key': 'meandre_de_queuille',
          'name': {'fr': '🌿 Méandre de Queuille', 'en': '🌿 Queuille Meander', 'ar': '🌿 منعطف كويي'}[_currentLang]!,
          'desc': {'fr': 'Boucle spectaculaire de la rivière en Auvergne.', 'en': 'Spectacular river loop in Auvergne.', 'ar': 'حلقة نهر مذهلة في أوفيرني.'}[_currentLang]!,
          'imagepath': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg'
        },
        {
          'key': 'lac_de_lorceyrette',
          'name': {'fr': '🇨🇦 Lac de l’Orceyrette', 'en': '🇨🇦 Lake Lorceyrette', 'ar': '🇨🇦 بحيرة لورسيريت'}[_currentLang]!,
          'desc': {'fr': 'Écrin d’eau paisible et verdoyant.', 'en': 'Peaceful and green water setting.', 'ar': 'محيط مائي هادئ وخراج.'}[_currentLang]!,
          'imagepath': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg'
        },
        {
          'key': 'lac_d_allos',
          'name': {'fr': '🇳🇴 Lac d’Allos', 'en': '🇳🇴 Lake Allos', 'ar': '🇳🇴 بحيرة ألوس'}[_currentLang]!,
          'desc': {'fr': 'Plus grand lac naturel de altitude d’Europe.', 'en': 'Largest high-altitude natural lake in Europe.', 'ar': 'أكبر بحيرة طبيعية عالية السطح في أوروبا.'}[_currentLang]!,
          'imagepath': 'assets/images/19.jpg'
        },
        {
          'key': 'plateau_des_1000_etangs',
          'name': {'fr': '🇫🇮 Plateau des 1000 Étangs', 'en': '🇫🇮 Plateau of 1000 Ponds', 'ar': '🇫🇮 هضبة ألف بركة'}[_currentLang]!,
          'desc': {'fr': 'Petite Finlande française aux reflets miroirs.', 'en': 'Little French Finland with mirror reflections.', 'ar': 'فنلندا الفرنسية الصغيرة بانعكاسات المرايا.'}[_currentLang]!,
          'imagepath': 'assets/image/4.jpg'
        },
      ],
    },
    {
      'categoryKey': 'catParks',
      'items': [
        {
          'key': 'buttes_chaumont',
          'name': {'fr': 'Parc Buttes-Chaumont', 'en': 'Swan Buttes-Chaumont Park', 'ar': 'Swan حديقة بوت شومون'}[_currentLang]!,
          'desc': {'fr': 'Parc vallonné aux vues panoramiques.', 'en': 'Hilly park with panoramic views.', 'ar': 'حديقة تلال ذات مناظر بانورامية.'}[_currentLang]!,
          'imagepath': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg'
        },
        {
          'key': 'palais_ideal',
          'name': {'fr': '🏯 Palais Idéal', 'en': '🏯 Ideal Palace', 'ar': '🏯 القصر المثالي'}[_currentLang]!,
          'desc': {'fr': 'Chef-d’œuvre d’architecture naïve et insolite.', 'en': 'Masterpiece of naïve and unusual architecture.', 'ar': 'تحفة العمارة الساذجة وغير التقليدية.'}[_currentLang]!,
          'imagepath': 'assets/images/facteur-cheval.jpg'
        },
        {
          'key': 'parc_monceau',
          'name': {'fr': '⛲ Parc Monceau', 'en': '⛲ Monceau Park', 'ar': '⛲ حديقة مونصو'}[_currentLang]!,
          'desc': {'fr': 'Havre de paix élégant au cœur de la ville.', 'en': 'Elegant haven of peace in the heart of the city.', 'ar': 'ملاذ هادئ وأنيق في قلب المدينة.'}[_currentLang]!,
          'imagepath': 'assets/images/597240-visuel-paris-parc-monceau.jpg'
        },
        {
          'key': 'foret_fontainebleau',
          'name': {'fr': '🌲 Foret Fontainebleau', 'en': '🌲 Fontainebleau Forest', 'ar': '🌲 غابة فونتينبلو'}[_currentLang]!,
          'desc': {'fr': 'Hêtre majestueux et chaos rocheux légendaires.', 'en': 'Majestic beech and legendary rocky chaos.', 'ar': 'شجر الزان المهيب والفوضى الصخرية الأسطورية.'}[_currentLang]!,
          'imagepath': 'assets/images/foret-de-fontainebleau.jpg'
        },
        {
          'key': 'chemin_des_cimes',
          'name': {'fr': '🌳 Chemin des Cimes', 'en': '🌳 Treetop Walk', 'ar': '🌳 مسار القمم'}[_currentLang]!,
          'desc': {'fr': 'Promenade suspendue au-dessus de la canopée.', 'en': 'Suspended walk above the canopy.', 'ar': 'نزهة معلقة فوق المظلة.'}[_currentLang]!,
          'imagepath': 'assets/images/88.jpg'
        },
        {
          'key': 'mont_saint_michel',
          'name': {'fr': '🏰 Mont Saint-Michel', 'en': '🏰 Mont Saint-Michel', 'ar': '🏰 مون سان ميشل'}[_currentLang]!,
          'desc': {'fr': 'Merveille de l’Occident entre mer et ciel.', 'en': 'Wonder of the West between sea and sky.', 'ar': 'عجيبة الغرب بين البحر والسماء.'}[_currentLang]!,
          'imagepath': 'assets/image/24.webp'
        },
        {
          'key': 'foret_de_broceliande',
          'name': {'fr': '🧙‍♂️ Forêt de Brocéliande', 'en': '🧙‍♂️ Brocéliande Forest', 'ar': '🧙‍♂️ غابة بروسيلياند'}[_currentLang]!,
          'desc': {'fr': 'Forêt légendaire des contes arthuriens.', 'en': 'Legendary forest of Arthurian tales.', 'ar': 'غابة الأساطير لقصص الملك آرثر.'}[_currentLang]!,
          'imagepath': 'assets/image/51.jpg'
        },
        {
          'key': 'gouffre_de_padirac',
          'name': {'fr': '🕳️ Le Gouffre de Padirac', 'en': '🕳️ Padirac Cave', 'ar': '🕳️ كهف باديراك'}[_currentLang]!,
          'desc': {'fr': 'Immense cavité souterraine et rivière mystérieuse.', 'en': 'Huge underground cavity and mysterious river.', 'ar': 'تجويف أرضي ضخم ونهر غامض.'}[_currentLang]!,
          'imagepath': 'assets/image/58.jpg'
        },
      ],
    },
    {
      'categoryKey': 'catPanoramas',
      'items': [
        {
          'key': 'puy_de_dome',
          'name': {'fr': '🌋 Puy de Dôme', 'en': '🌋 Puy de Dôme', 'ar': '🌋 بوي دي دوم'}[_currentLang]!,
          'desc': {'fr': 'Géant endormi de la chaîne des Puys.', 'en': 'Sleeping giant of the Puys chain.', 'ar': 'العملاق النائم لسلسلة بويس.'}[_currentLang]!,
          'imagepath': 'assets/images/dome.webp'
        },
        {
          'key': 'pont_du_gard',
          'name': {'fr': '🏛️ Pont du Gard', 'en': '🏛️ Pont du Gard', 'ar': '🏛️ بونت du غار'}[_currentLang]!,
          'desc': {'fr': 'Chef-d’œuvre de l’architecture romaine.', 'en': 'Masterpiece of Roman architecture.', 'ar': 'تحفة الهندسة المعمارية الرومانية.'}[_currentLang]!,
          'imagepath': 'assets/images/pont.webp'
        },
        {
          'key': 'marais_d_aigues_mortes',
          'name': {'fr': '🧂 Marais d’Aigues-Mortes', 'en': '🧂 Aigues-Mortes Salt Marshes', 'ar': '🧂 ملاحات إيغ مورت'}[_currentLang]!,
          'desc': {'fr': 'Miroirs d’eau aux teintes roses.', 'en': 'Water mirrors with pink hues.', 'ar': 'مرايا مائية ذات ألوان وردية.'}[_currentLang]!,
          'imagepath': 'assets/images/5.jpg'
        },
        {
          'key': 'etretat',
          'name': {'fr': '🌊 Étretat', 'en': '🌊 Étretat Cliffs', 'ar': '🌊 إتريتا'}[_currentLang]!,
          'desc': {'fr': 'Falaises crayeuses spectaculaires de Normandie.', 'en': 'Spectacular chalk cliffs of Normandy.', 'ar': 'المنحدرات الطباشيرية المذهلة في نورماندي.'}[_currentLang]!,
          'imagepath': 'assets/imag/33.webp'
        },
      ],
    },
    {
      'categoryKey': 'catCalanques',
      'items': [
        {
          'key': 'calanque_de_sugiton',
          'name': {'fr': '🌊 Calanque de Sugiton', 'en': '🌊 Sugiton Cove', 'ar': '🌊 خليج سوغيتون'}[_currentLang]!,
          'desc': {'fr': 'Joyau préservé des calanques marseillaises.', 'en': 'Preserved jewel of the Marseille coves.', 'ar': 'جوهرة محمية من خلجان مارسيليا.'}[_currentLang]!,
          'imagepath': 'assets/images/sugiton.jpg'
        },
        {
          'key': 'calanques_de_cassis',
          'name': {'fr': '🚤 Calanques de Cassis', 'en': '🚤 Cassis Coves', 'ar': '🚤 خلجان كاسييس'}[_currentLang]!,
          'desc': {'fr': 'Eaux turquoises et falaises calcaires blanches.', 'en': 'Turquoise waters and white limestone cliffs.', 'ar': 'المياه الفيروزية والمنحدرات الجيرية البيضاء.'}[_currentLang]!,
          'imagepath': 'assets/image/33.webp'
        },
        {
          'key': 'calanques_de_piana',
          'name': {'fr': '🌋 Calanques de Piana', 'en': '🌋 Piana Coves', 'ar': '🌋 خلجان بيانا'}[_currentLang]!,
          'desc': {'fr': 'Roches rouges sculptées par le vent en Corse.', 'en': 'Red rocks sculpted by the wind in Corsica.', 'ar': 'الصخور الحمراء المنحوتة بفعل الرياح في كورسيكا.'}[_currentLang]!,
          'imagepath': 'assets/image/41.webp'
        },
      ],
    },
  ];

  List<String> get _allItemKeys {
    final List<String> keys = [];
    for (var cat in _chateauxCategories) {
      for (var item in (cat['items'] as List)) {
        keys.add(item['key'] as String);
      }
    }
    for (var cat in _paysagesCategories) {
      for (var item in (cat['items'] as List)) {
        keys.add(item['key'] as String);
      }
    }
    return keys;
  }

  @override
  void initState() {
    super.initState();
    _currentLang = widget.languageCode;
    _userName = widget.userName;
    _selectedAvatar = widget.selectedAvatar;
    _themeColor = widget.themeColor;
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteKeys = prefs.getStringList('user_favorites') ?? [];
    });
  }

  Future<void> _toggleFavorite(String key) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_favoriteKeys.contains(key)) {
        _favoriteKeys.remove(key);
      } else {
        _favoriteKeys.add(key);
      }
    });
    await prefs.setStringList('user_favorites', _favoriteKeys);
  }

  Future<void> _toggleAllFavorites() async {
    final allKeys = _allItemKeys;
    final allAreFavs = allKeys.every((k) => _favoriteKeys.contains(k));
    setState(() {
      if (allAreFavs) {
        _favoriteKeys.clear();
      } else {
        _favoriteKeys = List.from(allKeys);
      }
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('user_favorites', _favoriteKeys);
  }

  @override
  void didUpdateWidget(AccueilScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.languageCode != oldWidget.languageCode) {
      _currentLang = widget.languageCode;
    }
    if (widget.userName != oldWidget.userName) {
      _userName = widget.userName;
    }
    if (widget.selectedAvatar != oldWidget.selectedAvatar) {
      _selectedAvatar = widget.selectedAvatar;
    }
    if (widget.themeColor != oldWidget.themeColor) {
      _themeColor = widget.themeColor;
    }
  }

  Future<void> _refreshData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    setState(() {
      _userName = prefs.getString('user_name') ?? widget.userName;
      _currentLang = prefs.getString('user_lang') ?? widget.languageCode;
      _selectedAvatar = prefs.getString('user_avatar') ?? widget.selectedAvatar;
      _favoriteKeys = prefs.getStringList('user_favorites') ?? [];
      final int? colorVal = prefs.getInt('user_theme_color');
      if (colorVal != null) {
        _themeColor = Color(colorVal);
      }
    });
  }

  Future<void> _changeLanguage(String? newLang) async {
    if (newLang != null) {
      setState(() {
        _currentLang = newLang;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_lang', newLang);
    }
  }

  Future<void> _navigateToPage(String key) async {
    Widget page;
    switch (key) {
      case 'chateau_de_verseilles':
        page = ChateauDeVersaillesPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'chateau_de_chambord':
        page = ChateauDeChambordPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'calanque_de_sugiton':
        page = sugiton.CalanqueDeSugitonPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'calanques_de_cassis':
        page = cassis.CalanquesDeCassisPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'calanques_de_piana':
        page = piana.CalanquesDePianaPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'altschlossfelsen':
        page = altschlossfelsen.AltschlossfelsenPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'orgues_d_ille':
        page = orgues_d_ille.OrguesIlleSurTetPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'dune_du_pilat':
        page = dune_du_pilat.DuneDuPilatPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'rougier_de_camares':
        page = rougier_de_camares.RougierCamaresPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'buttes_chaumont':
        page = buttes_chaumont.ButtesChaumontPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'palais_ideal':
        page = palais_ideal.PalaisIdealPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'foret_fontainebleau':
        page = foret_fontainebleau.ForetFontainebleauPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'chemin_des_cimes':
        page = chemin_des_cimes.CheminCimesAlsacePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'foret_de_broceliande':
        page = foret_de_broceliande.ForetDeBroceliandePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'parc_monceau':
        page = parc_monceau.ParcMonceauPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'gouffre_de_padirac':
        page = gouffre_de_padirac.LeGouffreDePadiracPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'mont_saint_michel':
        page = mont_saint_michel.MontSaintMichelPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'gorges_du_verdon':
        page = gorges_du_verdon.GorgesDuVerdonPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'ile_de_la_vierge':
        page = ile_de_la_vierge.IleDeLaViergePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'gorges_du_fier':
        page = gorges_du_fier.GorgesDuFierPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'cascades_des_tufs':
        page = cascades_des_tufs.CascadesDesTufsPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'meandre_de_queuille':
        page = meandre_de_queuille.MeandreQueuillePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'lac_de_lorceyrette':
        page = lac_de_lorceyrette.LacOrceyrettePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'lac_d_allos':
        page = lac_d_allos.LacDAllosPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'plateau_des_1000_etangs':
        page = plateau_des_1000_etangs.PlateauMilleEtangsPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'puy_de_dome':
        page = puy_de_dome.PuyDeDomePage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'pont_du_gard':
        page = pont_du_gard.PontDuGardPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'marais_d_aigues_mortes':
        page = marais_d_aigues_mortes.MaraisSalantsAiguesMortesPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'etretat':
        page = etretat.EtretatPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      case 'sentier_des_ocres':
        page = sentier_des_ocres.SentierDesOcresPage(languageCode: _currentLang, themeColor: _themeColor);
        break;
      default:
        page = const Scaffold(
          body: Center(
            child: Text('Page introuvable'),
          ),
        );
    }

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
    await _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    final t = _translations[_currentLang] ?? _translations['fr']!;
    final isRtl = _currentLang == 'ar';
    final allKeys = _allItemKeys;
    final allAreFavs = allKeys.isNotEmpty && allKeys.every((k) => _favoriteKeys.contains(k));

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: PopScope(
        canPop: _tabHistory.length <= 1,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && _tabHistory.length > 1) {
            setState(() {
              _tabHistory.removeLast();
              _currentIndex = _tabHistory.last;
            });
          }
        },
        child: Scaffold(
          backgroundColor: ModernTheme.background,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (_currentIndex == 1) ...[
                              Text(
                                _userName.isNotEmpty ? '${t['welcome']}, $_userName ✨' : '${t['welcome']}, Coco ✨',
                                style: TextStyle(
                                  color: _themeColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                t['explore']!,
                                style: const TextStyle(
                                  color: ModernTheme.textLight,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ] else if (_currentIndex == 0) ...[
                              Text(
                                t['chateaux']!,
                                style: const TextStyle(
                                  color: ModernTheme.textLight,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ] else if (_currentIndex == 2) ...[
                              Text(
                                t['paysages']!,
                                style: const TextStyle(
                                  color: ModernTheme.textLight,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [_themeColor, ModernTheme.secondaryAccent],
                              ),
                            ),
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ModernTheme.surfaceCard,
                              ),
                              child: Center(
                                child: Text(
                                  _selectedAvatar,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParametresScreen(languageCode: _currentLang),
                                ),
                              );
                              await _refreshData();
                            },
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ModernTheme.surfaceCard,
                                border: Border.all(color: ModernTheme.borderLight, width: 1.5),
                              ),
                              child: const Icon(
                                Icons.settings_rounded,
                                color: ModernTheme.textLight,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: ModernTheme.surfaceCard,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ModernTheme.borderLight, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.language_rounded, color: _themeColor, size: 20),
                            const SizedBox(width: 10),
                            Text(
                              t['changeLangLabel']!,
                              style: const TextStyle(
                                color: ModernTheme.textLight,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: ModernTheme.surface,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: ModernTheme.borderLight, width: 1),
                          ),
                          child: DropdownButton<String>(
                            value: _currentLang,
                            dropdownColor: ModernTheme.surfaceCard,
                            underline: const SizedBox(),
                            icon: const Icon(Icons.arrow_drop_down_rounded, color: ModernTheme.textLight),
                            style: const TextStyle(
                              color: ModernTheme.textLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            items: const [
                              DropdownMenuItem(value: 'fr', child: Text('🇫🇷 Français')),
                              DropdownMenuItem(value: 'en', child: Text('🇬🇧 English')),
                              DropdownMenuItem(value: 'ar', child: Text('🇸🇦 العربية')),
                            ],
                            onChanged: _changeLanguage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_currentIndex == 1) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ModernTheme.surfaceCard,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ModernTheme.borderLight, width: 1.5),
                      ),
                      child: Text(
                        t['franceIntro']!,
                        style: const TextStyle(
                          color: ModernTheme.textMuted,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavorisPage(languageCode: _currentLang, themeColor: _themeColor),
                                ),
                              );
                              await _refreshData();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _themeColor,
                              foregroundColor: ModernTheme.textLight,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                            ),
                            icon: const Icon(Icons.favorite_rounded, size: 20),
                            label: Text(
                              t['favorisBtn']!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: _toggleAllFavorites,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: ModernTheme.textLight,
                            side: BorderSide(color: _themeColor.withOpacity(0.6), width: 1.5),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: ModernTheme.surfaceCard,
                          ),
                          icon: Icon(
                            allAreFavs ? Icons.heart_broken_rounded : Icons.playlist_add_check_rounded,
                            color: ModernTheme.secondaryAccent,
                            size: 20,
                          ),
                          label: Text(
                            allAreFavs ? (t['removeAllFavs'] ?? 'Tout retirer') : (t['selectAllFavs'] ?? 'Tout ajouter'),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildSectionHeader(Icons.castle_rounded, t['sectionChateaux']!),
                    const SizedBox(height: 16),
                    _buildChateauxByTypeSectionsVertical(t),
                    const SizedBox(height: 32),
                    _buildSectionHeader(Icons.landscape_rounded, t['sectionPaysages']!),
                    const SizedBox(height: 16),
                    _buildPaysagesByTypeSectionsHorizontal(t),
                  ] else if (_currentIndex == 0) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: ModernTheme.surfaceCard,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ModernTheme.borderLight, width: 1.5),
                      ),
                      child: Text(
                        t['chateauxIntro']!,
                        style: const TextStyle(
                          color: ModernTheme.textMuted,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                    _buildSectionHeader(Icons.castle_rounded, t['sectionChateaux']!),
                    const SizedBox(height: 16),
                    _buildChateauxByTypeSectionsVertical(t),
                  ] else if (_currentIndex == 2) ...[
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: ModernTheme.surfaceCard,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: ModernTheme.borderLight, width: 1.5),
                      ),
                      child: Text(
                        t['paysagesIntro']!,
                        style: const TextStyle(
                          color: ModernTheme.textMuted,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ),
                    _buildSectionHeader(Icons.landscape_rounded, t['sectionPaysages']!),
                    const SizedBox(height: 16),
                    _buildPaysagesByTypeSectionsHorizontal(t),
                  ],
                ],
              ),
            ),
          ),

          // ==========================================
          // BARRE DE NAVIGATION FLOTTANTE / FLOATING BOTTOM NAVIGATION BAR / شريط التنقل السفلي العائم
          // ==========================================
          bottomNavigationBar: SafeArea(
            child: Container(
              height: 72,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: ModernTheme.surfaceCard.withOpacity(0.95),
                borderRadius: BorderRadius.circular(36),
                border: Border.all(color: ModernTheme.borderLight, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.45),
                    blurRadius: 25,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTravelNavItem(
                    index: 0,
                    icon: Icons.fort_rounded,
                    label: t['chateaux']!,
                  ),
                  _buildTravelCenterNavItem(
                    index: 1,
                    icon: Icons.explore_rounded,
                    label: t['home']!,
                  ),
                  _buildTravelNavItem(
                    index: 2,
                    icon: Icons.terrain_rounded,
                    label: t['paysages']!,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTravelNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _tabHistory.add(index);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 12 : 8,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? _themeColor.withOpacity(0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: isSelected ? Border.all(color: _themeColor.withOpacity(0.5), width: 1) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? _themeColor : ModernTheme.textMuted,
              size: 20,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: ModernTheme.textLight,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTravelCenterNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _tabHistory.add(index);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
            colors: [_themeColor, ModernTheme.secondaryAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: isSelected ? null : ModernTheme.surface,
          shape: BoxShape.circle,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: _themeColor.withOpacity(0.5),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: isSelected ? 2 * 3.141592653589793 : 0),
          duration: const Duration(milliseconds: 600),
          builder: (context, angle, child) {
            return Transform.rotate(
              angle: angle,
              child: child,
            );
          },
          child: Icon(
            icon,
            color: isSelected ? Colors.white : ModernTheme.textMuted,
            size: 24,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: _themeColor, size: 20),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: ModernTheme.textLight,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCardItemVertical({
    required String itemKey,
    required String title,
    required String desc,
    required String imagepath,
    required Map<String, String> t,
    VoidCallback? onTap,
  }) {
    final isFav = _favoriteKeys.contains(itemKey);
    final isRtl = _currentLang == 'ar';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 250,
        margin: const EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
          color: ModernTheme.surfaceCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isFav ? _themeColor.withOpacity(0.6) : ModernTheme.borderLight,
            width: isFav ? 2.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagepath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: ModernTheme.surface,
                    child: const Center(
                      child: Icon(Icons.image_not_supported_rounded, color: ModernTheme.textMuted, size: 40),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.9),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 14,
                right: isRtl ? null : 14,
                left: isRtl ? 14 : null,
                child: GestureDetector(
                  onTap: () => _toggleFavorite(itemKey),
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: ModernTheme.surfaceCard.withOpacity(0.85),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isFav ? ModernTheme.secondaryAccent : ModernTheme.borderLight,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: isFav ? ModernTheme.secondaryAccent : ModernTheme.textLight,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: ModernTheme.textLight,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      desc,
                      style: const TextStyle(
                        color: ModernTheme.textMuted,
                        fontSize: 12.5,
                        height: 1.35,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [_themeColor, _themeColor.withOpacity(0.8)],
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: _themeColor.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                t['discover'] ?? 'Découvrir',
                                style: const TextStyle(
                                  color: ModernTheme.textLight,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: ModernTheme.textLight,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardItemHorizontal({
    required String itemKey,
    required String title,
    required String desc,
    required String imagepath,
    required Map<String, String> t,
    VoidCallback? onTap,
  }) {
    final isFav = _favoriteKeys.contains(itemKey);
    final isRtl = _currentLang == 'ar';
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 250,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: ModernTheme.surfaceCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isFav ? _themeColor.withOpacity(0.6) : ModernTheme.borderLight,
            width: isFav ? 2.0 : 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.45),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  imagepath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: ModernTheme.surface,
                    child: const Center(
                      child: Icon(Icons.image_not_supported_rounded, color: ModernTheme.textMuted, size: 40),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.5),
                        Colors.black.withOpacity(0.9),
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 14,
                right: isRtl ? null : 14,
                left: isRtl ? 14 : null,
                child: GestureDetector(
                  onTap: () => _toggleFavorite(itemKey),
                  child: Container(
                    padding: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: ModernTheme.surfaceCard.withOpacity(0.85),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isFav ? ModernTheme.secondaryAccent : ModernTheme.borderLight,
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: isFav ? ModernTheme.secondaryAccent : ModernTheme.textLight,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: ModernTheme.textLight,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      desc,
                      style: const TextStyle(
                        color: ModernTheme.textMuted,
                        fontSize: 12.5,
                        height: 1.35,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [_themeColor, _themeColor.withOpacity(0.8)],
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: _themeColor.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                t['discover'] ?? 'Découvrir',
                                style: const TextStyle(
                                  color: ModernTheme.textLight,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: ModernTheme.textLight,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChateauxByTypeSectionsVertical(Map<String, String> t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _chateauxCategories.map((category) {
        final categoryName = t[category['categoryKey']]!;
        final chateauxList = category['items'] as List<Map<String, String>>;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                categoryName,
                style: TextStyle(
                  color: _themeColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...chateauxList.map((item) {
              return _buildCardItemVertical(
                itemKey: item['key']!,
                title: item['name']!,
                desc: item['desc']!,
                imagepath: item['imagepath']!,
                t: t,
                onTap: () => _navigateToPage(item['key']!),
              );
            }),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildPaysagesByTypeSectionsHorizontal(Map<String, String> t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _paysagesCategories.map((category) {
        final typeName = t[category['categoryKey']]!;
        final paysagesList = category['items'] as List<Map<String, String>>;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                typeName,
                style: TextStyle(
                  color: _themeColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: paysagesList.length,
                itemBuilder: (context, index) {
                  final item = paysagesList[index];
                  return _buildCardItemHorizontal(
                    itemKey: item['key']!,
                    title: item['name']!,
                    desc: item['desc']!,
                    imagepath: item['imagepath']!,
                    t: t,
                    onTap: () => _navigateToPage(item['key']!),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }
}