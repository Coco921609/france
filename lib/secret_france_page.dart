import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'questions_data.dart';
import 'jeu_page.dart';

import 'Anglais/sentier_des_ocres.dart';
import 'Anglais/ile_de_la_vierge.dart';
import 'Anglais/altschlossfelsen.dart';
import 'Anglais/lac_de_lorceyrette.dart';
import 'Anglais/parc_monceau.dart';
import 'Anglais/gorges_du_fier.dart';
import 'Anglais/palais_ideal.dart';
import 'Anglais/foret_fontainebleau.dart';
import 'Anglais/buttes_chaumont.dart';
import 'Anglais/les_orgues_d_ille_sur_tet.dart';
import 'Anglais/les_cascades_des_tufs.dart';
import 'Anglais/le_desert_du_rougier_de_camar_s.dart';
import 'Anglais/les_gorges_du_verdon.dart';
import 'Anglais/le_meandre_de_queuille.dart';
import 'Anglais/la_dune_du_pilat.dart';
import 'Anglais/puy_de_dome.dart';
import 'Anglais/pont_du_gard.dart';
import 'Anglais/lac_d_allos.dart';
import 'Anglais/marais_salants_aigues_mortes.dart';
import 'Anglais/alsace.dart';
import 'Anglais/calanque_de_sugiton.dart';

// Helper pour navigation sans animation
PageRouteBuilder _routeInstantanee(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}

class FranceSecretePage extends StatefulWidget {
  final bool isEnglish;
  final String filtreInitial;

  const FranceSecretePage({Key? key, this.isEnglish = true, this.filtreInitial = 'All'}) : super(key: key);

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
                          Text("${lieu['desc']} This exceptional place is a true hidden wonder of French heritage. Take the time to explore every detail and every angle of this unique site which offers an unforgettable immersive experience in the heart of nature.",
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
                                Navigator.push(context, _routeInstantanee(lieu['page']));
                              },
                              child: const Text("Click to discover the place", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _modalAction(estFavori ? Icons.favorite : Icons.favorite_border, "Favorites", () {
                                _toggleFavori(lieu['nom']);
                                setModalState(() {});
                                setState(() {});
                              }, color: estFavori ? Colors.redAccent : Colors.white),
                              _modalAction(Icons.map_outlined, "Maps", () => _ouvrirMaps(lieu['nom'])),
                              _modalAction(Icons.explore_outlined, "Explore", () {
                                Navigator.pop(context);
                                Navigator.push(context, _routeInstantanee(lieu['page']));
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
                            label: const Text("NEXT PLACE", style: TextStyle(letterSpacing: 1.2, color: Colors.white70)),
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
    if (_filtreActif == 'All' || _filtreActif.contains('Favorites') || _filtreActif.contains('Games')) {
      lieuxDisponibles = _tousLesLieux;
    } else if (_filtreActif.contains('Canyons') || _filtreActif.contains('Waters') || _filtreActif.contains('Monuments') || _filtreActif.contains('Panoramas') || _filtreActif.contains('Inlets')) {
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
              Expanded(child: Text("Mystery Destination ✨", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.close, color: Colors.white54, size: 22), onPressed: () => Navigator.pop(context)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("The itinerary adapts! Let's go to:", style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 10),
              Text(random['nom'], style: GoogleFonts.cinzel(fontSize: 18, color: random['couleur'], fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(onPressed: () { Navigator.pop(context); showRandom(); }, child: const Text("Another place")),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: random['couleur']), onPressed: () { Navigator.pop(context); Navigator.push(context, _routeInstantanee(random['page'])); }, child: const Text("Go there", style: TextStyle(color: Colors.white)))
          ],
        ),
      );
    }
    showRandom();
  }

  final List<Map<String, dynamic>> themes = [
    {
      'titre': '🏜️ Canyons & Deserts',
      'tag': 'Canyons',
      'lieux': [
        {'nom': 'Ochre Trail 🏜️', 'image': 'assets/images/20190528-165859-largejpg.jpg', 'desc': 'A taste of Colorado (USA) in Provence.', 'couleur': const Color(0xFFE2725B), 'page': const SentierDesOcresPage(), 'caracteristiques': ['🤠 Adventure', '🌅 Sunrise', '📸 Instagram Spots', '🔭 Panoramic View']},
        {'nom': "Orgues d'Ille ⛰️", 'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg', 'desc': 'A taste of Cappadocia (Turkey) in the Eastern Pyrenees.', 'couleur': const Color(0xFFD35400), 'page': const OrguesIlleSurTetPage(), 'caracteristiques': ['🤠 Adventure', '🌇 Sunset', '📸 Instagram Spots']},
        {'nom': 'Rougier de Camarès 🤠', 'image': 'assets/images/45.jpg', 'desc': 'The American Far West in Aveyron.', 'couleur': const Color(0xFFB03A2E), 'page': const RougierCamaresPage(), 'caracteristiques': ['🤠 Adventure', '🔭 Panoramic View']},
        {'nom': 'Altschlossfelsen 🧗', 'image': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg', 'desc': 'The little Arizona canyon in Moselle.', 'couleur': const Color(0xFFC0392B), 'page': const AltschlossfelsenPage(), 'caracteristiques': ['🤠 Adventure', '📸 Instagram Spots']},
        {'nom': 'Dune of Pilat 🐪', 'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg', 'desc': 'A taste of the Sahara facing the Atlantic.', 'couleur': const Color(0xFFD4AC0D), 'page': const DuneDuPilatPage(), 'caracteristiques': ['🧘 Relax', '🌇 Sunset', '🔭 Panoramic View', '📸 Instagram Spots']}
      ]
    },
    {
      'titre': '🛶 Gorges & Turquoise Waters',
      'tag': 'Waters',
      'lieux': [
        {'nom': 'Verdon Gorge 🛶', 'image': 'assets/images/VERDON.jpg', 'desc': 'Europe\'s grand canyon with turquoise water.', 'couleur': const Color(0xFF40E0D0), 'page': const GorgesDuVerdonPage(), 'caracteristiques': ['🤠 Adventure', '🔭 Panoramic View', '📸 Instagram Spots']},
        {'nom': 'Virgin Island 🏝️', 'image': 'assets/images/crique-ile-vierge-crozon.jpg', 'desc': 'A Caribbean vibe hidden in Brittany.', 'couleur': const Color(0xFF40E0D0), 'page': const IleDeLaViergePage(), 'caracteristiques': ['🧘 Relax', '🌅 Sunrise', '📸 Instagram Spots']},
        {'nom': 'Fier Gorge 🌉', 'image': 'assets/images/gorges-du-fier-annecy-15.jpg', 'desc': 'The Caminito del Rey of Haute-Savoie.', 'couleur': const Color(0xFFBDC3C7), 'page': const GorgesDuFierPage(), 'caracteristiques': ['🤠 Adventure']},
        {'nom': 'Tufs Waterfall 💧', 'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg', 'desc': 'A taste of Bali (Indonesia) in the Jura.', 'couleur': const Color(0xFF27AE60), 'page': const CascadesDesTufsPage(), 'caracteristiques': ['🧘 Relax', '📸 Instagram Spots']},
        {'nom': 'Queuille Meander 🌿', 'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg', 'desc': 'The Auvergne Amazon seen from above.', 'couleur': const Color(0xFF42C100), 'page': const MeandreQueuillePage(), 'caracteristiques': ['🧘 Relax', '🌅 Sunrise', '🔭 Panoramic View']},
        {'nom': "Lake Orceyrette 🇨🇦", 'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg', 'desc': 'A taste of wild Canada in the Alps.', 'couleur': const Color(0xFF7FB3D5), 'page': const LacOrceyrettePage(), 'caracteristiques': ['🧘 Relax', '🔭 Panoramic View']},
        {'nom': 'Lake Allos 🇳🇴', 'image': 'assets/images/19.jpg', 'desc': 'A taste of Norway in the French Alps.', 'couleur': const Color(0xFF5DADE2), 'page': const LacDAllosPage(), 'caracteristiques': ['🤠 Adventure', '🔭 Panoramic View']}
      ]
    },
    {
      'titre': '🏛️ Parks & Unusual Monuments',
      'tag': 'Monuments',
      'lieux': [
        {'nom': 'Buttes-Chaumont 🦢', 'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg', 'desc': 'Romantic temple and cliff in the heart of Paris.', 'couleur': const Color(0xFF5DADE2), 'page': const ButtesChaumontPage(), 'caracteristiques': ['🧘 Relax', '🌇 Sunset']},
        {'nom': 'Ideal Palace 🏯', 'image': 'assets/images/facteur-cheval.jpg', 'desc': 'Mystical Asian temple in the Drôme.', 'couleur': const Color(0xFFD4AC0D), 'page': const PalaisIdealPage(), 'caracteristiques': ['🧘 Relax', '📸 Instagram Spots']},
        {'nom': 'Monceau Park ⛲', 'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg', 'desc': 'Italian elegance in the heart of Paris.', 'couleur': const Color(0xFFD4AF37), 'page': const ParcMonceauPage(), 'caracteristiques': ['🧘 Relax']},
        {'nom': 'Fontainebleau Forest 🌲', 'image': 'assets/images/foret-de-fontainebleau.jpg', 'desc': 'Scandinavian forest at the gates of Paris.', 'couleur': const Color(0xFF27AE60), 'page': const ForetFontainebleauPage(), 'caracteristiques': ['🤠 Adventure']},
        {'nom': 'Treetop Path 🌳', 'image': 'assets/images/88.jpg', 'desc': 'An immersive stroll through the Alsatian canopy.', 'couleur': const Color(0xFF27AE60), 'page': const CheminCimesAlsacePage(), 'caracteristiques': ['🧘 Relax', '🔭 Panoramic View']}
      ]
    },
    {
      'titre': '🌋 Unique Panoramas',
      'tag': 'Panoramas',
      'lieux': [
        {'nom': 'Puy de Dôme 🌋', 'image': 'assets/images/dome.webp', 'desc': 'Yes, France does have volcanoes!', 'couleur': const Color(0xFFE67E22), 'page': const PuyDeDomePage(), 'caracteristiques': ['🤠 Adventure', '🌅 Sunrise', '🔭 Panoramic View']},
        {'nom': 'Pont du Gard 🏛️', 'image': 'assets/images/pont.webp', 'desc': 'Outstanding view of this ancient masterpiece.', 'couleur': const Color(0xFF3498DB), 'page': const PontDuGardPage(), 'caracteristiques': ['🧘 Relax', '🌇 Sunset', '🔭 Panoramic View']},
        {'nom': 'Aigues-Mortes Salt Marshes 🧂', 'image': 'assets/images/5.jpg', 'desc': 'Salt marshes with reflections of Bolivia.', 'couleur': const Color(0xFFF1C40F), 'page': const MaraisSalantsAiguesMortesPage(), 'caracteristiques': ['🧘 Relax', '🌇 Sunset', '📸 Instagram Spots']}
      ]
    },
    {
      'titre': '🌊 The Inlets of France',
      'tag': 'Inlets',
      'lieux': [
        {'nom': 'Sugiton Cove 🌊', 'image': 'assets/images/sugiton.jpg', 'desc': 'Majestic white cliffs and turquoise waters in the Mediterranean.', 'couleur': const Color(0xFF00A896), 'page': const CalanqueDeSugitonPage(), 'caracteristiques': ['🧘 Relax', '📸 Instagram Spots', '🔭 Panoramic View']}
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
            if (tag.contains('Games')) {
              Navigator.push(context, _routeInstantanee(const JeuPage(isEnglish: true)));
            } else if (tag != _filtreActif) {
              // Utilisation de push au lieu de pushReplacement pour permettre le retour
              Navigator.push(
                context,
                _routeInstantanee(FranceSecretePage(isEnglish: widget.isEnglish, filtreInitial: tag)),
              );
            }
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> themesFiltres = [];
    if (_filtreActif == 'All') {
      themesFiltres = themes;
    } else if (_filtreActif.contains('Favorites')) {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => _favoris.contains(l['nom'])).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    } else if (_filtreActif.contains('Canyons') || _filtreActif.contains('Waters') || _filtreActif.contains('Monuments') || _filtreActif.contains('Panoramas') || _filtreActif.contains('Inlets')) {
      String tagSimple = _filtreActif.trim().split(' ').last;
      themesFiltres = themes.where((t) => t['tag'] == tagSimple).toList();
    } else {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => (l['caracteristiques'] as List? ?? []).contains(_filtreActif)).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    }

    bool isAll = _filtreActif == 'All';

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
            title: Text("Secret France", style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.0)),
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
                            Text(_filtreActif == 'All' ? "Filter destinations" : "Active Filter: $_filtreActif", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
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
                        _buildChipFiltre('All'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("🏜️ Discover by categories"),
                        _buildChipFiltre('🏜️ Canyons '),
                        _buildChipFiltre('🛶 Waters '),
                        _buildChipFiltre('🏛️ Monuments '),
                        _buildChipFiltre('🌋 Panoramas'),
                        _buildChipFiltre('🌊 Inlets'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("🧘 Based on your current mood"),
                        _buildChipFiltre('🧘 Relax'),
                        _buildChipFiltre('🤠 Adventure'),
                        _buildChipFiltre('🌅 Sunrise'),
                        _buildChipFiltre('🌇 Sunset'),
                        _buildChipFiltre('📸 Instagram Spots'),
                        _buildChipFiltre('🔭 Panoramic View'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("My personal selection"),
                        _buildChipFiltre('❤️ Favorites'),
                        const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                        _buildTexteSeparateur("Entertainment"),
                        _buildChipFiltre('🎮 Games'),
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
                  if (_filtreActif.contains('Favorites')) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite, size: 90, color: Colors.redAccent.withOpacity(0.8)),
                          const SizedBox(height: 20),
                          Text(
                            "You don't have any favorites yet",
                            style: GoogleFonts.cinzel(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Explore the destinations and press the heart\nto build your travel journal here.",
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
                            child: Text("No location found", style: TextStyle(color: Colors.white54))
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
                    isAll
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
                      Text("Click to discover the place", style: GoogleFonts.montserrat(color: lieu['couleur'], fontSize: 11, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
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