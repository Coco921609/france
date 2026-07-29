import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GorgesDuVerdonPage extends StatefulWidget {
  const GorgesDuVerdonPage({super.key});

  @override
  State<GorgesDuVerdonPage> createState() => _GorgesDuVerdonPageState();
}

class _GorgesDuVerdonPageState extends State<GorgesDuVerdonPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Bleu Turquoise Verdon
    const Color bleuVerdon = Color(0xFF40E0D0);

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
                'assets/images/VERDON.jpg',
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
                      'Gorges du Verdon 🛶',
                      style: GoogleFonts.cinzel(
                        color: bleuVerdon,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine("Provence", "Un air de Grand Canyon (USA)", bleuVerdon),

                    const SizedBox(height: 25),

                    Text(
                      "🇺🇸 Le plus grand canyon d'Europe",
                      style: GoogleFonts.montserrat(
                        color: bleuVerdon.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Gigantesque faille creusée par la rivière Verdon, ces gorges offrent des falaises vertigineuses et une eau d'un turquoise irréel. C'est un espace naturel protégé d'une beauté sauvage exceptionnelle.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('Meilleures saisons', bleuVerdon),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Saison', 'Ambiance', 'Conseil'],
                      ['🌸 Printemps', 'Eau vive', 'Idéal pour le rafting et les fleurs'],
                      ['☀️ Été', 'Turquoise', 'Parfait pour le pédalo (très fréquenté)'],
                      ['🍂 Automne', 'Calme', 'Lumière magnifique sur les falaises'],
                      ['❄️ Hiver', 'Mystique', 'Route des Crêtes parfois enneigée'],
                    ], bleuVerdon),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Activités suggérées', bleuVerdon),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Recommandation'],
                      ['🛶 Eau', 'Location de canoë au Pont du Galetas'],
                      ['🥾 Rando', 'Sentier Blanc-Martel (sportif et mythique)'],
                      ['🚗 Vue', 'La Route des Crêtes pour les belvédères'],
                    ], bleuVerdon),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Aperçu du lieu', bleuVerdon),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/Visiter-les-Gorges-du-Verdon.jpg'),
                          _buildGalleryImage('assets/images/Gorges-du-VerdonProvence-in-France-Europe.-755x504.jpg'),
                          _buildGalleryImage('assets/images/randonnee_basses_gorges_verdon_2_2a20e72145.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Infos pratiques', bleuVerdon),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.directions_car, "Routes très sinueuses et étroites", bleuVerdon),
                          _buildTechRow(Icons.location_on, "Incontournable : Moustiers-Sainte-Marie", bleuVerdon),
                          _buildTechRow(Icons.water_drop, "Température de l'eau assez fraîche", bleuVerdon),
                          _buildTechRow(Icons.camera_alt, "Vautours fauves visibles depuis les sommets", bleuVerdon),
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

  // --- HELPERS DESIGN ---

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville,
            style: GoogleFonts.montserrat(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogie,
            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16),
            softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                style: GoogleFonts.montserrat(
                  color: idx == 0 ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
                ),
                softWrap: true),
          ))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cinzel(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 250,
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
          Expanded(
              child: Text(label,
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}