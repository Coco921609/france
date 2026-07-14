import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class ButtesChaumontPage extends StatefulWidget {
  const ButtesChaumontPage({super.key});

  @override
  State<ButtesChaumontPage> createState() => _ButtesChaumontPageState();
}

class _ButtesChaumontPageState extends State<ButtesChaumontPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique pour les Buttes-Chaumont (Bleu Ciel / Eau)
    const Color bleuParc = Color(0xFF5DADE2);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND (HAUT)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/parc-des-Buttes-Chaumont-de-Paris.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. CONTENU DÉFILABLE (CONTENEUR NOIR ARRONDIT)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.62,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF141619),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buttes-Chaumont 🌳',
                      style: GoogleFonts.cinzel(
                        color: bleuParc,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine("Paris 19e", "Un air d'Italie (Tivoli)", bleuParc),

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
                      "Ancienne carrière escarpée offrant des vues spectaculaires, des grottes secrètes et un lac suspendu dominé par le temple de la Sybille.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('Guide des saisons', bleuParc),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Saison', 'Détails de visite'],
                      ['🍂 Automne', 'Magnifiques couleurs rousses (Recommandé)'],
                      ['🌱 Printemps', 'Végétation en fleurs et fraîcheur'],
                      ['☀️ Été', 'Parfait pour les pique-niques'],
                      ['❄️ Hiver', 'À éviter : froid et vent fort'],
                    ], bleuParc),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Affluence & horaires', bleuParc),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Recommandation'],
                      ['✨ Idéal', 'Tôt le matin ou fin d\'après-midi'],
                      ['👥 Chargé', '12h - 14h et week-ends'],
                    ], bleuParc),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Aperçu du lieu', bleuParc),
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

                    _buildSectionTitle('Infos pratiques', bleuParc),
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
                          _buildTechRow(Icons.wifi, "Wifi : Oui", bleuParc),
                          _buildTechRow(Icons.child_care, "Table à langer : Oui", bleuParc),
                          _buildTechRow(Icons.local_drink, "Distributeur de boissons : Non", bleuParc),
                          _buildTechRow(Icons.pets, "Animaux : Oui (Laisse obligatoire)", bleuParc),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- HELPERS IDENTIQUES AU DESIGN GORGES DU FIER ---

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
        int idx = entry.key;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                style: GoogleFonts.montserrat(
                  color: idx == 0 ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
                ),
                softWrap: true),
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