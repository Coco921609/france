import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class AltschlossfelsenPage extends StatefulWidget {
  const AltschlossfelsenPage({super.key});

  @override
  State<AltschlossfelsenPage> createState() => _AltschlossfelsenPageState();
}

class _AltschlossfelsenPageState extends State<AltschlossfelsenPage> {
  // ignore: unused_field
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    const Color gresRouge = Color(0xFFC0392B);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      // Le SingleChildScrollView englobe désormais tout l'écran pour défiler comme un site
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            // 1. IMAGE DE FOND (qui défile maintenant avec le reste)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/images/altschlossfelsen-23-von-98.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. PANNEAU DE CONTENU (qui s'étend selon son contenu)
            Container(
              // 1.0 - 0.62 = 0.38 -> reproduit exactement l'alignement d'origine
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
                    'Altschlossfelsen 🏜️',
                    style: GoogleFonts.cinzel(
                      color: gresRouge,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // --- TRADUCTION EN FLÈCHE ---
                  _buildTranslationLine("Alt", "Vieux / Ancien", gresRouge),
                  _buildTranslationLine("Schloss", "Château", gresRouge),
                  _buildTranslationLine("Felsen", "Rocher", gresRouge),

                  const SizedBox(height: 25),
                  Text(
                    "🇺🇸 L'Arizona caché au Pays de Bitche",
                    style: GoogleFonts.montserrat(
                      color: gresRouge.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Situé au Pays de Bitche, à la frontière franco-allemande, l'Altschlossfelsen est une barre rocheuse de grès rouge de près de 1,5 km de long. Avec ses cavités et ses couleurs flamboyantes, on se croirait en plein canyon de l'Arizona.",
                    style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                  ),
                  const SizedBox(height: 35),

                  // TABLEAU PÉRIODES
                  _buildSectionTitle('📅 Meilleures saisons'),
                  const SizedBox(height: 15),
                  Table(
                    border: TableBorder.all(color: Colors.white10, width: 1),
                    columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                    children: [
                      _buildTableRow(['Saison', 'Ambiance & Couleurs'], isHeader: true, hColor: gresRouge),
                      _buildTableRow(['🍂 Automne', 'Couleurs de feu et feuilles dorées']),
                      _buildTableRow(['🌱 Printemps', 'Air pur et réveil de la forêt']),
                      _buildTableRow(['☀️ Été', 'Fraîcheur sous les parois de grès']),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // TABLEAU HORAIRES
                  _buildSectionTitle('⏰ Horaires conseillés'),
                  const SizedBox(height: 15),
                  Table(
                    border: TableBorder.all(color: Colors.white10, width: 1),
                    columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                    children: [
                      _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: gresRouge),
                      _buildTableRow(['✨ Matin', 'Lumière douce sur les falaises']),
                      _buildTableRow(['☀️ Midi', 'Ombre bienvenue au pied du rocher']),
                      _buildTableRow(['🌅 Soir', 'Le grès devient rouge sang au couchant']),
                    ],
                  ),

                  const SizedBox(height: 35),

                  // GALERIE PHOTO
                  _buildSectionTitle('📸 Aperçu du lieu'),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        _buildGalleryImage('assets/images/ev-1122-wanderarena-pfa-lzerwald-nordvogesen-03.jpg'),
                        _buildGalleryImage('assets/images/altschlossfelsen-pfaelzerwald-tipps-tolle-wanderung.jpg'),
                        _buildGalleryImage('assets/images/Wanderung-Altschlossfelsen-768x576.jpg'),
                        _buildGalleryImage('assets/images/altschlossfelsen-23-von-98.jpg'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // INFOS PRATIQUES
                  _buildSectionTitle('📋 Indispensables & Infos'),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1C20),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildTechRow(Icons.map_outlined, "Situé au Pays de Bitche (Moselle)", gresRouge),
                        _buildTechRow(Icons.directions_walk, "Randonnée d'environ 2h à 3h", gresRouge),
                        _buildTechRow(Icons.photo_camera, "Camera : Prendre des photos du canyon", gresRouge),
                        _buildTechRow(Icons.camera_alt, "Magnifique en automne", gresRouge),
                        _buildTechRow(Icons.air, "Printemps : air frais et pur", gresRouge),
                        _buildTechRow(Icons.flag_outlined, "Frontière franco-allemande", gresRouge),
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

  // --- MÉTHODES DE STYLE ---

  Widget _buildTranslationLine(String ger, String fr, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(ger, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Text(fr, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16)),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildCircleBtn(IconData icon, VoidCallback tap, {Color color = Colors.white}) => CircleAvatar(
    backgroundColor: Colors.black45,
    child: IconButton(icon: Icon(icon, color: color, size: 18), onPressed: tap),
  );

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

  Widget _buildSectionTitle(String title) {
    return Text(title, style: GoogleFonts.cinzel(color: const Color(0xFFC0392B), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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

  // ignore: unused_element
  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(cell, style: GoogleFonts.montserrat(
              color: isHeader ? hColor : Colors.white70,
              fontSize: 12, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            )),
          )).toList(),
        );
      }).toList(),
    );
  }
}