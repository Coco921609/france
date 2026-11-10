import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'accueil.dart' show ModernTheme, LuxBackdrop, LuxGlass, LuxPress, LuxCategory, luxClean, luxDisplay, luxGradient, luxPlaces;

import 'chateaux/chateau_de_verseilles.dart';
import 'chateaux/chateau_de_chambord.dart';

import 'paysages/canyons/sentier_des_ocres.dart' as sentier_des_ocres;
import 'paysages/canyons/orgues_d_ille.dart' as orgues_d_ille;
import 'paysages/canyons/rougier_de_camares.dart' as rougier_de_camares;
import 'paysages/canyons/altschlossfelsen.dart' as altschlossfelsen;
import 'paysages/canyons/dune_du_pilat.dart' as dune_du_pilat;

import 'paysages/eaux/gorges_du_verdon.dart' as gorges_du_verdon;
import 'paysages/eaux/ile_de_la_vierge.dart' as ile_de_la_vierge;
import 'paysages/eaux/gorges_du_fier.dart' as gorges_du_fier;
import 'paysages/eaux/cascades_des_tufs.dart' as cascades_des_tufs;
import 'paysages/eaux/meandre_de_queuille.dart' as meandre_de_queuille;
import 'paysages/eaux/lac_de_lorceyrette.dart' as lac_de_lorceyrette;
import 'paysages/eaux/lac_d_allos.dart' as lac_d_allos;
import 'paysages/eaux/plateau_des_1000_etangs.dart' as plateau_des_1000_etangs;

import 'paysages/parcs/buttes_chaumont.dart' as buttes_chaumont;
import 'paysages/parcs/palais_ideal.dart' as palais_ideal;
import 'paysages/parcs/parc_monceau.dart' as parc_monceau;
import 'paysages/parcs/foret_fontainebleau.dart' as foret_fontainebleau;
import 'paysages/parcs/chemin_des_cimes.dart' as chemin_des_cimes;
import 'paysages/parcs/mont_saint_michel.dart' as mont_saint_michel;
import 'paysages/parcs/foret_de_broceliande.dart' as foret_de_broceliande;
import 'paysages/parcs/gouffre_de_padirac.dart' as gouffre_de_padirac;

import 'paysages/panoramas/puy_de_dome.dart' as puy_de_dome;
import 'paysages/panoramas/pont_du_gard.dart' as pont_du_gard;
import 'paysages/panoramas/marais_d_aigues_mortes.dart' as marais_d_aigues_mortes;
import 'paysages/panoramas/etretat.dart' as etretat;

import 'paysages/calanques/calanque_de_sugiton.dart' as sugiton;
import 'paysages/calanques/calanques_de_cassis.dart' as cassis;
import 'paysages/calanques/calanques_de_piana.dart' as piana;

class FavorisPage extends StatefulWidget {
  final String languageCode;
  final Color themeColor;

  const FavorisPage({
    super.key,
    this.languageCode = 'fr',
    this.themeColor = const Color(0xFF8B5CF6),
  });

  @override
  State<FavorisPage> createState() => _FavorisPageState();
}

class _FavorisPageState extends State<FavorisPage> {
  List<String> _favoriteKeys = [];
  bool _isLoading = true;

  final List<Map<String, dynamic>> _masterCatalog = [
    {
      'key': 'chateau_de_verseilles',
      'categoryKey': 'catChateauxHeritage',
      'image': 'assets/chateaux/versailles/1.jpg',
      'title': {'fr': '🏰 Château de Versailles', 'en': '🏰 Palace of Versailles', 'ar': '🏰 قصر فرساي'},
      'subtitle': {'fr': 'Île-de-France', 'en': 'Île-de-France', 'ar': 'إيل دي فرانس'},
    },
    {
      'key': 'chateau_de_chambord',
      'categoryKey': 'catChateauxHeritage',
      'image': 'assets/chateaux/cham/2.jpg',
      'title': {'fr': '🏰 Château de Chambord', 'en': '🏰 Chambord Castle', 'ar': '🏰 قلعة شامبور'},
      'subtitle': {'fr': 'Centre-Val de Loire', 'en': 'Centre-Val de Loire', 'ar': 'سانتر-فال دو لوار'},
    },
    {
      'key': 'sentier_des_ocres',
      'categoryKey': 'catCanyons',
      'image': 'assets/images/20190528-165859-largejpg.jpg',
      'title': {'fr': '🏜️ Sentier des ocres', 'en': '🏜️ Ochre Trail', 'ar': '🏜️ مسار الأوكر'},
      'subtitle': {'fr': 'Roussillon, Provence', 'en': 'Roussillon, Provence', 'ar': 'روسيون، بروفانس'},
    },
    {
      'key': 'orgues_d_ille',
      'categoryKey': 'catCanyons',
      'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
      'title': {'fr': '⛰️ Les orgues d’Ille', 'en': '⛰️ Orgues d’Ille', 'ar': '⛰️ أورغ إيل'},
      'subtitle': {'fr': 'Pyrénées-Orientales', 'en': 'Pyrénées-Orientales', 'ar': 'بايرنيس أوريينتالس'},
    },
    {
      'key': 'rougier_de_camares',
      'categoryKey': 'catCanyons',
      'image': 'assets/images/45.jpg',
      'title': {'fr': '🤠 Rougier de Camarès', 'en': '🤠 Rougier de Camarès', 'ar': '🤠 روجيه دي كاماريس'},
      'subtitle': {'fr': 'Aveyron', 'en': 'Aveyron', 'ar': 'أافيرون'},
    },
    {
      'key': 'altschlossfelsen',
      'categoryKey': 'catCanyons',
      'image': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg',
      'title': {'fr': '🧗 Altschlossfelsen', 'en': '🧗 Altschlossfelsen', 'ar': '🧗 ألتشلوسفيلسن'},
      'subtitle': {'fr': 'Moselle', 'en': 'Moselle', 'ar': 'موزيل'},
    },
    {
      'key': 'dune_du_pilat',
      'categoryKey': 'catCanyons',
      'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg',
      'title': {'fr': '🐪 La dune du Pilat', 'en': '🐪 Dune of Pilat', 'ar': '🐪 كثبان بيلا'},
      'subtitle': {'fr': 'Bassin d\'Arcachon', 'en': 'Arcachon Bay', 'ar': 'خليج أركاشون'},
    },
    {
      'key': 'gorges_du_verdon',
      'categoryKey': 'catGorges',
      'image': 'assets/images/VERDON.jpg',
      'title': {'fr': '🛶 Gorges du Verdon', 'en': '🛶 Verdon Gorges', 'ar': '🛶 مضيق فيردون'},
      'subtitle': {'fr': 'Provence-Alpes-Côte d\'Azur', 'en': 'French Riviera', 'ar': 'بروفانس ألب كوت دازور'},
    },
    {
      'key': 'ile_de_la_vierge',
      'categoryKey': 'catGorges',
      'image': 'assets/images/crique-ile-vierge-crozon.jpg',
      'title': {'fr': '🏝️ Île de la Vierge', 'en': '🏝️ Virgin Island', 'ar': '🏝️ جزيرة العذراء'},
      'subtitle': {'fr': 'Crozon, Bretagne', 'en': 'Crozon, Brittany', 'ar': 'كروئون، بريتاني'},
    },
    {
      'key': 'gorges_du_fier',
      'categoryKey': 'catGorges',
      'image': 'assets/images/gorges-du-fier-annecy-15.jpg',
      'title': {'fr': '🌉 Gorges du Fier', 'en': '🌉 Fier Gorges', 'ar': '🌉 مضيق فيير'},
      'subtitle': {'fr': 'Haute-Savoie', 'en': 'Haute-Savoie', 'ar': 'هوت سافوا'},
    },
    {
      'key': 'cascades_des_tufs',
      'categoryKey': 'catGorges',
      'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg',
      'title': {'fr': '💧 Cascades des Tufs', 'en': '💧 Tufs Waterfalls', 'ar': '💧 شلالات توف'},
      'subtitle': {'fr': 'Jura', 'en': 'Jura', 'ar': 'جورا'},
    },
    {
      'key': 'meandre_de_queuille',
      'categoryKey': 'catGorges',
      'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg',
      'title': {'fr': '🌿 Méandre de Queuille', 'en': '🌿 Queuille Meander', 'ar': '🌿 منعطف كويي'},
      'subtitle': {'fr': 'Auvergne', 'en': 'Auvergne', 'ar': 'أوفيرني'},
    },
    {
      'key': 'lac_de_lorceyrette',
      'categoryKey': 'catGorges',
      'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg',
      'title': {'fr': '🇨🇦 Lac de l’Orceyrette', 'en': '🇨🇦 Lake Lorceyrette', 'ar': '🇨🇦 بحيرة لورسيريت'},
      'subtitle': {'fr': 'Hautes-Alpes', 'en': 'Hautes-Alpes', 'ar': 'هوت ألب'},
    },
    {
      'key': 'lac_d_allos',
      'categoryKey': 'catGorges',
      'image': 'assets/images/19.jpg',
      'title': {'fr': '🇳🇴 Lac d’Allos', 'en': '🇳🇴 Lake Allos', 'ar': '🇳🇴 بحيرة ألوس'},
      'subtitle': {'fr': 'Mercantour', 'en': 'Mercantour', 'ar': 'ميركانتور'},
    },
    {
      'key': 'plateau_des_1000_etangs',
      'categoryKey': 'catGorges',
      'image': 'assets/image/4.jpg',
      'title': {'fr': '🇫🇮 Plateau des 1000 Étangs', 'en': '🇫🇮 Plateau of 1000 Ponds', 'ar': '🇫🇮 هضبة ألف بركة'},
      'subtitle': {'fr': 'Haute-Saône', 'en': 'Haute-Saône', 'ar': 'هوت سون'},
    },
    {
      'key': 'buttes_chaumont',
      'categoryKey': 'catParks',
      'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
      'title': {'fr': '🌳 Parc Buttes-Chaumont', 'en': '🌳 Buttes-Chaumont Park', 'ar': '🌳 حديقة بوت شومون'},
      'subtitle': {'fr': 'Paris', 'en': 'Paris', 'ar': 'باريس'},
    },
    {
      'key': 'palais_ideal',
      'categoryKey': 'catParks',
      'image': 'assets/images/facteur-cheval.jpg',
      'title': {'fr': '🏯 Palais Idéal du Facteur Cheval', 'en': '🏯 Ideal Palace', 'ar': '🏯 القصر المثالي'},
      'subtitle': {'fr': 'Drôme', 'en': 'Drôme', 'ar': 'دروم'},
    },
    {
      'key': 'parc_monceau',
      'categoryKey': 'catParks',
      'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg',
      'title': {'fr': '⛲ Parc Monceau', 'en': '⛲ Monceau Park', 'ar': '⛲ حديقة مونصو'},
      'subtitle': {'fr': 'Paris', 'en': 'Paris', 'ar': 'باريس'},
    },
    {
      'key': 'foret_fontainebleau',
      'categoryKey': 'catParks',
      'image': 'assets/images/foret-de-fontainebleau.jpg',
      'title': {'fr': '🌲 Forêt de Fontainebleau', 'en': '🌲 Fontainebleau Forest', 'ar': '🌲 غابة فونتينبلو'},
      'subtitle': {'fr': 'Seine-et-Marne', 'en': 'Seine-et-Marne', 'ar': 'سين ومارن'},
    },
    {
      'key': 'chemin_des_cimes',
      'categoryKey': 'catParks',
      'image': 'assets/images/88.jpg',
      'title': {'fr': '🌳 Chemin des Cimes', 'en': '🌳 Treetop Walk', 'ar': '🌳 مسار القمم'},
      'subtitle': {'fr': 'Alsace', 'en': 'Alsace', 'ar': 'ألزاس'},
    },
    {
      'key': 'mont_saint_michel',
      'categoryKey': 'catParks',
      'image': 'assets/image/24.webp',
      'title': {'fr': '🏰 Mont Saint-Michel', 'en': '🏰 Mont Saint-Michel', 'ar': '🏰 مون سان ميشل'},
      'subtitle': {'fr': 'Normandie', 'en': 'Normandy', 'ar': 'نورماندي'},
    },
    {
      'key': 'foret_de_broceliande',
      'categoryKey': 'catParks',
      'image': 'assets/image/51.jpg',
      'title': {'fr': '🧙‍♂️ Forêt de Brocéliande', 'en': '🧙‍♂️ Brocéliande Forest', 'ar': '🧙‍♂️ غابة بروسيلياند'},
      'subtitle': {'fr': 'Bretagne', 'en': 'Brittany', 'ar': 'بريتاني'},
    },
    {
      'key': 'gouffre_de_padirac',
      'categoryKey': 'catParks',
      'image': 'assets/image/58.jpg',
      'title': {'fr': '🕳️ Gouffre de Padirac', 'en': '🕳️ Padirac Cave', 'ar': '🕳️ كهف باديراك'},
      'subtitle': {'fr': 'Lot', 'en': 'Lot', 'ar': 'لوت'},
    },
    {
      'key': 'puy_de_dome',
      'categoryKey': 'catPanoramas',
      'image': 'assets/images/dome.webp',
      'title': {'fr': '🌋 Puy de Dôme', 'en': '🌋 Puy de Dôme', 'ar': '🌋 بوي دي دوم'},
      'subtitle': {'fr': 'Massif Central', 'en': 'Massif Central', 'ar': 'ماسيف سنترال'},
    },
    {
      'key': 'pont_du_gard',
      'categoryKey': 'catPanoramas',
      'image': 'assets/images/pont.webp',
      'title': {'fr': '🏛️ Pont du Gard', 'en': '🏛️ Pont du Gard', 'ar': '🏛️ بونت du غار'},
      'subtitle': {'fr': 'Gard, Occitanie', 'en': 'Gard, Occitanie', 'ar': 'غار، أوكسيتاني'},
    },
    {
      'key': 'marais_d_aigues_mortes',
      'categoryKey': 'catPanoramas',
      'image': 'assets/images/5.jpg',
      'title': {'fr': '🧂 Marais d’Aigues-Mortes', 'en': '🧂 Aigues-Mortes Salt Marshes', 'ar': '🧂 ملاحات إيغ مورت'},
      'subtitle': {'fr': 'Camargue', 'en': 'Camargue', 'ar': 'كامارغ'},
    },
    {
      'key': 'etretat',
      'categoryKey': 'catPanoramas',
      'image': 'assets/imag/33.webp',
      'title': {'fr': '🌊 Étretat', 'en': '🌊 Étretat Cliffs', 'ar': '🌊 إتريتا'},
      'subtitle': {'fr': 'Normandie', 'en': 'Normandy', 'ar': 'نورماندي'},
    },
    {
      'key': 'calanque_de_sugiton',
      'categoryKey': 'catCalanques',
      'image': 'assets/images/sugiton.jpg',
      'title': {'fr': '🌊 Calanque de Sugiton', 'en': '🌊 Sugiton Cove', 'ar': '🌊 خليج سوغيتون'},
      'subtitle': {'fr': 'Marseille', 'en': 'Marseille', 'ar': 'مارسيليا'},
    },
    {
      'key': 'calanques_de_cassis',
      'categoryKey': 'catCalanques',
      'image': 'assets/image/33.webp',
      'title': {'fr': '🚤 Calanques de Cassis', 'en': '🚤 Cassis Coves', 'ar': '🚤 خلجان كاسييس'},
      'subtitle': {'fr': 'Cassis', 'en': 'Cassis', 'ar': 'كاسيس'},
    },
    {
      'key': 'calanques_de_piana',
      'categoryKey': 'catCalanques',
      'image': 'assets/image/41.webp',
      'title': {'fr': '🌋 Calanques de Piana', 'en': '🌋 Piana Coves', 'ar': '🌋 خلجان بيانا'},
      'subtitle': {'fr': 'Corse', 'en': 'Corsica', 'ar': 'كورسيكا'},
    },
  ];

  final Map<String, Map<String, String>> _categoryNames = {
    'catChateauxHeritage': {'fr': '🏰 Châteaux & Patrimoine', 'en': '🏰 Castles & Heritage', 'ar': '🏰 القلاع والتراث'},
    'catCanyons': {'fr': '🏜️ Canyons & Déserts', 'en': '🏜️ Canyons & Deserts', 'ar': '🏜️ الأخدود والصحاري'},
    'catGorges': {'fr': '🛶 Gorges & Eaux Turquoises', 'en': '🛶 Gorges & Turquoise Waters', 'ar': '🛶 المضايق والمياه الفيروزية'},
    'catParks': {'fr': '🏛️ Parcs & Monuments Insolites', 'en': '🏛️ Unusual Parks', 'ar': '🏛️ الحدائق والآثار'},
    'catPanoramas': {'fr': '🌋 Panoramas Uniques', 'en': '🌋 Unique Panoramas', 'ar': '🌋 المناظر الطبيعية الفريدة'},
    'catCalanques': {'fr': '🌊 Les Calanques', 'en': '🌊 The Coves', 'ar': '🌊 خلجان فرنسا'},
  };

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteKeys = prefs.getStringList('user_favorites') ?? [];
      _isLoading = false;
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

  Future<void> _clearAllFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteKeys.clear();
    });
    await prefs.setStringList('user_favorites', _favoriteKeys);
  }

  Future<void> _navigateToPage(String key) async {
    Widget page;
    switch (key) {
      case 'chateau_de_verseilles':
        page = ChateauDeVersaillesPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'chateau_de_chambord':
        page = ChateauDeChambordPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'calanque_de_sugiton':
        page = sugiton.CalanqueDeSugitonPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'calanques_de_cassis':
        page = cassis.CalanquesDeCassisPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'calanques_de_piana':
        page = piana.CalanquesDePianaPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'altschlossfelsen':
        page = altschlossfelsen.AltschlossfelsenPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'orgues_d_ille':
        page = orgues_d_ille.OrguesIlleSurTetPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'dune_du_pilat':
        page = dune_du_pilat.DuneDuPilatPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'rougier_de_camares':
        page = rougier_de_camares.RougierCamaresPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'buttes_chaumont':
        page = buttes_chaumont.ButtesChaumontPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'palais_ideal':
        page = palais_ideal.PalaisIdealPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'foret_fontainebleau':
        page = foret_fontainebleau.ForetFontainebleauPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'chemin_des_cimes':
        page = chemin_des_cimes.CheminCimesAlsacePage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'foret_de_broceliande':
        page = foret_de_broceliande.ForetDeBroceliandePage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'parc_monceau':
        page = parc_monceau.ParcMonceauPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'gouffre_de_padirac':
        page = gouffre_de_padirac.LeGouffreDePadiracPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'mont_saint_michel':
        page = mont_saint_michel.MontSaintMichelPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'gorges_du_verdon':
        page = gorges_du_verdon.GorgesDuVerdonPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'ile_de_la_vierge':
        page = ile_de_la_vierge.IleDeLaViergePage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'gorges_du_fier':
        page = gorges_du_fier.GorgesDuFierPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'cascades_des_tufs':
        page = cascades_des_tufs.CascadesDesTufsPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'meandre_de_queuille':
        page = meandre_de_queuille.MeandreQueuillePage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'lac_de_lorceyrette':
        page = lac_de_lorceyrette.LacOrceyrettePage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'lac_d_allos':
        page = lac_d_allos.LacDAllosPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'plateau_des_1000_etangs':
        page = plateau_des_1000_etangs.PlateauMilleEtangsPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'puy_de_dome':
        page = puy_de_dome.PuyDeDomePage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'pont_du_gard':
        page = pont_du_gard.PontDuGardPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'marais_d_aigues_mortes':
        page = marais_d_aigues_mortes.MaraisSalantsAiguesMortesPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'etretat':
        page = etretat.EtretatPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      case 'sentier_des_ocres':
        page = sentier_des_ocres.SentierDesOcresPage(languageCode: widget.languageCode, themeColor: widget.themeColor);
        break;
      default:
        return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
    await _loadFavorites();
  }

  // ==========================================================================
  //  TEXTES
  // ==========================================================================
  String _tr(String fr, String en, String ar) {
    if (widget.languageCode == 'ar') return ar;
    if (widget.languageCode == 'en') return en;
    return fr;
  }

  // ==========================================================================
  //  ACTIONS (avec possibilité d'annuler)
  // ==========================================================================
  void _showUndoBar(String message, VoidCallback onUndo) {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ModernTheme.surfaceCard,
        elevation: 0,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.white.withOpacity(0.12)),
        ),
        content: Text(
          message,
          style: const TextStyle(
            color: ModernTheme.textLight,
            fontWeight: FontWeight.w600,
          ),
        ),
        action: SnackBarAction(
          label: _tr('Annuler', 'Undo', 'تراجع'),
          textColor: widget.themeColor,
          onPressed: onUndo,
        ),
      ),
    );
  }

  Future<void> _removeFavorite(String key) async {
    HapticFeedback.selectionClick();
    await _toggleFavorite(key);
    if (!mounted) return;
    _showUndoBar(
      _tr('Retiré des favoris', 'Removed from favorites', 'تمت الإزالة من المفضلة'),
          () => _toggleFavorite(key),
    );
  }

  Future<void> _clearWithUndo() async {
    HapticFeedback.mediumImpact();
    final List<String> previous = List<String>.from(_favoriteKeys);
    await _clearAllFavorites();
    if (!mounted) return;
    _showUndoBar(
      _tr('Tous les favoris retirés', 'All favorites removed', 'تمت إزالة كل المفضلة'),
          () async {
        final prefs = await SharedPreferences.getInstance();
        if (!mounted) return;
        setState(() => _favoriteKeys = previous);
        await prefs.setStringList('user_favorites', _favoriteKeys);
      },
    );
  }

  // ==========================================================================
  //  PETITS COMPOSANTS
  // ==========================================================================
  Widget _image(String path, double size) {
    final Widget fallback = Container(
      width: size,
      height: size,
      color: ModernTheme.surfaceCard,
      child: const Icon(
        Icons.image_not_supported_rounded,
        color: ModernTheme.textMuted,
        size: 22,
      ),
    );
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        width: size,
        height: size,
        fit: BoxFit.cover,
        cacheWidth: (size * 3).round(),
        errorBuilder: (context, error, stackTrace) => fallback,
      );
    }
    return Image.network(
      path,
      width: size,
      height: size,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => fallback,
    );
  }

  Widget _roundButton({required IconData icon, required VoidCallback? onTap}) {
    final bool enabled = onTap != null;
    return LuxPress(
      onTap: onTap,
      child: LuxGlass(
        radius: 22,
        width: 44,
        height: 44,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: 20,
          textDirection: TextDirection.ltr,
          color: enabled ? ModernTheme.textLight : Colors.white.withOpacity(0.25),
        ),
      ),
    );
  }

  Widget _buildSummary(List<Map<String, dynamic>> all, int total, bool isRtl) {
    final List<Map<String, dynamic>> shown = all.take(4).toList();
    const double d = 54;
    const double step = 32;

    return LuxGlass(
      radius: 30,
      padding: const EdgeInsets.all(16),
      borderOpacity: 0.16,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          widget.themeColor.withOpacity(0.28),
          widget.themeColor.withOpacity(0.07),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: d + (shown.length - 1) * step,
            height: d,
            child: Stack(
              children: [
                for (int i = 0; i < shown.length; i++)
                  PositionedDirectional(
                    start: i * step,
                    child: Container(
                      width: d,
                      height: d,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ModernTheme.background, width: 3),
                      ),
                      child: ClipOval(child: _image(shown[i]['image'].toString(), d - 6)),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  luxPlaces(total, widget.languageCode),
                  style: luxDisplay(24, rtl: isRtl, letterSpacing: -0.4),
                ),
                const SizedBox(height: 4),
                Text(
                  _tr(
                    'enregistrés dans vos favoris',
                    'saved to your favorites',
                    'محفوظة في مفضلتك',
                  ),
                  style: const TextStyle(
                    color: ModernTheme.textMuted,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String catKey, int count) {
    final Color c = LuxCategory.color(catKey);
    final Map<String, String> names = _categoryNames[catKey] ?? {};
    final String label = luxClean(names[widget.languageCode] ?? names['fr'] ?? catKey);

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: c.withOpacity(0.15),
            border: Border.all(color: c.withOpacity(0.4), width: 1),
          ),
          child: Icon(LuxCategory.icon(catKey), color: c, size: 21),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: ModernTheme.textLight,
              fontSize: 16.5,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.2,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          luxPlaces(count, widget.languageCode),
          style: const TextStyle(
            color: ModernTheme.textMuted,
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildFavCard(Map<String, dynamic> item, String catKey, bool isRtl) {
    final Map<String, String> titleMap = item['title'] as Map<String, String>;
    final Map<String, String> subtitleMap = item['subtitle'] as Map<String, String>;
    final String title = luxClean(titleMap[widget.languageCode] ?? titleMap['fr']!);
    final String subtitle = subtitleMap[widget.languageCode] ?? subtitleMap['fr']!;
    final String key = item['key'] as String;
    final Color catColor = LuxCategory.color(catKey);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: LuxPress(
        onTap: () => _navigateToPage(key),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.09),
                Colors.white.withOpacity(0.03),
              ],
            ),
            border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: _image(item['image'].toString(), 92),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: luxDisplay(
                        18,
                        rtl: isRtl,
                        height: 1.15,
                        letterSpacing: -0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.place_rounded, size: 15, color: catColor),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            subtitle,
                            style: const TextStyle(
                              color: ModernTheme.textMuted,
                              fontSize: 12.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _removeFavorite(key),
                child: Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ModernTheme.secondaryAccent,
                    boxShadow: [
                      BoxShadow(
                        color: ModernTheme.secondaryAccent.withOpacity(0.45),
                        blurRadius: 14,
                      ),
                    ],
                  ),
                  child: const Icon(Icons.favorite_rounded, color: Colors.white, size: 22),
                ),
              ),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmpty(bool isRtl, String emptyText) {
    return Padding(
      padding: const EdgeInsets.only(top: 56),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    widget.themeColor.withOpacity(0.30),
                    widget.themeColor.withOpacity(0.0),
                  ],
                ),
              ),
              child: const Center(
                child: LuxGlass(
                  radius: 40,
                  width: 82,
                  height: 82,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite_border_rounded,
                    size: 38,
                    color: ModernTheme.secondaryAccent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Text(
              emptyText,
              textAlign: TextAlign.center,
              style: luxDisplay(24, rtl: isRtl, height: 1.15, letterSpacing: -0.4),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                _tr(
                  'Touchez le cœur d’un lieu pour le retrouver ici.',
                  'Tap the heart on a place to find it here.',
                  'اضغط على القلب في أي مكان لتجده هنا.',
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ModernTheme.textMuted,
                  fontSize: 14,
                  height: 1.55,
                ),
              ),
            ),
            const SizedBox(height: 28),
            LuxPress(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: luxGradient(widget.themeColor),
                  boxShadow: [
                    BoxShadow(
                      color: widget.themeColor.withOpacity(0.45),
                      blurRadius: 22,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.explore_rounded, color: Colors.white, size: 20),
                    const SizedBox(width: 9),
                    Text(
                      _tr('Explorer les lieux', 'Explore places', 'استكشف الأماكن'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================================
  //  BUILD
  // ==========================================================================
  @override
  Widget build(BuildContext context) {
    final bool isRtl = widget.languageCode == 'ar';
    final MediaQueryData mq = MediaQuery.of(context);

    final String titleText = _tr('Mes Favoris', 'Favorites', 'المفضلة');
    final String subtitleText = _tr(
      'Vos lieux enregistrés par catégorie',
      'Your saved places by category',
      'أماكنك المحفوظة حسب الفئات',
    );
    final String emptyText = _tr(
      'Aucun favori ajouté pour le moment',
      'No favorites added yet',
      'لا توجد أماكن مفضلة حالياً',
    );
    final String clearText = _tr('Retirer tout', 'Clear all', 'إزالة الكل');

    final Map<String, List<Map<String, dynamic>>> groupedFavorites = {};
    for (var item in _masterCatalog) {
      if (_favoriteKeys.contains(item['key'])) {
        final catKey = item['categoryKey'] as String;
        groupedFavorites.putIfAbsent(catKey, () => []);
        groupedFavorites[catKey]!.add(item);
      }
    }

    int total = 0;
    final List<Map<String, dynamic>> flat = [];
    groupedFavorites.forEach((k, v) {
      total += v.length;
      flat.addAll(v);
    });

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: ModernTheme.background,
        body: LuxBackdrop(
          color: widget.themeColor,
          child: _isLoading
              ? Center(child: CircularProgressIndicator(color: widget.themeColor))
              : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(20, mq.padding.top + 12, 20, mq.padding.bottom + 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _roundButton(
                      icon: isRtl
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.arrow_back_ios_new_rounded,
                      onTap: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Tooltip(
                      message: clearText,
                      child: _roundButton(
                        icon: Icons.delete_sweep_rounded,
                        onTap: total == 0 ? null : _clearWithUndo,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        titleText,
                        style: luxDisplay(50, rtl: isRtl, height: 1.0, letterSpacing: -1.8),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Icon(
                        Icons.favorite_rounded,
                        color: ModernTheme.secondaryAccent,
                        size: 30,
                        shadows: [
                          Shadow(
                            color: ModernTheme.secondaryAccent.withOpacity(0.6),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  subtitleText,
                  style: const TextStyle(
                    color: ModernTheme.textMuted,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 26),
                if (groupedFavorites.isEmpty)
                  _buildEmpty(isRtl, emptyText)
                else ...[
                  _buildSummary(flat, total, isRtl),
                  const SizedBox(height: 28),
                  for (final entry in groupedFavorites.entries) ...[
                    _buildSectionTitle(entry.key, entry.value.length),
                    const SizedBox(height: 14),
                    for (final item in entry.value)
                      _buildFavCard(item, entry.key, isRtl),
                    const SizedBox(height: 14),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}