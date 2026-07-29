import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesNouaillesPage extends StatefulWidget {
  const GorgesNouaillesPage({super.key});

  @override
  State<GorgesNouaillesPage> createState() => _GorgesNouaillesPageState();
}

class _GorgesNouaillesPageState extends State<GorgesNouaillesPage> {
  @override
  Widget build(BuildContext context) {
    const Color vertRiviere = Color(0xFF1ABC9C);

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
                'assets/image/9.jpg',
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
                      'Gorges de Nouailles 🛶',
                      style: GoogleFonts.cinzel(
                        color: vertRiviere,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Rivière", "La Loue", vertRiviere),
                    _buildFactLine("Profondeur", "Jusqu'à 350 mètres", vertRiviere),
                    _buildFactLine("Air de", "Gorges de la Tara (Monténégro 🇲🇪)", vertRiviere),

                    const SizedBox(height: 25),
                    Text(
                      "🦅 Le spectaculaire canyon du Doubs",
                      style: GoogleFonts.montserrat(
                        color: vertRiviere.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Creusées par la force tumultueuse de la Loue, les Gorges de Nouailles offrent un paysage spectaculaire de falaises abruptes et de nature verdoyante. Ce canyon vertigineux, aux airs de Balkans, est un véritable paradis pour les randonneurs. Il dévoile des sentiers escarpés et des belvédères impressionnants au cœur du massif jurassien.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Meilleures saisons', vertRiviere),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Saison', 'Ambiance & Conseils'], isHeader: true, hColor: vertRiviere),
                        _buildTableRow(['🌱 Printemps', 'RECOMMANDÉ : Débit de la cascade impressionnant et nature luxuriante']),
                        _buildTableRow(['🍂 Automne', 'RECOMMANDÉ : Magnifiques teintes dorées et cuivrées sur les falaises']),
                        _buildTableRow(['❄️ Hiver', 'À ÉVITER : Sentiers très glissants, gelés et dangereux près du vide']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Horaires conseillés', vertRiviere),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: vertRiviere),
                        _buildTableRow(['✨ Matin', 'RECOMMANDÉ : Fraîcheur et belle lumière traversant la brume du canyon']),
                        _buildTableRow(['☀️ Après-midi', 'Agréable : Parfait pour accomplir la grande randonnée']),
                        _buildTableRow(['🌙 Nuit', 'À ÉVITER : Terrains très escarpés, extrêmement dangereux dans l\'obscurité']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Aperçu du lieu', vertRiviere),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/7.jpg'),
                          _buildGalleryImage('assets/image/8.webp'),
                          _buildGalleryImage('assets/image/9.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Indispensables & Infos', vertRiviere),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Situé près de Mouthier-Haute-Pierre (Doubs)", vertRiviere),
                          _buildTechRow(Icons.directions_walk, "Randonnées techniques (bonnes chaussures obligatoires)", vertRiviere),
                          _buildTechRow(Icons.water_drop, "Points de vue spectaculaires sur la rivière", vertRiviere),
                          _buildTechRow(Icons.warning_amber_rounded, "Attention aux sentiers parfois étroits et vertigineux", vertRiviere),
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

  // --- MÉTHODES DE STYLE ---

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