import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacSainteCroixPage extends StatefulWidget {
  const LacSainteCroixPage({super.key});

  @override
  State<LacSainteCroixPage> createState() => _LacSainteCroixPageState();
}

class _LacSainteCroixPageState extends State<LacSainteCroixPage> {
  @override
  Widget build(BuildContext context) {
    const Color turquoise = Color(0xFF40E0D0);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND FIXE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/image/2.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. PANNEAU DE CONTENU DÉFILABLE
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
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lac de Sainte-Croix 🛶',
                      style: GoogleFonts.cinzel(
                        color: turquoise,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇺🇸 Le Grand Canyon du Verdon caché en Provence",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Le joyau azur du Verdon",
                      style: GoogleFonts.montserrat(
                        color: turquoise.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Étendu sur 2 200 hectares, le lac de Sainte-Croix est le joyau azur du Parc Naturel Régional du Verdon. Véritable mer intérieure, il offre des paysages grandioses où les falaises calcaires plongent dans des eaux turquoise.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU DES SPOTS
                    _buildSectionTitle('🌅 Top 7 spots de coucher de soleil'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(2.5)},
                      children: [
                        _buildTableRow(['Spot', 'Ambiance'], isHeader: true, hColor: turquoise),
                        _buildTableRow(['Col d’Illoire', 'Vue combinée gorges + lac']),
                        _buildTableRow(['Chapelle St-Pierre', 'Belvédère très photogénique']),
                        _buildTableRow(['Pont de Galetas', 'Lumière "carte postale"']),
                        _buildTableRow(['Château d’Aiguines', 'Panorama villageois facile']),
                        _buildTableRow(['Plage du Galetas', 'Reflets sur l\'eau, détente']),
                        _buildTableRow(['Plage Chabassole', 'Ambiance nature et calme']),
                        _buildTableRow(['Chemins Aiguines', 'Replis secrets si vent/foule']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // NOUVELLE SECTION PLAGES
                    _buildSectionTitle('🏖️ Les plages de Sainte-Croix'),
                    const SizedBox(height: 15),
                    Text(
                      "Réparties autour du village, plusieurs petites criques offrent un accès privilégié au lac :",
                      style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    _buildBeachCard("La plage de la Grange", "Facile d'accès depuis le centre, cette plage permet de profiter des eaux du lac dans un cadre naturel préservé."),
                    _buildBeachCard("La plage de la Fontaine", "Plus confidentielle et discrète, elle offre un accès direct au rivage pour une baignade en toute quiétude."),
                    _buildBeachCard("La plage Bellevue", "Comme son nom l'indique, elle offre un panorama exceptionnel et une atmosphère plus apaisée, loin de l'effervescence principale."),

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
                          _buildGalleryImage('assets/image/3.jpg'),
                          _buildGalleryImage('assets/image/4.jpg'),
                          _buildGalleryImage('assets/image/5.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU SAISONS
                    _buildSectionTitle('📅 Guide des saisons'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Saison', 'Conseil'], isHeader: true, hColor: turquoise),
                        _buildTableRow(['Printemps', 'Eaux hautes, nature verte']),
                        _buildTableRow(['Été', 'Coucher tardif, très fréquenté']),
                        _buildTableRow(['Automne', 'Lumière idéale (Septembre)']),
                        _buildTableRow(['Hiver', 'Atmosphère sauvage, calme']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Infos pratiques'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.wb_sunny_outlined, "Météo : Vérifier impérativement avant départ", turquoise),
                          _buildTechRow(Icons.calendar_today, "Saison idéale : Septembre (climat & calme)", turquoise),
                          _buildTechRow(Icons.access_time, "Horaires : Privilégier le matin ou fin de journée", turquoise),
                          _buildTechRow(Icons.euro_symbol, "Prix : Accès lac gratuit (Parking payant)", turquoise),
                          _buildTechRow(Icons.warning_amber_rounded, "À éviter : Milieu de journée en été (affluence)", turquoise),
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

  // --- MÉTHODES DE STYLE ---

  Widget _buildBeachCard(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.montserrat(color: const Color(0xFF40E0D0), fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 5),
          Text(desc, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),
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

  Widget _buildSectionTitle(String title) {
    return Text(title, style: GoogleFonts.cinzel(color: const Color(0xFF40E0D0), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
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