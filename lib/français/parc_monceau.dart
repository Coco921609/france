import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParcMonceauPage extends StatefulWidget {
  const ParcMonceauPage({super.key});

  @override
  State<ParcMonceauPage> createState() => _ParcMonceauPageState();
}

class _ParcMonceauPageState extends State<ParcMonceauPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Or Royal / Monceau
    const Color orMonceau = Color(0xFFD4AF37);

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
                'assets/images/748523-visuel-paris-parc-monceau.jpg',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey[900]),
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
                      'Parc Monceau 🌳',
                      style: GoogleFonts.cinzel(
                        color: orMonceau,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine("Paris", "Ruines de Rome & Toscane", orMonceau),

                    const SizedBox(height: 25),

                    Text(
                      "🇮🇹 L'élégance italienne au cœur de Paris",
                      style: GoogleFonts.montserrat(
                        color: orMonceau.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Situé juste en face de l'Arc de Triomphe, ce parc est célèbre pour sa Naumachie (colonnade), sa pyramide et ses statues. On y retrouve l'atmosphère raffinée et antique des jardins italiens du XIXe siècle.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SAISONS
                    _buildSectionTitle('Meilleures saisons', orMonceau),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Saison', 'Conseil'],
                      ['🍂 Automne', 'Magnifique couleur des arbres'],
                      ['☀️ Été', 'Parfait pour la fraîcheur'],
                      ['🌱 Printemps', 'Floraison splendide'],
                      ['❄️ Hiver', 'À éviter (trop gris et froid)'],
                    ], orMonceau),

                    const SizedBox(height: 35),

                    // HORAIRES
                    _buildSectionTitle('Horaires conseillés', orMonceau),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Statut'],
                      ['✨ Matin tôt', 'Recommandé : Calme et lumière'],
                      ['🕛 12h - 14h', 'Éviter : Trop de monde'],
                      ['🌅 Soir', 'Idéal pour une balade chic'],
                    ], orMonceau),

                    const SizedBox(height: 35),

                    // GALERIE
                    _buildSectionTitle('Aperçu du lieu', orMonceau),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/748523-visuel-paris-parc-monceau.jpg'),
                          _buildGalleryImage('assets/images/a8510b36f4672d921734299f69550e4b.jpg'),
                          _buildGalleryImage('assets/images/monceau-parc-paris.jpg'),
                          _buildGalleryImage('assets/images/597232-visuel-paris-parc-monceau.jpg'),
                          _buildGalleryImage('assets/images/597244-visuel-paris-parc-monceau.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('Indispensables & infos', orMonceau),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.location_on_outlined, "En face de l'Arc de Triomphe", orMonceau),
                          _buildTechRow(Icons.photo_camera, "Camera : Idéal pour les portraits", orMonceau),
                          _buildTechRow(Icons.directions_run, "Parcours de footing très prisé", orMonceau),
                          _buildTechRow(Icons.pets, "Chiens en laisse autorisés", orMonceau),
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
          padding: EdgeInsets.symmetric(horizontal: 12),
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
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
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