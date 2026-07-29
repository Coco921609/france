import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PontDArcPage extends StatefulWidget {
  const PontDArcPage({super.key});

  @override
  State<PontDArcPage> createState() => _PontDArcPageState();
}

class _PontDArcPageState extends State<PontDArcPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertArdeche = Color(0xFF16A085);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au défilement global)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/image/22.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU (Remonté légèrement pour le design)
            Transform.translate(
              offset: const Offset(0, -50),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF141619),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pont d\'Arc 🇧🇦',
                      style: GoogleFonts.cinzel(
                        color: vertArdeche,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Dimensions", "54m de haut, 60m de large", vertArdeche),
                    _buildFactLine("Formation", "Creusé par la rivière Ardèche", vertArdeche),
                    _buildFactLine("Air de", "Rivières karstiques (Bosnie 🇧🇦)", vertArdeche),

                    const SizedBox(height: 25),
                    Text(
                      "🇧🇦 Un joyau géologique aux airs de Balkans",
                      style: GoogleFonts.montserrat(
                        color: vertArdeche.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Majestueuse arche naturelle creusée au fil du millénaires, le Pont d'Arc est la porte d'entrée monumentale des gorges de l'Ardèche. Avec ses falaises calcaires spectaculaires plongeant dans des eaux émeraude, ce chef-d'œuvre naturel n'est pas sans rappeler les sublimes paysages karstiques et les rivières cristallines de Bosnie-Herzégovine.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Meilleures saisons', vertArdeche),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Saison', 'Ambiance & Conseils'], isHeader: true, hColor: vertArdeche),
                        _buildTableRow(['🌱 Printemps', 'RECOMMANDÉ : Nature verdoyante, eaux vives pour le canoë et moins de foule']),
                        _buildTableRow(['🍂 Automne', 'RECOMMANDÉ : Belles couleurs, climat encore doux et grand calme']),
                        _buildTableRow(['☀️ Été', 'À ÉVITER : Sauf si on aime la foule. Embouteillages de canoës et saturation des plages']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Horaires conseillés', vertArdeche),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: vertArdeche),
                        _buildTableRow(['✨ Matin (tôt)', 'RECOMMANDÉ : Eau miroir, lumière douce et tranquillité absolue sur la plage']),
                        _buildTableRow(['🌅 Fin de journée', 'RECOMMANDÉ : La roche s\'illumine d\'orange et les touristes désertent les lieux']),
                        _buildTableRow(['☀️ Après-midi', 'À ÉVITER : Chaleur étouffante (surtout l\'été) et bruit constant']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Aperçu du lieu', vertArdeche),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/18.webp'),
                          _buildGalleryImage('assets/image/17.webp'),
                          _buildGalleryImage('assets/image/20.jpg'),
                          _buildGalleryImage('assets/image/21.jpg'),
                          _buildGalleryImage('assets/image/23.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Indispensables & Infos', vertArdeche),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Situé à Vallon-Pont-d'Arc (Ardèche)", vertArdeche),
                          _buildTechRow(Icons.kayaking, "Passage en canoë-kayak sous l'arche incontournable", vertArdeche),
                          _buildTechRow(Icons.pool, "Deux plages aménagées pour la baignade au pied de l'arche", vertArdeche),
                          _buildTechRow(Icons.wb_sunny, "Prévoir de la crème solaire et beaucoup d'eau en été", vertArdeche),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- HELPERS ---

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16))),
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

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white10,
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}