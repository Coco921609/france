import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForetFontainebleauPage extends StatefulWidget {
  const ForetFontainebleauPage({super.key});

  @override
  State<ForetFontainebleauPage> createState() => _ForetFontainebleauPageState();
}

class _ForetFontainebleauPageState extends State<ForetFontainebleauPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color vertForet = Color(0xFF27AE60);

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
                'assets/images/1136015-les-25-bosses-photos-image00079.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. PANNEAU DE CONTENU (chevauchement par marge)
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
                    'Fontainebleau 🌲',
                    style: GoogleFonts.cinzel(
                      color: vertForet,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  _buildTranslationLine("Paris", "Forêts scandinaves / Suède", vertForet),

                  const SizedBox(height: 25),

                  Text(
                    "🇫🇷 Le circuit mythique des 25 Bosses",
                    style: GoogleFonts.montserrat(
                      color: vertForet.withOpacity(0.8),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "C’est l’une des randonnées les plus mythiques d’Île-de-France ! Gratuite, exigeante et spectaculaire. Créée dans les années 70 par des alpinistes parisiens pour s'entraîner aux expéditions, c'est un vrai terrain de jeu naturel.",
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 35),

                  // TABLEAU TEMPS DE PARCOURS
                  _buildSectionTitle('Rythme & durée (17 km)'),
                  const SizedBox(height: 15),
                  _buildTable([
                    ['Niveau', 'Temps estimé'],
                    ['🏃 Rapide', '4 – 5 h'],
                    ['🚶 Modéré', '5 – 6 h'],
                    ['🧘 Tranquille', '6 – 7 h'],
                    ['📸 Photo/pique-nique', '7 – 10 h'],
                  ], vertForet),

                  const SizedBox(height: 35),

                  // SAISONS & HORAIRES
                  _buildSectionTitle('Quand y aller ?'),
                  const SizedBox(height: 15),
                  _buildTable([
                    ['Saison', 'Conseil'],
                    ['🍂 Automne', 'Idéal (feuillage flamboyant)'],
                    ['🌸 Printemps', 'Idéal (floraison)'],
                    ['🚫 Été/Hiver', 'Éviter (trop chaud ou glissant)'],
                    ['⏰ Week-end', 'Partir tôt pour éviter la foule'],
                  ], vertForet),

                  const SizedBox(height: 35),

                  // GALERIE PHOTO
                  _buildSectionTitle('Aperçu du lieu'),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildGalleryImage('assets/images/1136007-les-25-bosses-photos-image00086.jpg'),
                        _buildGalleryImage('assets/images/1136009-les-25-bosses-photos-image00081.jpg'),
                        _buildGalleryImage('assets/images/1136011-les-25-bosses-photos-image00082.jpg'),
                        _buildGalleryImage('assets/images/1136015-les-25-bosses-photos-image00079.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // INFOS PRATIQUES
                  _buildSectionTitle('Conseils de survie'),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1C20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildTechRow(Icons.directions_run, "Préparez-vous : ça grimpe et ça glisse !", vertForet),
                        _buildTechRow(Icons.water_drop, "Minimum 1,5 L d'eau + snacks", vertForet),
                        _buildTechRow(Icons.map, "GPS ou carte indispensable", vertForet),
                        _buildTechRow(Icons.sync, "Sens conseillé : à l'envers (anti-foule)", vertForet),
                        _buildTechRow(Icons.delete_outline, "Zéro déchet : respectez la forêt 🙏", vertForet),
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
        Text(analogie, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
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
            padding: const EdgeInsets.all(12),
            child: Text(cell, style: GoogleFonts.montserrat(
              color: isHeader ? hColor : Colors.white70,
              fontSize: 12,
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            )),
          )).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cinzel(
            color: const Color(0xFF27AE60),
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
          Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}