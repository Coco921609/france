import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentierDesOcresPage extends StatefulWidget {
  const SentierDesOcresPage({super.key});

  @override
  State<SentierDesOcresPage> createState() => _SentierDesOcresPageState();
}

class _SentierDesOcresPageState extends State<SentierDesOcresPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Ocre Brûlé / Sable Arizona
    const Color ocreArizona = Color(0xFFC5A059);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          // 1. IMAGE DE FOND FIXE (HAUT)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/des-ocres-des-couleurs.jpg',
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
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Sentier des ocres 🏜️',
                        style: GoogleFonts.cinzel(
                          color: ocreArizona,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "🇺🇸 Un air d'Arizona aux USA",
                      style: GoogleFonts.montserrat(
                        color: ocreArizona.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 25),

                    Text(
                      "Imaginez-vous transporté au cœur du Far West, sans même quitter l'Hexagone. "
                          "À Roussillon, la terre s'embrase pour dévoiler des falaises sculptées aux nuances de feu. 🎨",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SECTION CALENDRIER
                    _buildSectionTitle('Calendrier de visite', ocreArizona),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Statut', 'Saisons & Ambiance'],
                      ['✅ Top', 'Automne (Arbres d\'or) & Printemps'],
                      ['☀️ Ok', 'Été (Magnifique mais très chaud)'],
                      ['❌ Éviter', 'Hiver (Grisaille et froid)'],
                    ], ocreArizona),

                    const SizedBox(height: 35),

                    // SECTION HORAIRES
                    _buildSectionTitle('Créneaux horaires', ocreArizona),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Conseils selon saison'],
                      ['✨ Idéal', 'Tôt le matin ou +17h (Été/Pr)'],
                      ['🌅 Top', '11h - 15h (Automne/Hiver)'],
                      ['🚫 Éviter', '12h - 16h en plein été'],
                    ], ocreArizona),

                    const SizedBox(height: 35),

                    // SECTION GALERIE
                    _buildSectionTitle('Aperçu du lieu', ocreArizona),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/des-ocres-des-couleurs (1).jpg'),
                          _buildGalleryImage('assets/images/photo0jpg.jpg'),
                          _buildGalleryImage('assets/images/de-belles-couleurs.jpg'),
                          _buildGalleryImage('assets/images/photo4jpg.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // SECTION INFOS PRATIQUES
                    _buildSectionTitle('Indispensables & infos', ocreArizona),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "🧭 2 parcours (30 ou 60 min)"),
                          _buildTechRow(Icons.directions_run, "👟 Adieu les baskets blanches !"),
                          _buildTechRow(Icons.water_drop_outlined, "Gourde d'eau indispensable"),
                          _buildTechRow(Icons.euro_symbol, "🎟️ Tarif : ~3,50€ (à vérifier)"),
                          _buildTechRow(Icons.cleaning_services_rounded, "Chaussures sombres (l'ocre tâche)"),
                          _buildTechRow(Icons.no_food_outlined, "Pique-nique interdit sur site"),
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

  // --- MÉTHODES HELPERS ---

  Widget _buildCircleBtn(IconData icon, VoidCallback tap) => CircleAvatar(
    backgroundColor: Colors.black45,
    child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 18), onPressed: tap),
  );

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: data.asMap().entries.map((entry) {
        int idx = entry.key;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              cell,
              style: GoogleFonts.montserrat(
                color: idx == 0 ? hColor : Colors.white70,
                fontSize: 12,
                fontWeight: idx == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ))
              .toList(),
        );
      }).toList(),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Text(
      title.toUpperCase(),
      style: GoogleFonts.cinzel(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280, // Largeur harmonisée avec le Parc Monceau
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white24, size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.montserrat(
                  color: Colors.white, fontSize: 13, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}