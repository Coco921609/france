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
import 'français/Altschlossfelsen.dart';
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
import 'français bis/Plateau des 1000 Étangs.dart';
import 'français bis/Gorges de Nouailles.dart';
import 'français bis/Les 4 lacs.dart';
import 'français bis/Pont d’Arc.dart';
import 'français bis/Mont Saint-Michel.dart';
import 'français bis/Calanques de Cassis.dart';
import 'français bis/CalanquesDePianaPage.dart';
import 'français bis/Le Gouffre de Padirac.dart';
import 'français bis/Forêt de Brocéliande.dart';
import 'français bis/Lac d’Ôo.dart';
import 'français bis/Lac de Capitello.dart';
import 'français bis/Le Marais Poitevin.dart';
import 'français bis/Lac bleu.dart';
import 'français bis/Lac d’Annecy.dart';
import 'français bis/Cascades du Hérisson.dart';
import 'français bis/Gorges du Tarn.dart';
import 'français bis/Sillans-la-Cascade.dart';
import 'français bis/Étretat.dart';
import 'français bis/Le Mont-Blanc.dart';
import 'français bis/Montagne Sainte-Victoire.dart';
import 'français bis/La Camargue.dart';
import 'français bis/Massif de l’Estérel.dart';
import 'français bis/Aiguilles de Bavella.dart';
import 'français bis/Pic du Canigou.dart';
import 'français bis/Cirque de Navacelles.dart';
import 'français bis/Dentelles de Montmirail.dart';
import 'français bis/Réserve de Scandola.dart';
import 'français bis/La Côte de Granit Rose.dart';


PageRouteBuilder _routeSansAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}

// Page de remplacement pour éviter les crashs sur les lieux sans page définie
class PageEnConstruction extends StatelessWidget {
  const PageEnConstruction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF07080A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          "Page bientôt disponible 🚧",
          style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
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
  Set<String> _favoris = {};
  List<Map<String, dynamic>> _tousLesLieux = [];

  // Gestion de la pile d'historique pour le retour
  final List<String> _historiqueFiltres = [];

  String get _cleStockage => widget.isEnglish ? 'mes_favoris_en' : 'mes_favoris_fr';

  @override
  void initState() {
    super.initState();
    _filtreActif = widget.filtreInitial;
    _historiqueFiltres.add(_filtreActif); // Initialisation avec le premier filtre
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
    if (_filtreActif.contains('Eaux')) return const Color(0xFF40E0D0);
    if (_filtreActif.contains('Monuments')) return const Color(0xFFD4AF37);
    if (_filtreActif.contains('Panoramas')) return const Color(0xFFBA4A00);
    if (_filtreActif.contains('Calanques')) return const Color(0xFF0E6251);
    if (_filtreActif.contains('aventure')) return const Color(0xFFB03A2E);
    if (_filtreActif.contains('détendre')) return const Color(0xFF2ECC71);
    if (_filtreActif.contains('Favoris')) return Colors.redAccent;
    if (_filtreActif.contains('Jeux')) return Colors.purpleAccent;
    return const Color(0xFF1F3A60);
  }

  void _presenterLieu(int index, {required List<Map<String, dynamic>> listeCible}) {
    int nextIndex = (index + 1) % listeCible.length;
    final lieu = listeCible[index];

    // Utilisation de showGeneralDialog avec Duration.zero pour supprimer l'animation
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black54,
      transitionDuration: Duration.zero,
      pageBuilder: (context, animation, secondaryAnimation) => StatefulBuilder(
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
                          Text("${lieu['desc']} Explorez chaque angle de ce site unique au cœur de la nature, une véritable merveille cachée du patrimoine français.",
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
                              child: Text("Découvrir l'endroit", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 14)),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _modalAction(Icons.explore_outlined, "Explorer", () {
                                Navigator.pop(context);
                                Navigator.push(context, _routeSansAnimation(lieu['page']));
                              }),
                              _modalAction(estFavori ? Icons.favorite : Icons.favorite_border, "Favoris", () {
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
                            label: Text("SUIVANT", style: GoogleFonts.montserrat(letterSpacing: 1.5, color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold)),
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
          backgroundColor: const Color(0xFF131518),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text("Destination Mystère ✨", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
              IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.close, color: Colors.white38, size: 20), onPressed: () => Navigator.pop(context)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("L'itinéraire s'adapte ! On vous emmène à :", style: GoogleFonts.montserrat(color: Colors.white60, fontSize: 13)),
              const SizedBox(height: 16),
              Text(random['nom'], textAlign: TextAlign.center, style: GoogleFonts.montserrat(fontSize: 20, color: random['couleur'], fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            TextButton(onPressed: () { Navigator.pop(context); showRandom(); }, child: Text("Autre endroit", style: GoogleFonts.montserrat(color: Colors.white54))),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: random['couleur'], elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { Navigator.pop(context); Navigator.push(context, _routeSansAnimation(random['page'])); }, child: Text("Y aller", style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.bold)))
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
        {'nom': 'Sentier des ocres 🏜️', 'image': 'assets/images/20190528-165859-largejpg.jpg', 'desc': 'Un air de Colorado (USA) en Provence.', 'couleur': const Color(0xFFE2725B), 'page': const SentierDesOcresPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🌅 Lever du soleil', '📸 Spots Instagram', '🔭 Vue panoramique']},
        {'nom': "Les orgues d'Ille ⛰️", 'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg', 'desc': 'Un air de Cappadoce en Pyrénées-Orientales.', 'couleur': const Color(0xFFD35400), 'page': const OrguesIlleSurTetPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🌇 Coucher du soleil', '📸 Spots Instagram']},
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
        {'nom': 'Île de la Vierge 🏝️', 'image': 'assets/images/crique-ile-vierge-crozon.jpg', 'desc': 'Des airs de Caraïbes caches en Bretagne.', 'couleur': const Color(0xFF34A1AF), 'page': const IleDeLaViergePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌅 Lever du soleil', '📸 Spots Instagram']},
        {'nom': 'Gorges du Fier 🌉', 'image': 'assets/images/gorges-du-fier-annecy-15.jpg', 'desc': 'Le Caminito del Rey de Haute-Savoie.', 'couleur': const Color(0xFF95A5A6), 'page': const GorgesDuFierPage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Cascades des Tufs 💧', 'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg', 'desc': 'Un air de Bali (Indonésie) dans le Jura.', 'couleur': const Color(0xFF2ECC71), 'page': const CascadesDesTufsPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Méandre de Queuille 🌿', 'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg', 'desc': 'L\'Amazonie auvergnate vue d\'en haut.', 'couleur': const Color(0xFF27AE60), 'page': const MeandreQueuillePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌅 Lever du soleil', '🔭 Vue panoramique']},
        {'nom': "Lac de l'Orceyrette 🇨🇦", 'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg', 'desc': 'Un air de Canada sauvage dans les Alpes.', 'couleur': const Color(0xFF5FA1DE), 'page': const LacOrceyrettePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🔭 Vue panoramique']},
        {'nom': 'Lac d\'Allos 🇳🇴', 'image': 'assets/images/19.jpg', 'desc': 'Un air de Norvège dans les Alpes françaises.', 'couleur': const Color(0xFF2980B9), 'page': const LacDAllosPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Plateau des 1000 Étangs 🇫🇮', 'image': 'assets/image/4.jpg', 'desc': 'La « Petite Finlande », étendue sauvage au cœur des Vosges.', 'couleur': const Color(0xFF2980B9), 'page': const PlateauMilleEtangsPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🤠 Je veux une aventure']},
        {'nom': 'Gorges de Nouailles 🛶', 'image': 'assets/image/7.jpg', 'desc': 'Gorges vertigineuses creusées par la Loue.', 'couleur': const Color(0xFF1ABC9C), 'page': const GorgesNouaillesPage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Les 4 lacs 🏴󠁧󠁢󠁳󠁣󠁴󠁿', 'image': 'assets/image/16.jpg', 'desc': 'La Petite Écosse du Jura.', 'couleur': const Color(0xFF2E86C1), 'page': const QuatreLacsPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🔭 Vue panoramique']},
        {'nom': 'Pont d’Arc 🇧🇦', 'image': 'assets/image/19.webp', 'desc': 'Un air de Bosnie-Herzégovine sur l\'Ardèche.', 'couleur': const Color(0xFF16A085), 'page': const PontDArcPage(), 'caracteristiques': ['🤠 Je veux une aventure', '📸 Spots Instagram']},
        {'nom': 'Lac d’Ôo 💧', 'image': 'assets/imag/1.jpg', 'desc': 'Majestueux lac de montagne et sa grande cascade.', 'couleur': const Color(0xFF5DADE2), 'page': const LacDooPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Lac de Capitello 🏔️', 'image': 'assets/imag/6.webp', 'desc': 'Joyau glaciaire perched en Corse.', 'couleur': const Color(0xFF2874A6), 'page': const LacDeCapitelloPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Le Marais Poitevin 🚣', 'image': 'assets/imag/10.jpg', 'desc': 'La Venise Verte : réseau de canaux sous une voûte de verdure.', 'couleur': const Color(0xFF27AE60), 'page': const LeMaraisPoitevinPage(), 'caracteristiques': ['🧘 Je veux me détendre']},
        {'nom': 'Lac d’Annecy 🦢', 'image': 'assets/imag/17.jpg', 'desc': 'Les eaux les plus pures d\'Europe.', 'couleur': const Color(0xFF3498DB), 'page': const LacDAnnecyPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Sillans-la-Cascade 🌴', 'image': 'assets/imag/23.jpg', 'desc': 'Un lagon tropical en plein Var.', 'couleur': const Color(0xFF48C9B0), 'page': const SillansLaCascadePage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Cascades du Hérisson 💦', 'image': 'assets/imag/25.jpg', 'desc': 'Une vallée magique jalonnée de sauts d\'eau.', 'couleur': const Color(0xFF117A65), 'page': const CascadesDuHerissonPage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Lac bleu 💙', 'image': 'assets/imag/29.jpg', 'desc': 'Un écrin de pureté aux eaux cristallines.', 'couleur': const Color(0xFF5DADE2), 'page': const LacBleuPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Gorges du Tarn 🦅', 'image': 'assets/imag/38.webp', 'desc': 'Canyon vertigineux au cœur des Causses.', 'couleur': const Color(0xFF2E86C1), 'page': const GorgesDuTarnPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']}
      ]
    },
    {
      'titre': '🏛️ Parcs & Monuments Insolites',
      'tag': 'Monuments',
      'lieux': [
        {'nom': 'Buttes-Chaumont 🦢', 'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg', 'desc': 'Temple romantique au cœur de Paris.', 'couleur': const Color(0xFF34495E), 'page': const ButtesChaumontPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil']},
        {'nom': 'Palais Idéal 🏯', 'image': 'assets/images/facteur-cheval.jpg', 'desc': 'Temple d\'Asie mystique dans la Drôme.', 'couleur': const Color(0xFF9A7D0A), 'page': const PalaisIdealPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram']},
        {'nom': 'Parc Monceau ⛲', 'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg', 'desc': 'Élégance à l\'italienne en plein Paris.', 'couleur': const Color(0xFFD4AF37), 'page': const ParcMonceauPage(), 'caracteristiques': ['🧘 Je veux me détendre']},
        {'nom': 'Foret Fontainebleau 🌲', 'image': 'assets/images/foret-de-fontainebleau.jpg', 'desc': 'Forêt scandinave aux portes de Paris.', 'couleur': const Color(0xFF196F3D), 'page': const ForetFontainebleauPage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Chemin des Cimes 🌳', 'image': 'assets/images/88.jpg', 'desc': 'Promenade dans la canopée alsacienne.', 'couleur': const Color(0xFF229954), 'page': const CheminCimesAlsacePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🔭 Vue panoramique']},
        {'nom': 'Mont Saint-Michel 🏰', 'image': 'assets/image/24.webp', 'desc': 'Merveille de l\'Occident posée sur l\'eau.', 'couleur': const Color(0xFF7F8C8D), 'page': const MontSaintMichelPage(), 'caracteristiques': ['📸 Spots Instagram', '🌇 Coucher du soleil']},
        {'nom': 'Forêt de Brocéliande 🧙‍♂️', 'image': 'assets/image/51.jpg', 'desc': 'Lieu mythique des légendes du Roi Arthur.', 'couleur': const Color(0xFF1E8449), 'page': const ForetDeBroceliandePage(), 'caracteristiques': ['🤠 Je veux une aventure']},
        {'nom': 'Le Gouffre de Padirac 🕳️', 'image': 'assets/image/58.jpg', 'desc': 'Une plongée fantastique au centre de la Terre.', 'couleur': const Color(0xFF34495E), 'page': const LeGouffreDePadiracPage(), 'caracteristiques': ['🤠 Je veux une aventure']}
      ]
    },
    {
      'titre': '🌋 Panoramas Uniques',
      'tag': 'Panoramas',
      'lieux': [
        {'nom': 'Puy de Dôme 🌋', 'image': 'assets/images/dome.webp', 'desc': 'Oui, la France possède bien des volcans !', 'couleur': const Color(0xFFBA4A00), 'page': const PuyDeDomePage(), 'caracteristiques': ['🤠 Je veux une aventure', '🌅 Lever du soleil', '🔭 Vue panoramique']},
        {'nom': 'Pont du Gard 🏛️', 'image': 'assets/images/pont.webp', 'desc': 'Chef-d\'œuvre antique grandiose.', 'couleur': const Color(0xFF2E4053), 'page': const PontDuGardPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '🔭 Vue panoramique']},
        {'nom': 'Marais d\'Aigues-Mortes 🧂', 'image': 'assets/images/5.jpg', 'desc': 'Des salines aux reflets de Bolivie.', 'couleur': const Color(0xFFE6B800), 'page': const MaraisSalantsAiguesMortesPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '📸 Spots Instagram']},
        {'nom': 'Étretat 🌊', 'image': 'assets/imag/33.webp', 'desc': 'Falaises de craie majestueuses sur la Manche.', 'couleur': const Color(0xFF5D6D7E), 'page': const EtretatPage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '🔭 Vue panoramique']},
        {'nom': 'Le Mont-Blanc 🏔️', 'image': 'assets/imag/41.jpg', 'desc': 'Le toit majestueux de l\'Europe.', 'couleur': const Color(0xFFD6DBDF), 'page': const MontBlancPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Montagne Sainte-Victoire ⛰️', 'image': 'assets/ima/1.png', 'desc': 'La muse de Cézanne aux portes d\'Aix.', 'couleur': const Color(0xFF839192), 'page': const MontagneSainteVictoirePage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'La Camargue 🦩', 'image': 'assets/ima/5.webp', 'desc': 'Terres sauvages, chevaux blancs et flamants roses.', 'couleur': const Color(0xFFE59866), 'page': const LaCamarguePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil']},
        {'nom': 'Massif de l’Estérel 🌋', 'image': 'assets/ima/11.jpg', 'desc': 'Roches rouges plongeant dans la Méditerranée.', 'couleur': const Color(0xFFCB4335), 'page': const MassifEsterelPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique', '📸 Spots Instagram']},
        {'nom': 'Aiguilles de Bavella ⛰️', 'image': 'assets/ima/19.jpg', 'desc': 'Les pics acérés de la Corse du Sud.', 'couleur': const Color(0xFF99A3A4), 'page': const AiguillesBavellaPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Pic du Canigou 🏔️', 'image': 'assets/ima/24.jpg', 'desc': 'La montagne sacrée des Catalans.', 'couleur': const Color(0xFF873600), 'page': const PicCanigouPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'Cirque de Navacelles 🌀', 'image': 'assets/ima/28.jpg', 'desc': 'Un méandre spectaculaire creusé dans le calcaire.', 'couleur': const Color(0xFF52BE80), 'page': const CirqueNavacellesPage(), 'caracteristiques': ['🔭 Vue panoramique']},
        {'nom': 'Dentelles de Montmirail 🏔️', 'image': 'assets/ima/33.jpg', 'desc': 'Crêtes ciselées au cœur de la Provence.', 'couleur': const Color(0xFF909497), 'page': const DentellesMontmirailPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique']},
        {'nom': 'La Côte de Granit Rose 🪨', 'image': 'assets/ima/38.jpg', 'desc': 'Chaos rocheux aux teintes magiques en Bretagne.', 'couleur': const Color(0xFFF1948A), 'page': const CoteGranitRosePage(), 'caracteristiques': ['🧘 Je veux me détendre', '🌇 Coucher du soleil', '📸 Spots Instagram']},
        {'nom': 'Réserve de Scandola 🦅', 'image': 'assets/ima/43.webp', 'desc': 'Joyau volcanique et marin préservé de Corse.', 'couleur': const Color(0xFFC0392B), 'page': const ReserveScandolaPage(), 'caracteristiques': ['🤠 Je veux une aventure', '🔭 Vue panoramique', '📸 Spots Instagram']}

      ]
    },
    {
      'titre': '🌊 Les Calanques de France',
      'tag': 'Calanques',
      'lieux': [
        {'nom': 'Calanque de Sugiton 🌊', 'image': 'assets/images/sugiton.jpg', 'desc': 'Falaises blanches et eaux turquoise en Méditerranée.', 'couleur': const Color(0xFF0E6251), 'page': const CalanqueDeSugitonPage(), 'caracteristiques': ['🧘 Je veux me détendre', '📸 Spots Instagram', '🔭 Vue panoramique']},
        {'nom': 'Calanques de Cassis 🚤', 'image': 'assets/image/33.webp', 'desc': 'Des fjords méditerranéens spectaculaires.', 'couleur': const Color(0xFF1ABC9C), 'page': const CalanquesDeCassisPage(), 'caracteristiques': ['🤠 Je veux une aventure', '📸 Spots Instagram']},
        {'nom': 'Calanques de Piana 🌋', 'image': 'assets/image/41.webp', 'desc': 'Roches rouge feu sculptées plongeant dans la mer.', 'couleur': const Color(0xFFE74C3C), 'page': const CalanquesDePianaPage(), 'caracteristiques': ['🌇 Coucher du soleil', '📸 Spots Instagram', '🔭 Vue panoramique']}
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
        if (tag.contains('Jeux')) {
          Navigator.push(context, _routeSansAnimation(const JeuPage(isEnglish: false)));
        } else if (tag != _filtreActif) {
          // MODIFICATION ICI : On ajoute le nouveau filtre dans la pile historique
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

        // MODIFICATION ICI : Gestion de la navigation "Retour" par historique
        if (_historiqueFiltres.length > 1) {
          setState(() {
            _historiqueFiltres.removeLast(); // On enlève le filtre actuel
            _filtreActif = _historiqueFiltres.last; // On revient au précédent
          });
        } else {
          // Si on est à la fin de l'historique (Tout), on quitte la page
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
              left: _filtreActif == 'Tout' ? -80 : 120,
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
                  title: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("France Secrète", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 4.0, fontSize: 22)),
                  ),
                  actions: [IconButton(icon: const Icon(Icons.casino_outlined, color: Colors.white), onPressed: _lancerRoulette)],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionLabel("🏜️ Catégories"),
                      SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildChipFiltre('Tout'),
                            _buildChipFiltre('🏜️ Canyons '),
                            _buildChipFiltre('🛶 Eaux '),
                            _buildChipFiltre('🏛️ Monuments '),
                            _buildChipFiltre('🌋 Panoramas'),
                            _buildChipFiltre('🌊 Calanques'),
                          ],
                        ),
                      ),
                      _buildSectionLabel("🧘 Vos Envies"),
                      SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildChipFiltre('🧘 Je veux me détendre'),
                            _buildChipFiltre('🤠 Je veux une aventure'),
                            _buildChipFiltre('🌅 Lever du soleil'),
                            _buildChipFiltre('🌇 Coucher du soleil'),
                            _buildChipFiltre('📸 Spots Instagram'),
                            _buildChipFiltre('🔭 Vue panoramique'),
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
                                  Text("❤️ ACCÈS RAPIDE", style: GoogleFonts.montserrat(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                  const SizedBox(height: 6),
                                  SizedBox(width: double.infinity, child: _buildChipFiltre('❤️ Favoris')),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("🎮 DIVERTISSEMENT", style: GoogleFonts.montserrat(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                  const SizedBox(height: 6),
                                  SizedBox(width: double.infinity, child: _buildChipFiltre('🎮 Jeux')),
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
                        if (_filtreActif.contains('Favoris')) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.favorite_border_rounded, size: 50, color: Colors.white24),
                                const SizedBox(height: 16),
                                Text("Votre carnet est vide", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 6),
                                Text("Ajoutez vos lieux préférés en cliquant sur le cœur.", style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 12)),
                              ],
                            ),
                          );
                        } else {
                          return SizedBox(
                              height: 200,
                              child: Center(child: Text("Aucun lieu trouvé", style: GoogleFonts.montserrat(color: Colors.white38)))
                          );
                        }
                      }
                      final theme = themesFiltres[index];
                      final List lieux = theme['lieux'] ?? [];
                      if (_filtreActif == 'Tout') {
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