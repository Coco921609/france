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

  const FranceSecretePage({Key? key, this.isEnglish = false, this.filtreInitial = 'الكل'}) : super(key: key);

  @override
  State<FranceSecretePage> createState() => _FranceSecretePageState();
}

class _FranceSecretePageState extends State<FranceSecretePage> {
  late String _filtreActif;
  bool _filtresOuverts = false;
  Set<String> _favoris = {};
  List<Map<String, dynamic>> _tousLesLieux = [];

  String get _cleStockage => widget.isEnglish ? 'mes_favoris_en' : 'mes_favoris_ar';

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
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Dialog(
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
                          PositionedDirectional(
                            top: 10, end: 10,
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
                            Text("${lieu['desc']} هذا المكان الاستثنائي هو أعجوبة حقيقية خفية من التراث الفرنسي. خذ وقتك لاستكشاف كل تفصيل وكل زاوية في هذا الموقع الفريد الذي يقدم تجربة غامرة لا تُنسى في قلب الطبيعة.",
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
                                child: const Text("اضغط هنا واكتشف المكان", style: TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),

                            const SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _modalAction(estFavori ? Icons.favorite : Icons.favorite_border, "المفضلة", () {
                                  _toggleFavori(lieu['nom']);
                                  setModalState(() {});
                                  setState(() {});
                                }, color: estFavori ? Colors.redAccent : Colors.white),
                                _modalAction(Icons.map_outlined, "الخرائط", () => _ouvrirMaps(lieu['nom'])),
                                _modalAction(Icons.explore_outlined, "استكشاف", () {
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
                              icon: const Icon(Icons.arrow_back_ios, size: 16, color: Colors.white70),
                              label: const Text("المكان التالي", style: TextStyle(letterSpacing: 1.2, color: Colors.white70)),
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
    if (_filtreActif == 'الكل' || _filtreActif.contains('المفضلة') || _filtreActif.contains('ألعاب')) {
      lieuxDisponibles = _tousLesLieux;
    } else if (_filtreActif.contains('أودية') || _filtreActif.contains('مياه') || _filtreActif.contains('معالم') || _filtreActif.contains('مناظر') || _filtreActif.contains('خلجان')) {
      var theme = themes.firstWhere((t) => _filtreActif.contains(t['tag']), orElse: () => {'lieux': _tousLesLieux});
      lieuxDisponibles = List<Map<String, dynamic>>.from(theme['lieux']);
    } else {
      lieuxDisponibles = _tousLesLieux.where((l) => (l['caracteristiques'] as List? ?? []).contains(_filtreActif)).toList();
    }
    if (lieuxDisponibles.isEmpty) lieuxDisponibles = _tousLesLieux;

    void showRandom() {
      var random = lieuxDisponibles[Random().nextInt(lieuxDisponibles.length)];
      showDialog(
        context: context,
        builder: (context) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            backgroundColor: const Color(0xFF1A1C20),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("وجهة غامضة ✨", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
                IconButton(padding: EdgeInsets.zero, constraints: const BoxConstraints(), icon: const Icon(Icons.close, color: Colors.white54, size: 22), onPressed: () => Navigator.pop(context)),
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("المسار يتكيف تلقائياً! سوف نأخذك إلى:", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 10),
                Text(random['nom'], style: GoogleFonts.cinzel(fontSize: 18, color: random['couleur'], fontWeight: FontWeight.bold)),
              ],
            ),
            actions: [
              TextButton(onPressed: () { Navigator.pop(context); showRandom(); }, child: const Text("مكان آخر")),
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: random['couleur']), onPressed: () { Navigator.pop(context); Navigator.push(context, _routeInstantanee(random['page'])); }, child: const Text("الذهاب الآن", style: TextStyle(color: Colors.white)))
            ],
          ),
        ),
      );
    }
    showRandom();
  }

  // Widget manquant
  Widget _buildTexteSeparateur(String texte) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Text(texte, style: const TextStyle(color: Colors.white30, fontSize: 11, letterSpacing: 1.0)),
    );
  }

  final List<Map<String, dynamic>> themes = [
    {
      'titre': '🏜️ أجواء الأودية والصحاري',
      'tag': 'أودية',
      'lieux': [
        {'nom': 'مسار الأوكر 🏜️', 'image': 'assets/images/20190528-165859-largejpg.jpg', 'desc': 'أجواء من كولورادو الأمريكية تقع في قلب منطقة بروفنس.', 'couleur': const Color(0xFFE2725B), 'page': const SentierDesOcresPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🌅 شروق الشمس', '📸 مواقع إنستغرام', '🔭 إطلالة بانورامية']},
        {'nom': "أعمدة إيل صير تيت ⛰️", 'image': 'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg', 'desc': 'أجواء تشبه كابادوكيا التركية في البرينيه الشرقية.', 'couleur': const Color(0xFFD35400), 'page': const OrguesIlleSurTetPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🌇 غروب الشمس', '📸 مواقع إنستغرام']},
        {'nom': 'روجيه دي كاماريس 🤠', 'image': 'assets/images/45.jpg', 'desc': 'الغرب الأمريكي القديم يتجلى في وسط أفيرون.', 'couleur': const Color(0xFFB03A2E), 'page': const RougierCamaresPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']},
        {'nom': 'ألتشلوسفيلsen 🧗', 'image': 'assets/images/_MG_8016_bearb_Andere_080e7196a8b9e1f41bbd39c0768d7f94.jpg', 'desc': 'الوادي الصغير الساحر لأريزونا في منطقة موزيل.', 'couleur': const Color(0xFFC0392B), 'page': const AltschlossfelsenPage(), 'caracteristiques': ['🤠 أريد مغامرة', '📸 مواقع إنستغرام']},
        {'nom': 'كثيب بيلات 🐪', 'image': 'assets/images/sudouest-photo-1-32378160-1600.jpg', 'desc': 'أجواء صحراوية مهيبة في مواجهة المحيط الأطلسي مباشر.', 'couleur': const Color(0xFFD4AC0D), 'page': const DuneDuPilatPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '🔭 إطلالة بانورامية', '📸 مواقع إنستغرام']}
      ]
    },
    {
      'titre': '🛶 مضائق ومياه فيروزية',
      'tag': 'مياه',
      'lieux': [
        {'nom': 'مضائق فيردون 🛶', 'image': 'assets/images/VERDON.jpg', 'desc': 'الوادي الكبير الأوروبي الشهير بمياهه الفيروزية الساحرة.', 'couleur': const Color(0xFF40E0D0), 'page': const GorgesDuVerdonPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية', '📸 مواقع إنستغرام']},
        {'nom': 'جزيرة العذراء 🏝️', 'image': 'assets/images/crique-ile-vierge-crozon.jpg', 'desc': 'أجواء جزر الكاريبي الخلابة مخبأة تماماً في بريتاني.', 'couleur': const Color(0xFF40E0D0), 'page': const IleDeLaViergePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌅 شروق الشمس', '📸 مواقع إنستغرام']},
        {'nom': 'مضائق فيير 🌉', 'image': 'assets/images/gorges-du-fier-annecy-15.jpg', 'desc': 'ممر كامينيتو ديل ري الشهير في منطقة هوت سافوا.', 'couleur': const Color(0xFFBDC3C7), 'page': const GorgesDuFierPage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'شلالات التوف 💧', 'image': 'assets/images/Cascade-des-Tuffes-Les-Planches-pres-Arbois.jpg', 'desc': 'لمسة سحرية من بالي الإندونيسية في مرتفعات جورا.', 'couleur': const Color(0xFF27AE60), 'page': const CascadesDesTufsPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 مواقع إنستغرام']},
        {'nom': 'منعطف كوي 🌿', 'image': 'assets/images/4e582873ad7ec56c2ad9a98a3cca8ed8.jpg', 'desc': 'غابات الأمازون بنسختها الأوفرنية منظوراً إليها من الأعلى.', 'couleur': const Color(0xFF42C100), 'page': const MeandreQueuillePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌅 شروق الشمس', '🔭 إطلالة بانورامية']},
        {'nom': "بحيرة أورسييريت 🇨🇦", 'image': 'assets/images/780_lac-de-lorceyrette-mducroux.jpg', 'desc': 'طبيعة كندا البرية الساحرة تتجسد تماماً في جبال الألب.', 'couleur': const Color(0xFF7FB3D5), 'page': const LacOrceyrettePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🔭 إطلالة بانورامية']},
        {'nom': 'بحيرة ألوس 🇳🇴', 'image': 'assets/images/19.jpg', 'desc': 'أجواء نرويجية فريدة من نوعها في قلب جبال الألب الفرنسية.', 'couleur': const Color(0xFF5DADE2), 'page': const LacDAllosPage(), 'caracteristiques': ['🤠 أريد مغامرة', '🔭 إطلالة بانورامية']}
      ]
    },
    {
      'titre': '🏛️ حدائق ومعالم غير مألوفة',
      'tag': 'معالم',
      'lieux': [
        {'nom': 'بُت شومون 🦢', 'image': 'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg', 'desc': 'معبد رومانسي كلاسيكي وجرف صخري في قلب باريس.', 'couleur': const Color(0xFF5DADE2), 'page': const ButtesChaumontPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس']},
        {'nom': 'القصر المثالي 🏯', 'image': 'assets/images/facteur-cheval.jpg', 'desc': 'معبد آسيوي غامض ومثير للاهتمام يقع في منطقة دروم.', 'couleur': const Color(0xFFD4AC0D), 'page': const PalaisIdealPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 مواقع إنستغرام']},
        {'nom': 'منتزه مونسو ⛲', 'image': 'assets/images/597240-visuel-paris-parc-monceau.jpg', 'desc': 'الأناقة والجمال على الطريقة الإيطالية وسط العاصمة باريس.', 'couleur': const Color(0xFFD4AF37), 'page': const ParcMonceauPage(), 'caracteristiques': ['🧘 أريد الاسترخاء']},
        {'nom': 'غابة فونتينبلو 🌲', 'image': 'assets/images/foret-de-fontainebleau.jpg', 'desc': 'غابة اسكندنافية شاسعة تقع على أبواب مدينة باريس.', 'couleur': const Color(0xFF27AE60), 'page': const ForetFontainebleauPage(), 'caracteristiques': ['🤠 أريد مغامرة']},
        {'nom': 'مسار القمم 🌳', 'image': 'assets/images/88.jpg', 'desc': 'نزهة غامرة فريدة بين المظلات الشجرية في منطقة ألزاس.', 'couleur': const Color(0xFF27AE60), 'page': const CheminCimesAlsacePage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🔭 إطلالة بانورامية']}
      ]
    },
    {
      'titre': '🌋 مناظر طبيعية فريدة',
      'tag': 'مناظر',
      'lieux': [
        {'nom': 'بوي دي دوم 🌋', 'image': 'assets/images/dome.webp', 'desc': 'نعم، فرنسا تحتوي على مجموعة مذهلة من البراكين الخاملة!', 'couleur': const Color(0xFFE67E22), 'page': const PuyDeDomePage(), 'caracteristiques': ['🤠 أريد مغامرة', '🌅 شروق الشمس', '🔭 إطلالة بانورامية']},
        {'nom': 'جسر غارد 🏛️', 'image': 'assets/images/pont.webp', 'desc': 'إطلالة استثنائية لا مثيل لها على هذه التحفة الأثرية القديمة.', 'couleur': const Color(0xFF3498DB), 'page': const PontDuGardPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '🔭 إطلالة بانورامية']},
        {'nom': 'مستنقعات إيغ مورت 🧂', 'image': 'assets/images/5.jpg', 'desc': 'ملاحات واسعة ذات انعكاسات وردية تشبه صحاري بوليفيا الملحية.', 'couleur': const Color(0xFFF1C40F), 'page': const MaraisSalantsAiguesMortesPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '🌇 غروب الشمس', '📸 مواقع إنستغرام']}
      ]
    },
    {
      'titre': '🌊 الخلجان الصغيرة في فرنسا',
      'tag': 'خلجان',
      'lieux': [
        {'nom': 'كالانك دي سوجيتون 🌊', 'image': 'assets/images/sugiton.jpg', 'desc': 'جروف بيضاء مهيبة ومياه فيروزية في البحر الأبيض المتوسط.', 'couleur': const Color(0xFF00A896), 'page': const CalanqueDeSugitonPage(), 'caracteristiques': ['🧘 أريد الاسترخاء', '📸 مواقع إنستغرام', '🔭 إطلالة بانورامية']}
      ]
    }
  ];

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
            if (tag.contains('ألعاب')) {
              Navigator.push(context, _routeInstantanee(const JeuPage(isArabic: true)));
            } else if (tag != _filtreActif) {
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
    if (_filtreActif == 'الكل') {
      themesFiltres = themes;
    } else if (_filtreActif.contains('المفضلة')) {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => _favoris.contains(l['nom'])).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    } else if (_filtreActif.contains('أودية') || _filtreActif.contains('مياه') || _filtreActif.contains('معالم') || _filtreActif.contains('مناظر') || _filtreActif.contains('خلجان')) {
      themesFiltres = themes.where((t) => _filtreActif.contains(t['tag'])).toList();
    } else {
      themesFiltres = themes.map((t) => {
        'titre': t['titre'],
        'tag': t['tag'],
        'lieux': (t['lieux'] as List).where((l) => (l['caracteristiques'] as List? ?? []).contains(_filtreActif)).toList()
      }).where((t) => (t['lieux'] as List).isNotEmpty).toList();
    }

    bool isTout = _filtreActif == 'الكل';
    List<Map<String, dynamic>> lieuxAffichesFlat = [];
    for (var theme in themesFiltres) {
      if (theme['lieux'] != null) {
        lieuxAffichesFlat.addAll(List<Map<String, dynamic>>.from(theme['lieux']));
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
              title: Text("فرنسا السرية", style: GoogleFonts.cinzel(fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 2.0)),
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
                              Text(_filtreActif == 'الكل' ? "تصفية الوجهات المتوفرة" : "الفلتر النشط : $_filtreActif", style: GoogleFonts.montserrat(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
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
                          _buildChipFiltre('الكل'),
                          const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                          _buildTexteSeparateur("🏜️ اكتشف حسب الفئات"),
                          _buildChipFiltre('🏜️ أودية'),
                          _buildChipFiltre('🛶 مياه'),
                          _buildChipFiltre('🏛️ معالم'),
                          _buildChipFiltre('🌋 مناظر طبيعية'),
                          _buildChipFiltre('🌊 خلجان صغيرة'),
                          const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                          _buildTexteSeparateur("🧘 حسب رغبتك الحالية"),
                          _buildChipFiltre('🧘 أريد الاسترخاء'),
                          _buildChipFiltre('🤠 أريد مغامرة'),
                          _buildChipFiltre('🌅 شروق الشمس'),
                          _buildChipFiltre('🌇 غروب الشمس'),
                          _buildChipFiltre('📸 مواقع إنستغرام'),
                          _buildChipFiltre('🔭 إطلالة بانورامية'),
                          const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                          _buildTexteSeparateur("تحديداتي الشخصية"),
                          _buildChipFiltre('❤️ المفضلة'),
                          const VerticalDivider(color: Colors.white10, width: 16, indent: 12, endIndent: 12),
                          _buildTexteSeparateur("ترفيه"),
                          _buildChipFiltre('🎮 ألعاب'),
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
                    if (_filtreActif.contains('المفضلة')) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite, size: 90, color: Colors.redAccent.withOpacity(0.8)),
                            const SizedBox(height: 20),
                            Text("ليس لديك أي وجهات مفضلة بعد", style: GoogleFonts.cinzel(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            const SizedBox(height: 12),
                            Text("استكشف الوجهات الرائعة واضغط على أيقونة القلب\nلبناء دفتر سفرياتك الخاص هنا بكل سهولة.", style: GoogleFonts.montserrat(color: Colors.white54, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    }
                    return const SizedBox(height: 200, child: Center(child: Text("لم يتم العثور على أي مكان", style: TextStyle(color: Colors.white54))));
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
                          children: lieux.map((lieu) => Padding(padding: EdgeInsetsDirectional.only(end: lieux.last == lieu ? 20.0 : 0.0), child: _buildCard(lieu, isVertical: false, listeLieuxFiltree: lieuxAffichesFlat))).toList(),
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
        margin: isVertical ? const EdgeInsets.symmetric(horizontal: 20, vertical: 8) : const EdgeInsetsDirectional.only(start: 20, top: 8, bottom: 8),
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
                      Text("اضغط لاكتشاف المكان بالتفصيل", style: GoogleFonts.montserrat(color: lieu['couleur'], fontSize: 11, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
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