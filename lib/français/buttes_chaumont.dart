import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtesChaumontPage extends StatefulWidget {
  const ButtesChaumontPage({super.key});

  @override
  State<ButtesChaumontPage> createState() => _ButtesChaumontPageState();
}

class _ButtesChaumontPageState extends State<ButtesChaumontPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Bleu Ciel / Eau
    const Color bleuParc = Color(0xFF5DADE2);

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
                'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
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
                      'Parc des Buttes-Chaumont 🦢',
                      style: GoogleFonts.cinzel(
                        color: bleuParc,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine("Paris 19ème", "Un air d'Italie (Tivoli)", bleuParc),

                    const SizedBox(height: 25),

                    Text(
                      "🇮🇹 Un sanctuaire romantique à Paris",
                      style: GoogleFonts.montserrat(
                        color: bleuParc.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Une ancienne carrière escarpée offrant des vues spectaculaires, des grottes secrètes et un lac suspendu dominé par le Temple de la Sybille.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('📅 Guide des saisons', bleuParc),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Saison', 'Détails de visite'],
                      ['🍂 Automne', 'Couleurs rougeâtres magnifiques (Recommandé)'],
                      ['🌱 Printemps', 'Végétation fleurie et fraîcheur'],
                      ['☀️ Été', 'Parfait pour les pique-niques'],
                      ['❄️ Hiver', 'À éviter : froid et vents violents'],
                    ], bleuParc),

                    const SizedBox(height: 35),

                    _buildSectionTitle('🕓 Affluence & Horaires', bleuParc),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Recommandation'],
                      ['✨ Idéal', 'Tôt le matin ou fin d\'après-midi'],
                      ['👥 Chargé', '12h00 - 14h00 et Week-ends'],
                    ], bleuParc),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📸 Aperçu du lieu', bleuParc),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/960042-parc-buttes-chaumont-automne.jpg'),
                          _buildGalleryImage('assets/images/OIP.webp'),
                          _buildGalleryImage('assets/images/istockphoto-1200995129-612x612.jpg'),
                          _buildGalleryImage('assets/images/istockphoto-1206218301-612x612.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('📋 Infos pratiques', bleuParc),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wc, "Toilettes : Oui", bleuParc),
                          _buildTechRow(Icons.wifi, "WIFI : Oui", bleuParc),
                          _buildTechRow(Icons.child_care, "Table à langer : Oui", bleuParc),
                          _buildTechRow(Icons.local_drink, "Distributeur : Non", bleuParc),
                          _buildTechRow(Icons.pets, "Animaux : Oui (laisse obligatoire)", bleuParc),
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

  Widget _buildTranslationLine(String ville, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(ville, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
        ),
        Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16), softWrap: true),
      ],
    );
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(cell,
                style: GoogleFonts.montserrat(
                  color: isHeader ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                )),
          )).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cinzel(
            color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 180,
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
                  style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}