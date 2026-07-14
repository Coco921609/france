import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class DuneDuPilatPage extends StatefulWidget {
  const DuneDuPilatPage({super.key});

  @override
  State<DuneDuPilatPage> createState() => _DuneDuPilatPageState();
}

class _DuneDuPilatPageState extends State<DuneDuPilatPage> {
  @override
  Widget build(BuildContext context) {
    // Thème de couleur : Sable doré / Or
    const Color goudDune = Color(0xFFD4AC0D);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE D'ARRIÈRE-PLAN (HAUT)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/sudouest-photo-1-32378160-1600.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. CONTENU SCROLLABLE
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
                      'Dune du Pilat 🏖️',
                      style: GoogleFonts.cinzel(
                        color: goudDune,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LOCALISATION
                    _buildTranslationLine(
                        "Bassin d'Arcachon", "Un air de Sahara (Afrique)", goudDune),

                    const SizedBox(height: 25),

                    Text(
                      "🏜️ La plus haute dune d'Europe",
                      style: GoogleFonts.montserrat(
                        color: goudDune.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Un phénomène naturel monumental coincé entre l'océan Atlantique et la forêt des Landes. Avec ses 100 mètres de haut, elle offre un spectacle désertique saisissant et une vue unique sur le banc d'Arguin.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU DES SAISONS
                    _buildSectionTitle('Meilleures saisons', goudDune),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Saison', 'Ambiance', 'Conseil'],
                      ['🌸 Printemps', 'Douceur', 'Parfait pour éviter la foule'],
                      [
                        '☀️ Été',
                        'Chaleur',
                        'Privilégier le lever ou coucher du soleil'
                      ],
                      [
                        '🍂 Automne',
                        'Lumière d\'or',
                        'La période la plus photogénique'
                      ],
                      ['❄️ Hiver', 'Sauvage', 'Idéal pour une solitude totale'],
                    ], goudDune),

                    const SizedBox(height: 35),

                    // CONSEILS DE VISITE
                    _buildSectionTitle('Conseils de visite', goudDune),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Recommandation'],
                      [
                        '🌅 Coucher de soleil',
                        'Le moment le plus magique de la journée'
                      ],
                      [
                        '🏃 Ascension',
                        'Escalier disponible d\'avril à octobre'
                      ],
                      [
                        '🌬️ Vent',
                        'Le sable peut être irritant les jours de vent fort'
                      ],
                    ], goudDune),

                    const SizedBox(height: 35),

                    // GALERIE
                    _buildSectionTitle('Aperçu du lieu', goudDune),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage(
                              'assets/images/photo-aerienne-dune-du-pilat-277.jpg'),
                          _buildGalleryImage(
                              'assets/images/de-zonsondergang-vanaf-de-dune-du-pilat-frankrijk_32968_ml.jpg'),
                          _buildGalleryImage(
                              'assets/images/panorama-over-de-dune-du-pilat-frankrijk_13655_ml.jpg'),
                          _buildGalleryImage(
                              'assets/images/sudouest-photo-1-32378160-1600.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('Infos pratiques', goudDune),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.hiking,
                              "Accès à la dune libre et gratuit", goudDune),
                          _buildTechRow(Icons.wb_sunny,
                              "Zone sans ombre : prévoyez de l'eau", goudDune),
                          _buildTechRow(Icons.camera_alt,
                              "Panorama 360° : Forêt & Océan", goudDune),
                          _buildTechRow(Icons.pets,
                              "Chiens autorisés tenus en laisse", goudDune),
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

  // --- DESIGN HELPERS ---

  Widget _buildCircleBtn(IconData icon, VoidCallback tap) => CircleAvatar(
    backgroundColor: Colors.black45,
    child:
    IconButton(icon: Icon(icon, color: Colors.white, size: 18), onPressed: tap),
  );

  Widget _buildTranslationLine(String lieu, String analogie, Color color) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(lieu,
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
                  fontWeight:
                  idx == 0 ? FontWeight.bold : FontWeight.normal,
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
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontSize: 13),
                  softWrap: true)),
        ],
      ),
    );
  }
}