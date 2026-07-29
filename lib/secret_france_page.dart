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
import 'anglais bis/Plateau des 1000 Étangs.dart';
import 'anglais bis/Gorges de Nouailles.dart';
import 'anglais bis/Les 4 lacs.dart';
import 'anglais bis/Pont d’Arc.dart';
import 'anglais bis/Mont Saint-Michel.dart';
import 'anglais bis/Calanques de Cassis.dart';
import 'anglais bis/CalanquesDePianaPage.dart';
import 'anglais bis/Le Gouffre de Padirac.dart';
import 'anglais bis/Forêt de Brocéliande.dart';
import 'anglais bis/Lac d’Ôo.dart';
import 'anglais bis/Lac de Capitello.dart';
import 'anglais bis/Le Marais Poitevin.dart';
import 'anglais bis/Lac d’Annecy.dart';
import 'anglais bis/Cascades du Hérisson.dart';
import 'anglais bis/Gorges du Tarn.dart';
import 'anglais bis/Sillans-la-Cascade.dart';
import 'anglais bis/Étretat.dart';
import 'anglais bis/Le Mont-Blanc.dart';
import 'anglais bis/Montagne Sainte-Victoire.dart';
import 'anglais bis/La Camargue.dart';
import 'anglais bis/Massif de l’Estérel.dart';
import 'anglais bis/Aiguilles de Bavella.dart';
import 'anglais bis/Pic du Canigou.dart';
import 'anglais bis/Cirque de Navacelles.dart';
import 'anglais bis/Dentelles de Montmirail.dart';
import 'anglais bis/Réserve de Scandola.dart';
import 'anglais bis/La Côte de Granit Rose.dart';
import 'anglais bis/Lac bleu.dart';



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

  const FranceSecretePage({Key? key, this.isEnglish = true, this.filtreInitial = 'All'}) : super(key: key);

  @override
  State<FranceSecretePage> createState() => _FranceSecretePageState();
}

class _FranceSecretePageState extends State<FranceSecretePage> {
  late String _filtreActif;
  Set<String> _favoris = {};
  List<Map<String, dynamic>> _tousLesLieux = [];

  final List<String> _historiqueFiltres = [];

  String get _cleStockage => widget.isEnglish ? 'mes_favoris_en' : 'mes_favoris_fr';

  @override
  void initState() {
    super.initState();
    _filtreActif = widget.filtreInitial;
    _historiqueFiltres.add(_filtreActif);
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

  Color _getCouleurAmbiance() {
    if (_filtreActif.contains('Canyons')) return const Color(0xFFE2725B);
    if (_filtreActif.contains('Waters')) return const Color(0xFF40E0D0);
    if (_filtreActif.contains('Monuments')) return const Color(0xFFD4AF37);
    if (_filtreActif.contains('Panoramas')) return const Color(0xFFBA4A00);
    if (_filtreActif.contains('Inlets')) return const Color(0xFF0E6251);
    if (_filtreActif.contains('Adventure')) return const Color(0xFFB03A2E);
    if (_filtreActif.contains('Relax')) return const Color(0xFF2ECC71);
    if (_filtreActif.contains('Favorites')) return Colors.redAccent;
    if (_filtreActif.contains('Games')) return Colors.purpleAccent;
    return const Color(0xFF1F3A60);
  }

  void _presenterLieu(int index, {required List<Map<String, dynamic>> listeCible}) {
    int nextIndex = (index + 1) % listeCible.length;
    final lieu = listeCible[index];

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dismiss",
      transitionDuration: Duration.zero,
      pageBuilder: (context, animation1, animation2) => StatefulBuilder(
          builder: (context, setModalState) {
            final estFavori = _favoris.contains(lieu['nom']);
            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF111315),
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: Colors.white.withOpacity(0.06), width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                          child: Image.asset(lieu['image'], height: 240, width: double.infinity, fit: BoxFit.cover),
                        ),
                        Positioned(
                          top: 16, right: 16,
                          child: CircleAvatar(
                            backgroundColor: Colors.black45,
                            child: IconButton(
                              icon: const Icon(Icons.close, color: Colors.white, size: 20),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Text(lieu['nom'].toString(),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(color: lieu['couleur'], fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1)),
                          const SizedBox(height: 12),
                          Text("${lieu['desc']} Explore every angle of this unique site in the heart of nature, a true hidden gem of French heritage.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(color: Colors.white.withOpacity(0.65), fontSize: 13, height: 1.6)),

                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: lieu['couleur'],
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context, _routeSansAnimation(lieu['page']));
                              },
                              child: Text("Discover the place", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 14)),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _modalAction(Icons.explore_outlined, "Explore", () {
                                Navigator.pop(context);
                                Navigator.push(context, _routeSansAnimation(lieu['page']));
                              }),
                              _modalAction(estFavori ? Icons.favorite : Icons.favorite_border, "Favorites", () {
                                _toggleFavori(lieu['nom']);
                                setModalState(() {});
                                setState(() {});
                              }, color: estFavori ? Colors.redAccent : Colors.white70),
                              _modalAction(Icons.map_outlined, "Maps", () => _ouvrirMaps(lieu['nom'])),
                            ],
                          ),

                          const SizedBox(height: 16),
                          const Divider(color: Colors.white10),

                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                              _presenterLieu(nextIndex, listeCible: listeCible);
                            },
                            icon: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white60),
                            label: Text("NEXT", style: GoogleFonts.montserrat(letterSpacing: 1.5, color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold)),
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

  Widget _modalAction(IconData icon, String label, VoidCallback onTap, {Color color = Colors.white70}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 6),
            Text(label, style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.w500)),
          ],
        ),
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
      showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Dismiss",
        transitionDuration: Duration.zero,
        pageBuilder: (context, animation1, animation2) => AlertDialog(
          backgroundColor: const Color(0xFF131518),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Mystery Destination ✨", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.close, color: Colors.white38, size: 20), onPressed: () => Navigator.pop(context)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("The itinerary adapts! Let's go to:", style: GoogleFonts.montserrat(color: Colors.white60, fontSize: 13)),
              const SizedBox(height: 16),
              Text(random['nom'], textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20, color: random['couleur'], fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(onPressed: () { Navigator.pop(context); showRandom(); }, child: Text("Another place", style: GoogleFonts.montserrat(color: Colors.white54))),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: random['couleur'], elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { Navigator.pop(context); Navigator.push(context, _routeSansAnimation(random['page'])); }, child: Text("Go there", style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)))
          ],
        ),
      );
    }
    showRandom();
  }

  final List<Map<String, dynamic>> themes = [
    {
      'titre': '🏜️ Air of Canyons & Deserts',
      'tag': 'Canyons',
      'lieux': [
        {'nom': 'Ochre Trail 🏜️', 'image': 'assets/images/20190528-165859-largejpg.jpg', 'desc': 'A touch of Colorado (USA) in Provence.', 'couleur': const Color(0xFFE2725B), 'page': const SentierDesOcresPage(), 'caracteristiques': ['🤠 I want an adventure', '🌅 Sunrise', '📸 Instagram spots', '🔭 Panoramic view']},
        {'nom': "Ille's Organs ⛰️", 'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg', 'desc': 'A touch of Cappadocia in the Eastern Pyrenees.', 'couleur': const Color(0xFFD35400), 'page': const OrguesIlleSurTetPage(), 'caracteristiques': ['🤠 I want an adventure', '🌇 Sunset', '📸 Instagram spots']},
        {'nom': 'Rougier de Camarès 🤠', 'image': 'assets/images/45.jpg', 'desc': 'The American Far West in the heart of Aveyron.', 'couleur': const Color(0xFFB03A2E), 'page': const RougierCamaresPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Altschlossfelsen 🧗', 'image': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg', 'desc': 'The little Arizona canyon in Moselle.', 'couleur': const Color(0xFFC0392B), 'page': const AltschlossfelsenPage(), 'caracteristiques': ['🤠 I want an adventure', '📸 Instagram spots']},
        {'nom': 'Dune of Pilat 🐪', 'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg', 'desc': 'A touch of the Sahara facing the Atlantic.', 'couleur': const Color(0xFFD4AC0D), 'page': const DuneDuPilatPage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset', '🔭 Panoramic view', '📸 Instagram spots']}
      ]
    },
    {
      'titre': '🛶 Gorges & Turquoise Waters',
      'tag': 'Waters',
      'lieux': [
        {'nom': 'Verdon Gorge 🛶', 'image': 'assets/images/VERDON.jpg', 'desc': 'The great European canyon and its turquoise water.', 'couleur': const Color(0xFF40E0D0), 'page': const GorgesDuVerdonPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view', '📸 Instagram spots']},
        {'nom': 'Virgin Island 🏝️', 'image': 'assets/images/crique-ile-vierge-crozon.jpg', 'desc': 'A Caribbean vibe hidden in Brittany.', 'couleur': const Color(0xFF34A1AF), 'page': const IleDeLaViergePage(), 'caracteristiques': ['🧘 I want to relax', '🌅 Sunrise', '📸 Instagram spots']},
        {'nom': 'Fier Gorge 🌉', 'image': 'assets/images/gorges-du-fier-annecy-15.jpg', 'desc': 'The Caminito del Rey of Haute-Savoie.', 'couleur': const Color(0xFF95A5A6), 'page': const GorgesDuFierPage(), 'caracteristiques': ['🤠 I want an adventure']},
        {'nom': 'Tufs Waterfalls 💧', 'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg', 'desc': 'A touch of Bali (Indonesia) in the Jura.', 'couleur': const Color(0xFF2ECC71), 'page': const CascadesDesTufsPage(), 'caracteristiques': ['🧘 I want to relax', '📸 Instagram spots']},
        {'nom': 'Queuille Meander 🌿', 'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg', 'desc': 'The Auvergne Amazon seen from above.', 'couleur': const Color(0xFF27AE60), 'page': const MeandreQueuillePage(), 'caracteristiques': ['🧘 I want to relax', '🌅 Sunrise', '🔭 Panoramic view']},
        {'nom': "Orceyrette Lake 🇨🇦", 'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg', 'desc': 'A touch of wild Canada in the Alps.', 'couleur': const Color(0xFF5FA1DE), 'page': const LacOrceyrettePage(), 'caracteristiques': ['🧘 I want to relax', '🔭 Panoramic view']},
        {'nom': 'Allos Lake 🇳🇴', 'image': 'assets/images/19.jpg', 'desc': 'A touch of Norway in the French Alps.', 'couleur': const Color(0xFF2980B9), 'page': const LacDAllosPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Plateau of 1000 Ponds 🇫🇮', 'image': 'assets/image/4.jpg', 'desc': 'The "Little Finland".', 'couleur': const Color(0xFF2980B9), 'page': const PlateauMilleEtangsPage(), 'caracteristiques': ['🧘 I want to relax', '🤠 I want an adventure']},
        {'nom': 'Nouailles Gorge 🛶', 'image': 'assets/image/7.jpg', 'desc': 'Vertiginous gorge carved by the Loue river.', 'couleur': const Color(0xFF1ABC9C), 'page': const GorgesNouaillesPage(), 'caracteristiques': ['🤠 I want an adventure']},
        {'nom': 'The 4 Lakes 🏴󠁧󠁢󠁳󠁣󠁴󠁿', 'image': 'assets/image/16.jpg', 'desc': 'The Little Scotland of Jura.', 'couleur': const Color(0xFF2E86C1), 'page': const QuatreLacsPage(), 'caracteristiques': ['🧘 I want to relax', '🔭 Panoramic view']},
        {'nom': 'Pont d’Arc 🇧🇦', 'image': 'assets/image/19.webp', 'desc': 'A touch of Bosnia and Herzegovina.', 'couleur': const Color(0xFF16A085), 'page': const PontDArcPage(), 'caracteristiques': ['🤠 I want an adventure', '📸 Instagram spots']},
        {'nom': 'Ôo Lake 💧', 'image': 'assets/imag/1.jpg', 'desc': 'Majestic mountain lake and its large waterfall.', 'couleur': const Color(0xFF5DADE2), 'page': const LacDooPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Capitello Lake 🏔️', 'image': 'assets/imag/6.webp', 'desc': 'Glacial jewel perched in Corsica.', 'couleur': const Color(0xFF2874A6), 'page': const LacDeCapitelloPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Marais Poitevin 🚣', 'image': 'assets/imag/10.jpg', 'desc': 'The Green Venice: network.', 'couleur': const Color(0xFF27AE60), 'page': const LeMaraisPoitevinPage(), 'caracteristiques': ['🧘 I want to relax']},
        {'nom': 'Annecy Lake 🦢', 'image': 'assets/imag/17.jpg', 'desc': 'The purest waters in Europe.', 'couleur': const Color(0xFF3498DB), 'page': const LacDAnnecyPage(), 'caracteristiques': ['🧘 I want to relax', '📸 Instagram spots']},
        {'nom': 'Sillans-la-Cascade 🌴', 'image': 'assets/imag/23.jpg', 'desc': 'A tropical lagoon in the Var.', 'couleur': const Color(0xFF48C9B0), 'page': const SillansLaCascadePage(), 'caracteristiques': ['🧘 I want to relax', '📸 Instagram spots']},
        {'nom': 'Hérisson Waterfalls 💦', 'image': 'assets/imag/25.jpg', 'desc': 'A magical valley dotted with waterfalls.', 'couleur': const Color(0xFF117A65), 'page': const CascadesDuHerissonPage(), 'caracteristiques': ['🤠 I want an adventure']},
        {'nom': 'Blue Lake 💙', 'image': 'assets/imag/29.jpg', 'desc': 'A sanctuary of purity with crystalline waters.', 'couleur': const Color(0xFF5DADE2), 'page': const LacPage(), 'caracteristiques': ['🧘 I want to relax', '📸 Instagram spots']},
        {'nom': 'Tarn Gorge 🦅', 'image': 'assets/imag/38.webp', 'desc': 'Vertiginous canyon in the heart of the Causses.', 'couleur': const Color(0xFF2E86C1), 'page': const GorgesDuTarnPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']}
      ]
    },
    {
      'titre': '🏛️ Unusual Parks & Monuments',
      'tag': 'Monuments',
      'lieux': [
        {'nom': 'Buttes-Chaumont 🦢', 'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg', 'desc': 'Romantic temple in the heart of Paris.', 'couleur': const Color(0xFF34495E), 'page': const ButtesChaumontPage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset']},
        {'nom': 'Ideal Palace 🏯', 'image': 'assets/images/facteur-cheval.jpg', 'desc': 'Mystical Asian temple in the Drôme region.', 'couleur': const Color(0xFF9A7D0A), 'page': const PalaisIdealPage(), 'caracteristiques': ['🧘 I want to relax', '📸 Instagram spots']},
        {'nom': 'Monceau Park ⛲', 'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg', 'desc': 'Italian-style elegance in Paris.', 'couleur': const Color(0xFFD4AF37), 'page': const ParcMonceauPage(), 'caracteristiques': ['🧘 I want to relax']},
        {'nom': 'Fontainebleau Forest 🌲', 'image': 'assets/images/foret-de-fontainebleau.jpg', 'desc': 'Scandinavian forest at the gates of Paris.', 'couleur': const Color(0xFF196F3D), 'page': const ForetFontainebleauPage(), 'caracteristiques': ['🤠 I want an adventure']},
        {'nom': 'Treetop Walkway 🌳', 'image': 'assets/images/88.jpg', 'desc': 'Walk through the Alsatian canopy.', 'couleur': const Color(0xFF229954), 'page': const CheminCimesAlsacePage(), 'caracteristiques': ['🧘 I want to relax', '🔭 Panoramic view']},
        {'nom': 'Mont Saint-Michel 🏰', 'image': 'assets/image/24.webp', 'desc': 'Wonder of the West rising from the water.', 'couleur': const Color(0xFF7F8C8D), 'page': const MontSaintMichelPage(), 'caracteristiques': ['📸 Instagram spots', '🌇 Sunset']},
        {'nom': 'Brocéliande Forest 🧙‍♂️', 'image': 'assets/image/51.jpg', 'desc': 'Legendary home of King Arthur myths.', 'couleur': const Color(0xFF1E8449), 'page': const ForetDeBroceliandePage(), 'caracteristiques': ['🤠 I want an adventure']},
        {'nom': 'Padirac Chasm 🕳️', 'image': 'assets/image/58.jpg', 'desc': 'A fantastic dive into the center of the Earth.', 'couleur': const Color(0xFF34495E), 'page': const LeGouffreDePadiracPage(), 'caracteristiques': ['🤠 I want an adventure']}
      ]
    },
    {
      'titre': '🌋 Unique Panoramas',
      'tag': 'Panoramas',
      'lieux': [
        {'nom': 'Puy de Dôme 🌋', 'image': 'assets/images/dome.webp', 'desc': 'Yes, France really has volcanoes!', 'couleur': const Color(0xFFBA4A00), 'page': const PuyDeDomePage(), 'caracteristiques': ['🤠 I want an adventure', '🌅 Sunrise', '🔭 Panoramic view']},
        {'nom': 'Pont du Gard 🏛️', 'image': 'assets/images/pont.webp', 'desc': 'Grand ancient masterpiece.', 'couleur': const Color(0xFF2E4053), 'page': const PontDuGardPage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset', '🔭 Panoramic view']},
        {'nom': 'Aigues-Mortes Marshes 🧂', 'image': 'assets/images/5.jpg', 'desc': 'Salt flats with Bolivian reflections.', 'couleur': const Color(0xFFE6B800), 'page': const MaraisSalantsAiguesMortesPage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset', '📸 Instagram spots']},
        {'nom': 'Étretat 🌊', 'image': 'assets/imag/33.webp', 'desc': 'Majestic chalk cliffs on the English Channel.', 'couleur': const Color(0xFF5D6D7E), 'page': const EtretatPage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset', '🔭 Panoramic view']},
        {'nom': 'Mont Blanc 🏔️', 'image': 'assets/imag/41.jpg', 'desc': 'The majestic roof of Europe.', 'couleur': const Color(0xFFD6DBDF), 'page': const MontBlancPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Sainte-Victoire Mountain ⛰️', 'image': 'assets/ima/1.png', 'desc': 'Cézanne\'s muse at the gates of Aix.', 'couleur': const Color(0xFF839192), 'page': const MontagneSainteVictoirePage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'The Camargue 🦩', 'image': 'assets/ima/5.webp', 'desc': 'Wild lands, white horses, and pink flamingos.', 'couleur': const Color(0xFFE59866), 'page': const LaCamarguePage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset']},
        {'nom': 'Esterel Massif 🌋', 'image': 'assets/ima/11.jpg', 'desc': 'Red rocks plunging into the Mediterranean.', 'couleur': const Color(0xFFCB4335), 'page': const MassifEsterelPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view', '📸 Instagram spots']},
        {'nom': 'Bavella Needles ⛰️', 'image': 'assets/ima/19.jpg', 'desc': 'The jagged peaks of Southern Corsica.', 'couleur': const Color(0xFF99A3A4), 'page': const AiguillesBavellaPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Canigou Peak 🏔️', 'image': 'assets/ima/24.jpg', 'desc': 'The sacred mountain of the Catalans.', 'couleur': const Color(0xFF873600), 'page': const PicCanigouPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Navacelles Circus 🌀', 'image': 'assets/ima/28.jpg', 'desc': 'A spectacular meander carved into the limestone.', 'couleur': const Color(0xFF52BE80), 'page': const CirqueNavacellesPage(), 'caracteristiques': ['🔭 Panoramic view']},
        {'nom': 'Dentelles de Montmirail 🏔️', 'image': 'assets/ima/33.jpg', 'desc': 'Chiseled ridges in the heart of Provence.', 'couleur': const Color(0xFF909497), 'page': const DentellesMontmirailPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view']},
        {'nom': 'Pink Granite Coast 🪨', 'image': 'assets/ima/38.jpg', 'desc': 'Rock chaos with magical hues in Brittany.', 'couleur': const Color(0xFFF1948A), 'page': const CoteGranitRosePage(), 'caracteristiques': ['🧘 I want to relax', '🌇 Sunset', '📸 Instagram spots']},
        {'nom': 'Scandola Reserve 🦅', 'image': 'assets/ima/43.webp', 'desc': 'Preserved volcanic and marine jewel of Corsica.', 'couleur': const Color(0xFFC0392B), 'page': const ReserveScandolaPage(), 'caracteristiques': ['🤠 I want an adventure', '🔭 Panoramic view', '📸 Instagram spots']}
      ]
    },
    {
      'titre': '🌊 The Calanques of France',
      'tag': 'Calanques',
      'lieux': [
        {'nom': 'Sugiton Calanque 🌊', 'image': 'assets/images/sugiton.jpg', 'desc': 'White cliffs and turquoise waters in the Mediterranean.', 'couleur': const Color(0xFF0E6251), 'page': const CalanqueDeSugitonPage(), 'caracteristiques': ['🧘 I want to relax', '📸 Instagram spots', '🔭 Panoramic view']},
        {'nom': 'Cassis Calanques 🚤', 'image': 'assets/image/33.webp', 'desc': 'Spectacular Mediterranean fjords.', 'couleur': const Color(0xFF1ABC9C), 'page': const CalanquesDeCassisPage(), 'caracteristiques': ['🤠 I want an adventure', '📸 Instagram spots']},
        {'nom': 'Piana Calanques 🌋', 'image': 'assets/image/41.webp', 'desc': 'Fire-red sculpted rocks plunging into the sea.', 'couleur': const Color(0xFFE74C3C), 'page': const CalanquesDePianaPage(), 'caracteristiques': ['🌇 Sunset', '📸 Instagram spots', '🔭 Panoramic view']}
      ]
    }
  ];

  Widget _buildSectionLabel(String titre) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 14, bottom: 8),
      child: Text(
        titre,
        style: GoogleFonts.montserrat(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }

  Widget _buildChipFiltre(String tag) {
    bool select = _filtreActif == tag;
    return GestureDetector(
      onTap: () {
        if (tag.contains('Games')) {
          Navigator.push(context, _routeSansAnimation(const JeuPage(isEnglish: true)));
        } else if (tag != _filtreActif) {
          setState(() {
            _filtreActif = tag;
            _historiqueFiltres.add(tag);
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8, bottom: 4, top: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: select ? Colors.white : const Color(0xFF14161B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: select ? Colors.white : Colors.white.withOpacity(0.03)),
          boxShadow: select ? [BoxShadow(color: Colors.white.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))] : [],
        ),
        child: Center(
          child: Text(
            tag,
            style: GoogleFonts.montserrat(
              color: select ? Colors.black : Colors.white.withOpacity(0.75),
              fontSize: 12,
              fontWeight: select ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ),
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

    List<Map<String, dynamic>> lieuxAffichesFlat = [];
    for (var theme in themesFiltres) {
      if (theme['lieux'] != null) {
        lieuxAffichesFlat.addAll(List<Map<String, dynamic>>.from(theme['lieux']));
      }
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (_historiqueFiltres.length > 1) {
          setState(() {
            _historiqueFiltres.removeLast();
            _filtreActif = _historiqueFiltres.last;
          });
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF07080A),
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: -100,
              left: _filtreActif == 'All' ? -80 : 120,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 380,
                height: 380,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _getCouleurAmbiance().withOpacity(0.15),
                      blurRadius: 150,
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: 80,
              right: -120,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _getCouleurAmbiance().withOpacity(0.10),
                      blurRadius: 130,
                      spreadRadius: 40,
                    ),
                  ],
                ),
              ),
            ),
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text("Secret France", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 4.0, fontSize: 22)),
                  actions: [IconButton(icon: const Icon(Icons.casino_outlined, color: Colors.white), onPressed: _lancerRoulette)],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionLabel("🏜️ Categories"),
                      SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildChipFiltre('All'),
                            _buildChipFiltre('🏜️ Canyons '),
                            _buildChipFiltre('🛶 Waters '),
                            _buildChipFiltre('🏛️ Monuments '),
                            _buildChipFiltre('🌋 Panoramas'),
                            _buildChipFiltre('🌊 Inlets'),
                          ],
                        ),
                      ),
                      _buildSectionLabel("🧘 Your Desires"),
                      SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildChipFiltre('🧘 Relax'),
                            _buildChipFiltre('🤠 Adventure'),
                            _buildChipFiltre('🌅 Sunrise'),
                            _buildChipFiltre('🌇 Sunset'),
                            _buildChipFiltre('📸 Instagram Spots'),
                            _buildChipFiltre('🔭 Panoramic View'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("❤️ QUICK ACCESS", style: GoogleFonts.montserrat(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                  const SizedBox(height: 6),
                                  SizedBox(width: double.infinity, child: _buildChipFiltre('❤️ Favorites')),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("🎮 ENTERTAINMENT", style: GoogleFonts.montserrat(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                  const SizedBox(height: 6),
                                  SizedBox(width: double.infinity, child: _buildChipFiltre('🎮 Games')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Divider(color: Colors.white10, height: 1),
                      )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      if (themesFiltres.isEmpty) {
                        if (_filtreActif.contains('Favorites')) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_border_rounded, size: 50, color: Colors.white24),
                                const SizedBox(height: 16),
                                Text("Your notebook is empty", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Text("Add your favorite places by clicking the heart.", style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 12)),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                              height: 200,
                              child: Center(child: Text("No places found", style: GoogleFonts.montserrat(color: Colors.white38)))
                          );
                        }
                      }
                      final theme = themesFiltres[index];
                      final List lieux = theme['lieux'] ?? [];
                      if (_filtreActif == 'All') {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                                child: Text(theme['titre'].toString(), style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.8))
                            ),
                            SizedBox(
                              height: 220,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                itemCount: lieux.length,
                                itemBuilder: (context, lIndex) {
                                  return _buildCardHorizontal(lieux[lIndex], lieuxAffichesFlat);
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                                child: Text(theme['titre'].toString(), style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.8))
                            ),
                            Column(
                              children: lieux.map((lieu) => _buildCardVertical(lieu, lieuxAffichesFlat)).toList(),
                            ),
                          ],
                        );
                      }
                    },
                    childCount: themesFiltres.isEmpty ? 1 : themesFiltres.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHorizontal(Map<String, dynamic> lieu, List<Map<String, dynamic>> listeLieuxFiltree) {
    bool estFavori = _favoris.contains(lieu['nom']);
    Color couleurLieu = lieu['couleur'] ?? Colors.white;
    return GestureDetector(
      onTap: () => _presenterLieu(listeLieuxFiltree.indexWhere((l) => l['nom'] == lieu['nom']), listeCible: listeLieuxFiltree),
      child: Container(
        width: 270,
        margin: const EdgeInsets.only(right: 14, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(image: AssetImage(lieu['image']), fit: BoxFit.cover),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.65)],
                ),
              ),
            ),
            Positioned(
              top: 10, right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                radius: 16,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(estFavori ? Icons.favorite : Icons.favorite_border, size: 16, color: estFavori ? Colors.redAccent : Colors.white),
                  onPressed: () => _toggleFavori(lieu['nom']),
                ),
              ),
            ),
            Positioned(
              bottom: 14, left: 14, right: 14,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F1115).withOpacity(0.75),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              lieu['nom'] as String,
                              style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lieu['desc'] as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(color: Colors.white60, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: couleurLieu,
                    child: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardVertical(Map<String, dynamic> lieu, List<Map<String, dynamic>> listeLieuxFiltree) {
    bool estFavori = _favoris.contains(lieu['nom']);
    Color couleurLieu = lieu['couleur'] ?? Colors.white;
    return GestureDetector(
      onTap: () => _presenterLieu(listeLieuxFiltree.indexWhere((l) => l['nom'] == lieu['nom']), listeCible: listeLieuxFiltree),
      child: Container(
        height: 200,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(image: AssetImage(lieu['image']), fit: BoxFit.cover),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.1), Colors.black.withOpacity(0.65)],
                ),
              ),
            ),
            Positioned(
              top: 12, right: 12,
              child: CircleAvatar(
                backgroundColor: Colors.black38,
                radius: 18,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(estFavori ? Icons.favorite : Icons.favorite_border, size: 18, color: estFavori ? Colors.redAccent : Colors.white),
                  onPressed: () => _toggleFavori(lieu['nom']),
                ),
              ),
            ),
            Positioned(
              bottom: 16, left: 16, right: 16,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0F1115).withOpacity(0.75),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              lieu['nom'] as String,
                              style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lieu['desc'] as String,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(color: Colors.white60, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: couleurLieu,
                    child: const Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}