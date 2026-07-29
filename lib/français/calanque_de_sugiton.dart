import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalanqueDeSugitonPage extends StatefulWidget {
  const CalanqueDeSugitonPage({super.key});

  @override
  State<CalanqueDeSugitonPage> createState() => _CalanqueDeSugitonPageState();
}

class _CalanqueDeSugitonPageState extends State<CalanqueDeSugitonPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuMer = Color(0xFF2980B9);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            // 1. IMAGE DE FOND (défile avec le contenu)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/images/111.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. PANNEAU DE CONTENU (positionné pour chevaucher légèrement le haut)
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.38),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calanque de Sugiton 🌊',
                    style: GoogleFonts.cinzel(
                      color: bleuMer,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Située dans le sud de la France, entre Marseille et Cassis, la Calanque de Sugiton est un joyau du massif des Calanques. Un effort est nécessaire pour atteindre ce lieu paradisiaque.",
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 35),

                  // TABLEAU PÉRIODES
                  _buildSectionTitle('📅 Saisons recommandées', bleuMer),
                  const SizedBox(height: 15),
                  Table(
                    border: TableBorder.all(color: Colors.white10, width: 1),
                    columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                    children: [
                      _buildTableRow(['Saison', 'Conseils'], isHeader: true, hColor: bleuMer),
                      _buildTableRow(['🌱 Printemps', 'Idéal, température douce et nature en fleur.']),
                      _buildTableRow(['🍂 Automne', 'Parfait, moins de foule et chaleur supportable.']),
                      _buildTableRow(['☀️ Été', 'À éviter si possible (chaleur, poussière, affluence).']),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // TABLEAU HORAIRES
                  _buildSectionTitle('⏰ Horaires conseillés', bleuMer),
                  const SizedBox(height: 15),
                  Table(
                    border: TableBorder.all(color: Colors.white10, width: 1),
                    children: [
                      _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: bleuMer),
                      _buildTableRow(['🌅 Tôt le matin', 'Avant 8h : indispensable pour le parking et la tranquillité.']),
                      _buildTableRow(['☀️ Milieu journée', 'À éviter : forte chaleur sur la route en béton sans ombre.']),
                      _buildTableRow(['🌇 Soir', 'Idéal pour le coucher de soleil, mais retour à prévoir sous la chaleur.']),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // GALERIE PHOTO
                  _buildSectionTitle('📸 Aperçu du lieu', bleuMer),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildGalleryImage('assets/images/999.jpg'),
                        _buildGalleryImage('assets/images/777.jpg'),
                        _buildGalleryImage('assets/images/6666.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // PARCOURS ÉTAPE PAR ÉTAPE
                  _buildSectionTitle('🗺️ Parcours de Luminy à Sugiton', bleuMer),
                  const SizedBox(height: 20),
                  _buildStep("Départ : École d'architecture de Luminy."),
                  _buildStep("Piste : Large sentier en gravier (balisage bleu)."),
                  _buildStep("Direction : Atteindre le Col de Sugiton."),
                  _buildStep("Bifurcation : À droite, sentier en pointillés rouges."),
                  _buildStep("Transition : Jonction avec la route en béton."),
                  _buildStep("Point de vue : Dernier virage bétonné."),
                  _buildStep("Descente finale : Sentier naturel (pointillés rouges)."),
                  _buildStep("Arrivée : Criques de Sugiton."),

                  const SizedBox(height: 35),

                  // INFOS PRATIQUES
                  _buildSectionTitle('📋 Indispensables & Infos', bleuMer),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1C20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildTechRow(Icons.directions_walk, "Départ : Luminy", bleuMer),
                        _buildTechRow(Icons.timer, "3,2km (55min aller / 1h15 retour)", bleuMer),
                        _buildTechRow(Icons.water_drop, "Fontaine d'eau potable avant la barrière", bleuMer),
                        _buildTechRow(Icons.landscape, "Difficulté : Randonnée facile", bleuMer),
                        _buildTechRow(Icons.warning, "Descente raide et terrain caillouteux", bleuMer),
                        _buildTechRow(Icons.sunny, "Attention à l'inclinaison au retour sous le soleil", bleuMer),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- MÉTHODES D'AIDE ---

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildStep(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.arrow_right, color: Color(0xFF2980B9), size: 20),
          const SizedBox(width: 5),
          Expanded(child: Text(text, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5))),
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

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
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