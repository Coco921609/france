import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'questions_data.dart';
import 'jeu_page.dart';

import 'français/sentier_des_ocres.dart';
import 'français/ile_de_la_vierge.dart';
import 'français/altschlossfelsen.dart';
import 'français/lac_de_lorceyrette.dart';
import 'français/parc_monceau.dart';
import 'français/gorges_du_fier.dart';
import 'français/palais_ideal.dart';
import 'français/foret_fontainebleau.dart';
import 'français/buttes_chaumont.dart';
import 'français/les_orgues_d_ille_sur_tet.dart';
import 'français/les_cascades_des_tufs.dart';
import 'français/le_desert_du_rougier_de_camar_s.dart';
import 'français/les_gorges_du_verdon.dart';
import 'français/le_meandre_de_queuille.dart';
import 'français/la_dune_du_pilat.dart';
import 'français/puy_de_dome.dart';
import 'français/pont_du_gard.dart';
import 'français/lac_d_allos.dart';
import 'français/marais_salants_aigues_mortes.dart';
import 'français/alsace.dart';
import 'français/calanque_de_sugiton.dart';

// Helper pour supprimer les animations
PageRouteBuilder _routeSansAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}

class FranceSecretePage extends StatefulWidget {
  final bool isEnglish;
  final String filtreInitial;

  const FranceSecretePage({Key? key, this.isEnglish = false, this.filtreInitial = 'Tout'}) : super(key: key);

  @override
  State<FranceSecretePage> createState() => _FranceSecretePageState();
}

class _FranceSecretePageState extends State<FranceSecretePage> {
  late String _filtreActif;
  bool _filtresOuverts = false;
  Set<String> _favoris = {};
  List<Map<String, dynamic>> _tousLesLieux = [];

  String get _cleStockage => widget.isEnglish ? 'mes_favoris_en' : 'mes_favoris_fr';

  @override
  void initState() {
    super.initState();
    _filtreActif = widget.filtreInitial;
    _chargerFavoris();
    for (var theme in themes) {
      for (var lieu in theme['lieux']) {
        _tousLesLieux.add(lieu);
      }
    }
  }

  Future<void> _chargerFavoris() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoris = prefs.getStringList(_cleStockage)?.toSet() ?? {};
    });
  }

  Future<void> _toggleFavori(String nom) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_favoris.contains(nom)) {
        _favoris.remove(nom);
      } else {
        _favoris.add(nom);
      }
    });
    await prefs.setStringList(_cleStockage, _favoris.toList());
  }

  Future<void> _ouvrirMaps(String nom) async {
    final String query = Uri.encodeComponent(nom);
    final Uri geoUri = Uri.parse('geo:0,0?q=$query');
    if (await canLaunchUrl(geoUri)) {
      await launchUrl(geoUri, mode: LaunchMode.externalApplication);
    } else {
      final Uri webUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');
      await launchUrl(webUri, mode: LaunchMode.externalApplication);
    }
  }

  void _presenterLieu(int index, {required List<Map<String, dynamic>> listeCible}) {
    int nextIndex = (index + 1) % listeCible.length;
    final lieu = listeCible[index];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (context, setModalState) {
            final estFavori = _favoris.contains(lieu['nom']);
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1C20),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: lieu['couleur'].withOpacity(0.5), width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                          child: Image.asset(lieu['image'], height: 200, width: double.infinity, fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 10, right: 10,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(lieu['nom'].toString().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cinzel(color: lieu['couleur'], fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 15),
                          Text("${lieu['desc']} Ce lieu exceptionnel est une véritable merveille cachée du patrimoine français. Prenez le temps d'explorer chaque détail et chaque angle de ce site unique qui offre une expérience immersive inoubliable au cœur de la nature.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 12, height: 1.5)),

                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lieu['couleur'],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                padding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context, _routeSansAnimation(lieu['page']));
                              },
                              child: const Text("Cliquez pour découvrir l'endroit", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _modalAction(estFavori ? Icons.favorite : Icons.favorite_border, "Favoris", () {
                                _toggleFavori(lieu['nom']);
                                setModalState(() {});
                                setState(() {});
                              }, color: estFavori ? Colors.redAccent : Colors.white),
                              _modalAction(Icons.map_outlined, "Maps", () => _ouvrirMaps(lieu['nom'])),
                              _modalAction(Icons.explore_outlined, "Explorer", () {
                                Navigator.pop(context);
                                Navigator.push(context, _routeSansAnimation(lieu['page']));
                              }),
                            ],
                          ),

                          const SizedBox(height: 20),
                          const Divider(color: Colors.white10),

                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              _presenterLieu(nextIndex, listeCible: listeCible);
                            },
                            icon: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white70),
                            label: const Text("LIEU SUIVANT", style: TextStyle(letterSpacing: 1.2, color: Colors.white70)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }

  Widget _modalAction(IconData icon, String label, VoidCallback onTap, {Color color = Colors.white}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }

  void _lancerRoulette() {
    List<Map<String, dynamic>> lieuxDisponibles = [];
    if (_filtreActif == 'Tout' || _filtreActif.contains('Favoris') || _filtreActif.contains('Jeux')) {
      lieuxDisponibles = _tousLesLieux;
    } else if (_filtreActif.contains('Canyons') || _filtreActif.contains('Eaux') || _filtreActif.contains('Monuments') || _filtreActif.contains('Panoramas') || _filtreActif.contains('Calanques')) {
      String tagSimple = _filtreActif.trim().split(' ').last;
      var theme = themes.firstWhere((t) => t['tag'] == tagSimple, orElse: () => {'lieux': _tousLesLieux});
      lieuxDisponibles = List<Map<String, dynamic>>.from(theme['lieux']);
    } else {
      lieuxDisponibles = _tousLesLieux.where((l) => (l['caracteristiques'] as List? ?? []).contains(_filtreActif)).toList();
    }
    if (lieuxDisponibles.isEmpty) lieuxDisponibles = _tousLesLieux;

    void showRandom() {
      var random = lieuxDisponibles[Random().nextInt(lieuxDisponibles.length)];
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF1A1C20),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Destination Mystère ✨", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.close, color: Colors.white54, size: 22), onPressed: () => Navigator.pop(context)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("L'itinéraire s'adapte ! On vous emmène à :", style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 10),
              Text(random['nom'], style: GoogleFonts.cinzel(fontSize: 18, color: random['couleur'], fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(onPressed: () { Navigator.pop(context); showRandom(); }, child: const Text("Autre endroit")),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: random['couleur']), onPressed: () { Navigator.pop(context); Navigator.push(context, _routeSansAnimation(random['page'])); }, child: const Text("Y aller", style: TextStyle(color: Colors.white)))
          ],
        ),
      );
    }
    showRandom();
  }

  final List<Map<String, dynamic>> themes = [
    {
      'titre': '🏜️ Air De Canyons & Déserts',
      'tag': 'Canyons',
      'lieux': [
        {'nom': 'Sentier des ocres 🏜️', 'image': 'assets/images/20190528-165859-largejpg.jpg', 'desc': 'Un air de Colorado (USA) situé en Provence.', 'couleur': const Color(0xFFE2725B), 'page': const SentierDesOcresPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🌅 Lever du soleil', '📸 Spots Instagram', '🔭 Vue panoramique']},
        {'nom': "Les orgues d'Ille ⛰️", 'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg', 'desc': 'Un air de Cappadoce (Turquie) en Pyrénées-Orientales.', 'couleur': const Color(0xFFD35400), 'page': const OrguesIlleSurTetPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🌇 Coucher du soleil', '📸 Spots Instagram']},
        {'nom': 'Rougier de Camarès 🤠', 'image': 'assets/images/45.jpg', 'desc': 'Le Far West américain en plein Aveyron.', 'couleur': const Color(0xFFB03A2E), 'page': const RougierCamaresPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Altschlossfelsen 🧗', 'image': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg', 'desc': 'Le petit canyon de l\'Arizona en Moselle.', 'couleur': const Color(0xFFC0392B), 'page': const AltschlossfelsenPage(), 'caracteristiques': ['🤠 Je veux une aventure', '📸 Spots Instagram']},
        {'nom': 'La dune du Pilat 🐪', 'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg', 'desc': 'Un air de Sahara face à l\'Atlantique.', 'couleur': const Color(0xFFD4AC0D), 'page': const DuneDuPilatPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '🔭 Vue panoramique', '📸 Spots Instagram']}
      ]
    },
    {
      'titre': '🛶 Gorges & Eaux Turquoises',
      'tag': 'Eaux',
      'lieux': [
        {'nom': 'Gorges du Verdon 🛶', 'image': 'assets/images/VERDON.jpg', 'desc': 'Le grand canyon européen et son eau turquoise.', 'couleur': const Color(0xFF40E0D0), 'page': const GorgesDuVerdonPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique', '📸 Spots Instagram']},
        {'nom': 'Île de la Vierge 🏝️', 'image': 'assets/images/crique-ile-vierge-crozon.jpg', 'desc': 'Des airs de Caraïbes cachés en Bretagne.', 'couleur': const Color(0xFF40E0D0), 'page': const IleDeLaViergePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌅 Lever du soleil', '📸 Spots Instagram']},
        {'nom': 'Gorges du Fier 🌉', 'image': 'assets/images/gorges-du-fier-annecy-15.jpg', 'desc': 'Le Caminito del Rey de Haute-Savoie.', 'couleur': const Color(0xFFBDC3C7), 'page': const GorgesDuFierPage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Cascades des Tufs 💧', 'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg', 'desc': 'Un air de Bali (Indonésie) dans le Jura.', 'couleur': const Color(0xFF27AE60), 'page': const CascadesDesTufsPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Méandre de Queuille 🌿', 'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg', 'desc': 'L\'Amazonie auvergnate vue d\'en haut.', 'couleur': const Color(0xFF42C100), 'page': const MeandreQueuillePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌅 Lever du soleil', '🔭 Vue panoramique']},
        {'nom': "Lac de l'Orceyrette 🇨🇦", 'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg', 'desc': 'Un air de Canada sauvage dans les Alpes.', 'couleur': const Color(0xFF7FB3D5), 'page': const LacOrceyrettePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🔭 Vue panoramique']},
        {'nom': 'Lac d\'Allos 🇳🇴', 'image': 'assets/images/19.jpg', 'desc': 'Un air de Norvège dans les Alpes françaises.', 'couleur': const Color(0xFF5DADE2), 'page': const LacDAllosPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']}
      ]
    },
    {
      'titre': '🏛️ Parcs & Monuments Insolites',
      'tag': 'Monuments',
      'lieux': [
        {'nom': 'Buttes-Chaumont 🦢', 'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg', 'desc': 'Temple romantique et falaise au cœur de Paris.', 'couleur': const Color(0xFF5DADE2), 'page': const ButtesChaumontPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil']},
        {'nom': 'Palais Idéal 🏯', 'image': 'assets/images/facteur-cheval.jpg', 'desc': 'Temple d\'Asie mystique dans la Drôme.', 'couleur': const Color(0xFFD4AC0D), 'page': const PalaisIdealPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Parc Monceau ⛲', 'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg', 'desc': 'Élégance à l\'italienne en plein Paris.', 'couleur': const Color(0xFFD4AF37), 'page': const ParcMonceauPage(), 'caracteristiques': ['🧘 Je veux me détendre']},
        {'nom': 'Foret Fontainebleau 🌲', 'image': 'assets/images/foret-de-fontainebleau.jpg', 'desc': 'Forêt scandinave aux portes de Paris.', 'couleur': const Color(0xFF27AE60), 'page': const ForetFontainebleauPage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Chemin des Cimes 🌳', 'image': 'assets/images/88.jpg', 'desc': 'Une promenade immersive dans la canopée alsacienne.', 'couleur': const Color(0xFF27AE60), 'page': const CheminCimesAlsacePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🔭 Vue panoramique']}
      ]
    },
    {
      'titre': '🌋 Panoramas Uniques',
      'tag': 'Panoramas',
      'lieux': [
        {'nom': 'Puy de Dôme 🌋', 'image': 'assets/images/dome.webp', 'desc': 'Oui, la France possède bien des volcans !', 'couleur': const Color(0xFFE67E22), 'page': const PuyDeDomePage(), 'caracteristiques': ['🤠 Je veux une aventure', '🌅 Lever du soleil', '🔭 Vue panoramique']},
        {'nom': 'Pont du Gard 🏛️', 'image': 'assets/images/pont.webp', 'desc': 'Vue hors du commun sur ce chef-d\'œuvre antique.', 'couleur': const Color(0xFF3498DB), 'page': const PontDuGardPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '🔭 Vue panoramique']},
        {'nom': 'Marais d\'Aigues-Mortes 🧂', 'image': 'assets/images/5.jpg', 'desc': 'Des salines aux reflets de Bolivie.', 'couleur': const Color(0xFFF1C40F), 'page': const MaraisSalantsAiguesMortesPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '📸 Spots Instagram']}
      ]
    },
    {
      'titre': '🌊 Les Calanques de France',
      'tag': 'Calanques',
      'lieux': [
        {'nom': 'Calanque de Sugiton 🌊', 'image': 'assets/images/sugiton.jpg', 'desc': 'Falaises blanches majestueuses et eaux turquoise en Méditerranée.', 'couleur': const Color(0xFF00A896), 'page': const CalanqueDeSugitonPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram', '🔭 Vue panoramique']}
      ]
    }
  ];

  Widget _buildTexteSeparateur(String titre) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Center(
        child: Text(titre, style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
      ),
    );
  }

  Widget _buildChipFiltre(String tag) {
    bool select = _filtreActif == tag;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
          label: Text(tag, style: TextStyle(color: select ? Colors.black : Colors.white70, fontSize: 12, fontWeight: select ? FontWeight.bold : FontWeight.normal)),
          selected: select,
          selectedColor: Colors.white,
          backgroundColor: const Color(0xFF23262B),
          onSelected: (bool selected) {
            if (tag.contains('Jeux')) {
              Navigator.push(context, _routeSansAnimation(const JeuPage(isEnglish: false)));
            } else if (tag != _filtreActif) {
              // CHANGEMENT ICI : Utilisation de PUSH pour garder l'historique et permettre le retour
              Navigator.push(
                context,
                _routeSansAnimation(FranceSecretePage(isEnglish: widget.isEnglish, filtreInitial: tag)),
              );
            }
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> themesFiltres = [];
    if (_filtreActif == 'Tout') {
      themesFiltres = themes;
    } else if (_filtreActif.contains('Favoris')) {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => _favoris.contains(l['nom'])).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    } else if (_filtreActif.contains('Canyons') || _filtreActif.contains('Eaux') || _filtreActif.contains('Monuments') || _filtreActif.contains('Panoramas') || _filtreActif.contains('Calanques')) {
      String tagSimple = _filtreActif.trim().split(' ').last;
      themesFiltres = themes.where((t) => t['tag'] == tagSimple).toList();
    } else {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => (l['caracteristiques'] as List? ?? []).contains(_filtreActif)).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    }

    bool isTout = _filtreActif == 'Tout';

    List<Map<String, dynamic>> lieuxAffichesFlat = [];
    for (var theme in themesFiltres) {
      if (theme['lieux'] != null) {
        lieuxAffichesFlat.addAll(List<Map<String, dynamic>>.from(theme['lieux']));
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text("France Secrète", style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.0)),
            actions: [IconButton(icon: const Icon(Icons.casino, color: Colors.white), onPressed: _lancerRoulette)],
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _filtresOuverts = !_filtresOuverts),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                    decoration: BoxDecoration(color: const Color(0xFF1A1C20), borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.white10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.tune_rounded, color: Colors.white70, size: 20),
                            const SizedBox(width: 10),
                            Text(_filtreActif == 'Tout' ? "Filtrer les destinations" : "Filtre actif : $_filtreActif", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Icon(_filtresOuverts ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded, color: Colors.white70),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: _filtresOuverts,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildChipFiltre('Tout'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("🏜️ Découvrez par catégories "),
                        _buildChipFiltre('🏜️ Canyons '),
                        _buildChipFiltre('🛶 Eaux '),
                        _buildChipFiltre('🏛️ Monuments '),
                        _buildChipFiltre('🌋 Panoramas'),
                        _buildChipFiltre('🌊 Calanques'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("🧘 Selon vos envies du moment"),
                        _buildChipFiltre('🧘 Je veux me détendre'),
                        _buildChipFiltre('🤠 Je veux une aventure'),
                        _buildChipFiltre('🌅 Lever du soleil'),
                        _buildChipFiltre('🌇 Coucher du soleil'),
                        _buildChipFiltre('📸 Spots Instagram'),
                        _buildChipFiltre('🔭 Vue panoramique'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("Ma sélection personnelle"),
                        _buildChipFiltre('❤️ Favoris'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("Divertissement"),
                        _buildChipFiltre('🎮 Jeux'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                if (themesFiltres.isEmpty) {
                  if (_filtreActif.contains('Favoris')) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite, size: 90, color: Colors.redAccent.withOpacity(0.8)),
                          const SizedBox(height: 20),
                          Text(
                            "Vous n'avez pas encore de favoris",
                            style: GoogleFonts.cinzel(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Explorez les destinations et appuyez sur le cœur\npour construire votre carnet de voyage ici.",
                            style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, height: 1.5),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox(
                        height: 200,
                        child: Center(
                            child: Text("Aucun lieu trouvé", style: TextStyle(color: Colors.white54))
                        )
                    );
                  }
                }

                final theme = themesFiltres[index];
                final List lieux = theme['lieux'] ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 10), child: Text(theme['titre'], style: GoogleFonts.cinzel(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold))),
                    isTout
                        ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: lieux.map((lieu) => Padding(padding: EdgeInsets.only(right: lieux.last == lieu ? 20.0 : 0.0), child: _buildCard(lieu, isVertical: false, listeLieuxFiltree: lieuxAffichesFlat))).toList(),
                      ),
                    )
                        : Column(
                      children: lieux.map((lieu) => Padding(padding: const EdgeInsets.only(bottom: 8.0), child: _buildCard(lieu, isVertical: true, listeLieuxFiltree: lieuxAffichesFlat))).toList(),
                    ),
                  ],
                );
              },
              childCount: themesFiltres.isEmpty ? 1 : themesFiltres.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> lieu, {required bool isVertical, required List<Map<String, dynamic>> listeLieuxFiltree}) {
    bool estFavori = _favoris.contains(lieu['nom']);
    return GestureDetector(
      onTap: () => _presenterLieu(listeLieuxFiltree.indexWhere((l) => l['nom'] == lieu['nom']), listeCible: listeLieuxFiltree),
      child: Container(
        width: isVertical ? double.infinity : MediaQuery.of(context).size.width * 0.85,
        constraints: const BoxConstraints(minHeight: 110),
        margin: isVertical ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8) : const EdgeInsets.only(left: 20, top: 8, bottom: 8),
        decoration: BoxDecoration(color: const Color(0xFF1A1C20), borderRadius: BorderRadius.circular(25), boxShadow: [BoxShadow(color: (lieu['couleur'] as Color).withOpacity(0.15), blurRadius: 15, offset: const Offset(0, 8))]),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(25), child: SizedBox(width: 110, height: 110, child: Image.asset(lieu['image'], fit: BoxFit.cover))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text((lieu['nom'] as String).toUpperCase(), style: GoogleFonts.montserrat(color: lieu['couleur'], fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
                      const SizedBox(height: 4),
                      Text(lieu['desc'], style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 12)),
                      const SizedBox(height: 6),
                      Text("Cliquez pour découvrir l'endroit", style: GoogleFonts.montserrat(color: lieu['couleur'], fontSize: 11, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
                    ]),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _toggleFavori(lieu['nom']),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Icon(estFavori ? Icons.favorite : Icons.favorite_border, color: estFavori ? Colors.redAccent : Colors.white38, size: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}