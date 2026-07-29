import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'questions arabe.dart';
import 'jeu_page.dart';

import 'arabia/sentier_des_ocres.dart';
import 'arabia/ile_de_la_vierge.dart';
import 'arabia/altschlossfelsen.dart';
import 'arabia/lac_de_lorceyrette.dart';
import 'arabia/parc_monceau.dart';
import 'arabia/gorges_du_fier.dart';
import 'arabia/palais_ideal.dart';
import 'arabia/foret_fontainebleau.dart';
import 'arabia/buttes_chaumont.dart';
import 'arabia/les_orgues_d_ille_sur_tet.dart';
import 'arabia/les_cascades_des_tufs.dart';
import 'arabia/le_desert_du_rougier_de_camar_s.dart';
import 'arabia/les_gorges_du_verdon.dart';
import 'arabia/le_meandre_de_queuille.dart';
import 'arabia/la_dune_du_pilat.dart';
import 'arabia/puy_de_dome.dart';
import 'arabia/pont_du_gard.dart';
import 'arabia/lac_d_allos.dart';
import 'arabia/marais_salants_aigues_mortes.dart';
import 'arabia/alsace.dart';
import 'arabia/calanque_de_sugiton.dart';
import 'arabia bis/Plateau des 1000 Étangs.dart';
import 'arabia bis/Gorges de Nouailles.dart';
import 'arabia bis/Les 4 lacs.dart';
import 'arabia bis/Pont d’Arc.dart';
import 'arabia bis/Mont Saint-Michel.dart';
import 'arabia bis/Calanques de Cassis.dart';
import 'arabia bis/CalanquesDePianaPage.dart';
import 'arabia bis/Le Gouffre de Padirac.dart';
import 'arabia bis/Forêt de Brocéliande.dart';
import 'arabia bis/Lac d’Ôo.dart';
import 'arabia bis/Lac de Capitello.dart';
import 'arabia bis/Le Marais Poitevin.dart';
import 'arabia bis/Lac bleu.dart';
import 'arabia bis/Lac d’Annecy.dart';
import 'arabia bis/Cascades du Hérisson.dart';
import 'arabia bis/Gorges du Tarn.dart';
import 'arabia bis/Sillans-la-Cascade.dart';
import 'arabia bis/Étretat.dart';
import 'arabia bis/Le Mont-Blanc.dart';
import 'arabia bis/Montagne Sainte-Victoire.dart';
import 'arabia bis/La Camargue.dart';
import 'arabia bis/Massif de l’Estérel.dart';
import 'arabia bis/Aiguilles de Bavella.dart';
import 'arabia bis/Pic du Canigou.dart';
import 'arabia bis/Cirque de Navacelles.dart';
import 'arabia bis/Dentelles de Montmirail.dart';
import 'arabia bis/Réserve de Scandola.dart';
import 'arabia bis/La Côte de Granit Rose.dart';


PageRouteBuilder _routeSansAnimation(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}

class FranceSecretePage extends StatefulWidget {
  final bool isArabic;
  final String filtreInitial;

  const FranceSecretePage({Key? key, this.isArabic = true, this.filtreInitial = 'الكل'}) : super(key: key);

  @override
  State<FranceSecretePage> createState() => _FranceSecretePageState();
}

class _FranceSecretePageState extends State<FranceSecretePage> {
  late String _filtreActif;
  Set<String> _favoris = {};
  List<Map<String, dynamic>> _tousLesLieux = [];

  final List<String> _historiqueFiltres = [];

  String get _cleStockage => widget.isArabic ? 'mes_favoris_ar' : 'mes_favoris_fr';

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
    if (_filtreActif.contains('أودية')) return const Color(0xFFE2725B);
    if (_filtreActif.contains('مياه')) return const Color(0xFF40E0D0);
    if (_filtreActif.contains('معالم')) return const Color(0xFFD4AF37);
    if (_filtreActif.contains('مناظر')) return const Color(0xFFBA4A00);
    if (_filtreActif.contains('خلجان')) return const Color(0xFF0E6251);
    if (_filtreActif.contains('مغامرة')) return const Color(0xFFB03A2E);
    if (_filtreActif.contains('استرخاء')) return const Color(0xFF2ECC71);
    if (_filtreActif.contains('المفضلة')) return Colors.redAccent;
    if (_filtreActif.contains('ألعاب')) return Colors.purpleAccent;
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
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
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
                            top: 16, left: 16,
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
                                style: GoogleFonts.cairo(color: lieu['couleur'], fontWeight: FontWeight.bold, fontSize: 20)),
                            const SizedBox(height: 12),
                            Text("${lieu['desc']} اكتشف كل زوايا هذا الموقع الفريد في قلب الطبيعة، جوهرة مخفية من التراث.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(color: Colors.white.withOpacity(0.65), fontSize: 13, height: 1.6)),

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
                                child: Text("اكتشف المكان", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, fontSize: 14)),
                              ),
                            ),

                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _modalAction(Icons.explore_outlined, "استكشاف", () {
                                  Navigator.pop(context);
                                  Navigator.push(context, _routeSansAnimation(lieu['page']));
                                }),
                                _modalAction(estFavori ? Icons.favorite : Icons.favorite_border, "المفضلة", () {
                                  _toggleFavori(lieu['nom']);
                                  setModalState(() {});
                                  setState(() {});
                                }, color: estFavori ? Colors.redAccent : Colors.white70),
                                _modalAction(Icons.map_outlined, "الخريطة", () => _ouvrirMaps(lieu['nom'])),
                              ],
                            ),

                            const SizedBox(height: 16),
                            const Divider(color: Colors.white10),

                            TextButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                                _presenterLieu(nextIndex, listeCible: listeCible);
                              },
                              icon: const Icon(Icons.arrow_back_ios, size: 14, color: Colors.white60),
                              label: Text("التالي", style: GoogleFonts.cairo(color: Colors.white60, fontSize: 11, fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
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
            Text(label, style: GoogleFonts.cairo(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  void _lancerRoulette() {
    List<Map<String, dynamic>> lieuxDisponibles = [];
    if (_filtreActif == 'الكل' || _filtreActif.contains('المفضلة') || _filtreActif.contains('ألعاب')) {
      lieuxDisponibles = _tousLesLieux;
    } else if (_filtreActif.contains('أودية') || _filtreActif.contains('مياه') || _filtreActif.contains('معالم') || _filtreActif.contains('مناظر') || _filtreActif.contains('خلجان')) {
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
        pageBuilder: (context, animation1, animation2) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: const Color(0xFF131518),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("وجهة غامضة ✨", style: GoogleFonts.cairo(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
                IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.close, color: Colors.white38, size: 20), onPressed: () => Navigator.pop(context)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("المسار يتكيف! لنذهب إلى:", style: GoogleFonts.cairo(color: Colors.white60, fontSize: 13)),
                const SizedBox(height: 16),
                Text(random['nom'], textAlign: TextAlign.center, style: GoogleFonts.cairo(fontSize: 20, color: random['couleur'], fontWeight: FontWeight.bold)),
              ],
            ),
            actions: [
              TextButton(onPressed: () { Navigator.pop(context); showRandom(); }, child: Text("مكان آخر", style: GoogleFonts.cairo(color: Colors.white54))),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: random['couleur'], elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { Navigator.pop(context); Navigator.push(context, _routeSansAnimation(random['page'])); }, child: Text("اذهب إلى هناك", style: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      );
    }
    showRandom();
  }

  final List<Map<String, dynamic>> themes = [
    {
      'titre': '🏜️ أجواء الأخاديد والصحاري',
      'tag': 'أخاديد',
      'lieux': [
        {'nom': 'مسار المغرة 🏜️', 'image': 'assets/images/20190528-165859-largejpg.jpg', 'desc': 'أجواء كولورادو (الولايات المتحدة) في بروفانس.', 'couleur': const Color(0xFFE2725B), 'page': const SentierDesOcresPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🌅 شروق الشمس', '📸 أماكن إنستغرام', '🔭 إطلالة بانورامية']},
        {'nom': 'أعمدة إيل سور تيت ⛰️', 'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg', 'desc': 'أجواء كابادوكيا في جبال البرانس الشرقية.', 'couleur': const Color(0xFFD35400), 'page': const OrguesIlleSurTetPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🌇 غروب الشمس', '📸 أماكن إنستغرام']},
        {'nom': 'روجييه دي كاماريس 🤠', 'image': 'assets/images/45.jpg', 'desc': 'الغرب الأمريكي في قلب أفيرون.', 'couleur': const Color(0xFFB03A2E), 'page': const RougierCamaresPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'ألتشلوسفيلسن 🧗', 'image': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg', 'desc': 'أخدود أريزونا الصغير في موزيل.', 'couleur': const Color(0xFFC0392B), 'page': const AltschlossfelsenPage(), 'caracteristiques': ['🤠 أريد مغامرة', '📸 أماكن إنستغرام']},
        {'nom': 'كثبان بيلات 🐪', 'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg', 'desc': 'أجواء الصحراء الكبرى أمام المحيط الأطلسي.', 'couleur': const Color(0xFFD4AC0D), 'page': const DuneDuPilatPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '🔭 إطلالة بانورامية', '📸 أماكن إنستغرام']}
      ]
    },
    {
      'titre': '🛶 مضايق ومياه فيروزية',
      'tag': 'مياه',
      'lieux': [
        {'nom': 'مضايق فيردون 🛶', 'image': 'assets/images/VERDON.jpg', 'desc': 'الوادي العظيم الأوروبي ومياهه الفيروزية.', 'couleur': const Color(0xFF40E0D0), 'page': const GorgesDuVerdonPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية', '📸 أماكن إنستغرام']},
        {'nom': 'جزيرة العذراء 🏝️', 'image': 'assets/images/crique-ile-vierge-crozon.jpg', 'desc': 'أجواء الكاريبي الخفية في بريتاني.', 'couleur': const Color(0xFF34A1AF), 'page': const IleDeLaViergePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌅 شروق الشمس', '📸 أماكن إنستغرام']},
        {'nom': 'مضايق فيير 🌉', 'image': 'assets/images/gorges-du-fier-annecy-15.jpg', 'desc': 'كامينيتو ديل ري في هوت سافوا.', 'couleur': const Color(0xFF95A5A6), 'page': const GorgesDuFierPage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'شلالات توف 💧', 'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg', 'desc': 'أجواء بالي (إندونيسيا) في جورا.', 'couleur': const Color(0xFF2ECC71), 'page': const CascadesDesTufsPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 أماكن إنستغرام']},
        {'nom': 'منعطف كوي 🌿', 'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg', 'desc': 'أمازون أوفيرني من الأعلى.', 'couleur': const Color(0xFF27AE60), 'page': const MeandreQueuillePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌅 شروق الشمس', '🔭 إطلالة بانورامية']},
        {'nom': 'بحيرة أورسيريت 🇨🇦', 'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg', 'desc': 'أجواء كندا البرية في جبال الألب.', 'couleur': const Color(0xFF5FA1DE), 'page': const LacOrceyrettePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🔭 إطلالة بانورامية']},
        {'nom': 'بحيرة ألو 🇳🇴', 'image': 'assets/images/19.jpg', 'desc': 'أجواء النرويج في جبال الألب الفرنسية.', 'couleur': const Color(0xFF2980B9), 'page': const LacDAllosPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'هضبة الألف بركة 🇫🇮', 'image': 'assets/image/4.jpg', 'desc': '«فنلندا الصغيرة»، امتداد بري في قلب جبال الفوج.', 'couleur': const Color(0xFF2980B9), 'page': const PlateauMilleEtangsPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🤠 أريد مغامرة']},
        {'nom': 'مضايق نواي 🛶', 'image': 'assets/image/7.jpg', 'desc': 'مضايق شاهقة حفرها نهر لو.', 'couleur': const Color(0xFF1ABC9C), 'page': const GorgesNouaillesPage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'البحيرات الأربع 🏴󠁧󠁢󠁳󠁣󠁴󠁿', 'image': 'assets/image/16.jpg', 'desc': 'اسكتلندا الصغيرة في جورا.', 'couleur': const Color(0xFF2E86C1), 'page': const QuatreLacsPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🔭 إطلالة بانورامية']},
        {'nom': 'بون دارك 🇧🇦', 'image': 'assets/image/19.webp', 'desc': 'أجواء البوسنة والهرسك على نهر الأرديش.', 'couleur': const Color(0xFF16A085), 'page': const PontDArcPage(), 'caracteristiques': ['🤠 أريد مغامرة', '📸 أماكن إنستغرام']},
        {'nom': 'بحيرة أو 💧', 'image': 'assets/imag/1.jpg', 'desc': 'بحيرة جبلية مهيبة وشلالها الكبير.', 'couleur': const Color(0xFF5DADE2), 'page': const LacDooPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'بحيرة كابيتيلو 🏔️', 'image': 'assets/imag/6.webp', 'desc': 'جوهرة جليدية معلقة في كورسيكا.', 'couleur': const Color(0xFF2874A6), 'page': const LacDeCapitelloPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'مستنقعات بواتوفان 🚣', 'image': 'assets/imag/10.jpg', 'desc': 'البندقية الخضراء: شبكة قنوات تحت قبة من المساحات الخضراء.', 'couleur': const Color(0xFF27AE60), 'page': const LeMaraisPoitevinPage(), 'caracteristiques': ['🧘 أريد الاسترخاء']},
        {'nom': 'بحيرة أنسي 🦢', 'image': 'assets/imag/17.jpg', 'desc': 'أنقى المياه في أوروبا.', 'couleur': const Color(0xFF3498DB), 'page': const LacDAnnecyPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 أماكن إنستغرام']},
        {'nom': 'سيلان لا كاسكاد 🌴', 'image': 'assets/imag/23.jpg', 'desc': 'بحيرة استوائية في قلب فار.', 'couleur': const Color(0xFF48C9B0), 'page': const SillansLaCascadePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 أماكن إنستغرام']},
        {'nom': 'شلالات هيريسون 💦', 'image': 'assets/imag/25.jpg', 'desc': 'وادٍ سحري مليء بمساقط المياه.', 'couleur': const Color(0xFF117A65), 'page': const CascadesDuHerissonPage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'البحيرة الزرقاء 💙', 'image': 'assets/imag/29.jpg', 'desc': 'صندوق جوهر النقاء بمياه بلورية.', 'couleur': const Color(0xFF5DADE2), 'page': const LacBleuPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 أماكن إنستغرام']},
        {'nom': 'مضايق تارن 🦅', 'image': 'assets/imag/38.webp', 'desc': 'أخدود مذهل في قلب كوس.', 'couleur': const Color(0xFF2E86C1), 'page': const GorgesDuTarnPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']}
      ]
    },
    {
      'titre': '🏛️ حدائق ومعالم استثنائية',
      'tag': 'معالم',
      'lieux': [
        {'nom': 'بوت شومون 🦢', 'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg', 'desc': 'معبد رومانسي في قلب باريس.', 'couleur': const Color(0xFF34495E), 'page': const ButtesChaumontPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس']},
        {'nom': 'القصر المثالي 🏯', 'image': 'assets/images/facteur-cheval.jpg', 'desc': 'معبد آسيوي غامض في دروم.', 'couleur': const Color(0xFF9A7D0A), 'page': const PalaisIdealPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 أماكن إنستغرام']},
        {'nom': 'حديقة مونسو ⛲', 'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg', 'desc': 'أناقة إيطالية في قلب باريس.', 'couleur': const Color(0xFFD4AF37), 'page': const ParcMonceauPage(), 'caracteristiques': ['🧘 أريد الاسترخاء']},
        {'nom': 'غابة فونتينبلو 🌲', 'image': 'assets/images/foret-de-fontainebleau.jpg', 'desc': 'غابة إسكندنافية على أبواب باريس.', 'couleur': const Color(0xFF196F3D), 'page': const ForetFontainebleauPage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'مسار القمم 🌳', 'image': 'assets/images/88.jpg', 'desc': 'نزهة في مظلة غابات الألزاس.', 'couleur': const Color(0xFF229954), 'page': const CheminCimesAlsacePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🔭 إطلالة بانورامية']},
        {'nom': 'جبل القديس ميشيل 🏰', 'image': 'assets/image/24.webp', 'desc': 'أعجوبة الغرب الموضوعة على الماء.', 'couleur': const Color(0xFF7F8C8D), 'page': const MontSaintMichelPage(), 'caracteristiques': ['📸 أماكن إنستغرام', '🌇 غروب الشمس']},
        {'nom': 'غابة بروسيلياند 🧙‍♂️', 'image': 'assets/image/51.jpg', 'desc': 'مكان أسطوري لحكايات الملك آرثر.', 'couleur': const Color(0xFF1E8449), 'page': const ForetDeBroceliandePage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'كهف باديرك 🕳️', 'image': 'assets/image/58.jpg', 'desc': 'غوص رائع في مركز الأرض.', 'couleur': const Color(0xFF34495E), 'page': const LeGouffreDePadiracPage(), 'caracteristiques': ['🤠 أريد مغامرة']}
      ]
    },
    {
      'titre': '🌋 مناظر بانورامية فريدة',
      'tag': 'بانوراما',
      'lieux': [
        {'nom': 'بوي دي دوم 🌋', 'image': 'assets/images/dome.webp', 'desc': 'نعم، فرنسا تمتلك بالفعل براكين!', 'couleur': const Color(0xFFBA4A00), 'page': const PuyDeDomePage(), 'caracteristiques': ['🤠 أريد مغامرة', '🌅 شروق الشمس', '🔭 إطلالة بانورامية']},
        {'nom': 'جسر غارد 🏛️', 'image': 'assets/images/pont.webp', 'desc': 'تحفة أثرية عظيمة.', 'couleur': const Color(0xFF2E4053), 'page': const PontDuGardPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '🔭 إطلالة بانورامية']},
        {'nom': 'مستنقعات إيغ مورت 🧂', 'image': 'assets/images/5.jpg', 'desc': 'ملاحات بانعكاسات بوليفيا.', 'couleur': const Color(0xFFE6B800), 'page': const MaraisSalantsAiguesMortesPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '📸 أماكن إنستغرام']},
        {'nom': 'إتريتات 🌊', 'image': 'assets/imag/33.webp', 'desc': 'منحدرات طباشيرية مهيبة على القناة الإنجليزية.', 'couleur': const Color(0xFF5D6D7E), 'page': const EtretatPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '🔭 إطلالة بانورامية']},
        {'nom': 'مون بلان 🏔️', 'image': 'assets/imag/41.jpg', 'desc': 'سقف أوروبا المهيب.', 'couleur': const Color(0xFFD6DBDF), 'page': const MontBlancPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'جبل سانت فيكتوار ⛰️', 'image': 'assets/ima/1.png', 'desc': 'ملهمة سيزان على أبواب إيكس.', 'couleur': const Color(0xFF839192), 'page': const MontagneSainteVictoirePage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'كامارغ 🦩', 'image': 'assets/ima/5.webp', 'desc': 'أراضٍ برية، خيول بيضاء وطيور النحام الوردي.', 'couleur': const Color(0xFFE59866), 'page': const LaCamarguePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس']},
        {'nom': 'جبال إستيريل 🌋', 'image': 'assets/ima/11.jpg', 'desc': 'صخور حمراء تغوص في البحر الأبيض المتوسط.', 'couleur': const Color(0xFFCB4335), 'page': const MassifEsterelPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية', '📸 أماكن إنستغرام']},
        {'nom': 'إبر بافيلا ⛰️', 'image': 'assets/ima/19.jpg', 'desc': 'القمم الحادة لكورسيكا الجنوبية.', 'couleur': const Color(0xFF99A3A4), 'page': const AiguillesBavellaPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'قمة كانيغو 🏔️', 'image': 'assets/ima/24.jpg', 'desc': 'الجبل المقدس للكتالونيين.', 'couleur': const Color(0xFF873600), 'page': const PicCanigouPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'سيرك نافاسيل 🌀', 'image': 'assets/ima/28.jpg', 'desc': 'منعطف مذهل محفور في الحجر الجيري.', 'couleur': const Color(0xFF52BE80), 'page': const CirqueNavacellesPage(), 'caracteristiques': ['🔭 إطلالة بانورامية']},
        {'nom': 'دانتيل مونتميرايل 🏔️', 'image': 'assets/ima/33.jpg', 'desc': 'قمم منحوتة في قلب بروفانس.', 'couleur': const Color(0xFF909497), 'page': const DentellesMontmirailPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'ساحل الجرانيت الوردي 🪨', 'image': 'assets/ima/38.jpg', 'desc': 'فوضى صخرية بألوان سحرية في بريتاني.', 'couleur': const Color(0xFFF1948A), 'page': const CoteGranitRosePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '📸 أماكن إنستغرام']},
        {'nom': 'محمية سكاندولا 🦅', 'image': 'assets/ima/43.webp', 'desc': 'جوهرة بركانية وبحرية محفوظة في كورسيكا.', 'couleur': const Color(0xFFC0392B), 'page': const ReserveScandolaPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية', '📸 أماكن إنستغرام']}
      ]
    },
    {
      'titre': '🌊 الخلجان الفرنسية (Les Calanques)',
      'tag': 'خلجان',
      'lieux': [
        {'nom': 'خليج سوجيتون 🌊', 'image': 'assets/images/sugiton.jpg', 'desc': 'منحدرات بيضاء ومياه فيروزية في البحر الأبيض المتوسط.', 'couleur': const Color(0xFF0E6251), 'page': const CalanqueDeSugitonPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 أماكن إنستغرام', '🔭 إطلالة بانورامية']},
        {'nom': 'خلجان كاسيس 🚤', 'image': 'assets/image/33.webp', 'desc': 'مضايق بحرية مذهلة في البحر الأبيض المتوسط.', 'couleur': const Color(0xFF1ABC9C), 'page': const CalanquesDeCassisPage(), 'caracteristiques': ['🤠 أريد مغامرة', '📸 أماكن إنستغرام']},
        {'nom': 'خلجان بيانا 🌋', 'image': 'assets/image/41.webp', 'desc': 'صخور حمراء نارية منحوتة تغوص في البحر.', 'couleur': const Color(0xFFE74C3C), 'page': const CalanquesDePianaPage(), 'caracteristiques': ['🌇 غروب الشمس', '📸 أماكن إنستغرام', '🔭 إطلالة بانورامية']}
      ]
    }
  ];

  Widget _buildSectionLabel(String titre) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 14, bottom: 8),
      child: Text(
        titre,
        style: GoogleFonts.cairo(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }

  Widget _buildChipFiltre(String tag) {
    bool select = _filtreActif == tag;
    return GestureDetector(
      onTap: () {
        if (tag.contains('ألعاب')) {
          Navigator.push(context, _routeSansAnimation(const JeuPage(isArabic: true)));
        } else if (tag != _filtreActif) {
          setState(() {
            _filtreActif = tag;
            _historiqueFiltres.add(tag);
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(left: 8, bottom: 4, top: 4),
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
            style: GoogleFonts.cairo(
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
    if (_filtreActif == 'الكل') {
      themesFiltres = themes;
    } else if (_filtreActif.contains('المفضلة')) {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => _favoris.contains(l['nom'])).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    } else if (_filtreActif.contains('أودية') || _filtreActif.contains('مياه') || _filtreActif.contains('معالم') || _filtreActif.contains('مناظر') || _filtreActif.contains('خلجان')) {
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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
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
                right: _filtreActif == 'الكل' ? -80 : 120,
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
                left: -120,
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
                    title: Text("فرنسا السرية", style: GoogleFonts.cairo(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
                    actions: [IconButton(icon: const Icon(Icons.casino_outlined, color: Colors.white), onPressed: _lancerRoulette)],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionLabel("🏜️ الفئات"),
                        SizedBox(
                          height: 44,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            physics: const BouncingScrollPhysics(),
                            children: [
                              _buildChipFiltre('الكل'),
                              _buildChipFiltre('🏜️ أودية '),
                              _buildChipFiltre('🛶 مياه '),
                              _buildChipFiltre('🏛️ معالم '),
                              _buildChipFiltre('🌋 مناظر'),
                              _buildChipFiltre('🌊 خلجان'),
                            ],
                          ),
                        ),
                        _buildSectionLabel("🧘 رغباتك"),
                        SizedBox(
                          height: 44,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            physics: const BouncingScrollPhysics(),
                            children: [
                              _buildChipFiltre('🧘 استرخاء'),
                              _buildChipFiltre('🤠 مغامرة'),
                              _buildChipFiltre('🌅 شروق'),
                              _buildChipFiltre('🌇 غروب'),
                              _buildChipFiltre('📸 إنستغرام'),
                              _buildChipFiltre('🔭 بانوراما'),
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
                                    Text("❤️ وصول سريع", style: GoogleFonts.cairo(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                    const SizedBox(height: 6),
                                    SizedBox(width: double.infinity, child: _buildChipFiltre('❤️ المفضلة')),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("🎮 ترفيه", style: GoogleFonts.cairo(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                                    const SizedBox(height: 6),
                                    SizedBox(width: double.infinity, child: _buildChipFiltre('🎮 ألعاب')),
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
                          if (_filtreActif.contains('المفضلة')) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.favorite_border_rounded, size: 50, color: Colors.white24),
                                  const SizedBox(height: 16),
                                  Text("قائمتك فارغة", style: GoogleFonts.cairo(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6),
                                  Text("أضف أماكنك المفضلة بالضغط على القلب.", style: GoogleFonts.cairo(color: Colors.white38, fontSize: 12)),
                                ],
                              ),
                            );
                          } else {
                            return SizedBox(
                                height: 200,
                                child: Center(child: Text("لم يتم العثور على أماكن", style: GoogleFonts.cairo(color: Colors.white38)))
                            );
                          }
                        }
                        final theme = themesFiltres[index];
                        final List lieux = theme['lieux'] ?? [];
                        if (_filtreActif == 'الكل') {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.fromLTRB(20, 22, 20, 10),
                                  child: Text(theme['titre'].toString(), style: GoogleFonts.cairo(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.8))
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
                                  child: Text(theme['titre'].toString(), style: GoogleFonts.cairo(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold, letterSpacing: 1.8))
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
        margin: const EdgeInsets.only(left: 14, bottom: 8),
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
              top: 10, left: 10,
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
              bottom: 14, right: 14, left: 14,
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
                            alignment: Alignment.centerRight,
                            child: Text(
                              lieu['nom'].toString(),
                              style: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lieu['desc'].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.cairo(color: Colors.white60, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: couleurLieu,
                    child: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 16),
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
              top: 12, left: 12,
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
              bottom: 16, right: 16, left: 16,
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
                            alignment: Alignment.centerRight,
                            child: Text(
                              lieu['nom'].toString(),
                              style: GoogleFonts.cairo(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lieu['desc'].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.cairo(color: Colors.white60, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: couleurLieu,
                    child: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 20),
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