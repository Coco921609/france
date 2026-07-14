import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class PalaisIdealPage extends StatefulWidget {
  const PalaisIdealPage({super.key});

  @override
  State<PalaisIdealPage> createState() => _PalaisIdealPageState();
}

class _PalaisIdealPageState extends State<PalaisIdealPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Pierre Chaude / Sable Drômois
    const Color pierreChaude = Color(0xFFC2A383);

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
              'assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // 2. CONTENU DÉFILABLE
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
                      'Palais idéal 🏰',
                      style: GoogleFonts.cinzel(
                        color: pierreChaude,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // ANALOGIE & LIEU
                    _buildTranslationLine(
                        "Hauterives", "Temples d'Angkor (Cambodge)", pierreChaude),

                    const SizedBox(height: 25),

                    Text(
                      "🇰🇭 Un air de Cambodge au cœur de la Drôme",
                      style: GoogleFonts.montserrat(
                        color: pierreChaude.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Édifié par un seul homme, le facteur Ferdinand Cheval, ce palais est un monument unique au monde. Ses façades sculptées rappellent les temples hindous et l'architecture organique d'Asie du Sud-Est.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // SAISONS
                    _buildSectionTitle('Meilleures saisons', pierreChaude),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Saison', 'Conseil'],
                      ['🌸 Printemps', 'Idéal : Températures douces'],
                      ['🍂 Automne', 'Superbe avec les couleurs ambrées'],
                      ['☀️ Été', 'Beaucoup de monde, privilégier le matin'],
                      ['❄️ Hiver', 'Calme mais très froid (Drôme)'],
                    ], pierreChaude),

                    const SizedBox(height: 35),

                    // HORAIRES
                    _buildSectionTitle('Horaires de visite', pierreChaude),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Moment', 'Statut'],
                      ['✨ Matin', 'Recommandé : Lumière douce'],
                      ['🕛 12h - 14h', 'Moins de foule'],
                      ['🕓 Après-midi', 'À éviter : Forte affluence'],
                    ], pierreChaude),

                    const SizedBox(height: 35),

                    // --- SECTION TARIFS ---
                    _buildSectionTitle('Tarifs généraux', pierreChaude),
                    const SizedBox(height: 10),
                    Text(
                      "⚠️ Attention : Les prix sont susceptibles de changer selon la saison.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white54, fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Catégorie', 'Tarif'],
                      ['Adulte', '8 €'],
                      ['Réduit*', '6 €'],
                      ['Enfants (3-16 ans)', '5 €'],
                      ['Moins de 5 ans', 'Gratuit'],
                      ['Audioguide', '+ 2 €'],
                    ], pierreChaude),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "*Réduit : Étudiants, demandeurs d'emploi, situation de handicap.",
                        style: GoogleFonts.montserrat(color: Colors.white38, fontSize: 11),
                      ),
                    ),

                    const SizedBox(height: 25),

                    _buildSectionTitle('Tarifs groupes', pierreChaude),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type de groupe', 'Tarif'],
                      ['Enfants (+15 pers.)', '4 € / enfant'],
                      ['Chauffeurs de bus', 'Gratuit'],
                    ], pierreChaude),

                    const SizedBox(height: 35),

                    // GALERIE
                    _buildSectionTitle('Aperçu du lieu', pierreChaude),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/Palais-Ideal-du-Facteur-Cheval-1.jpg'),
                          _buildGalleryImage('assets/images/Palais-ideal-une.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-1.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-2.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-11.jpg'),
                          _buildGalleryImage('assets/images/palais-facteur-cheval-architecture-9.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('Indispensables', pierreChaude),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.camera_enhance_outlined,
                              "Appareil photo indispensable", pierreChaude),
                          _buildTechRow(Icons.map_outlined,
                              "Situé à Hauterives (Drôme)", pierreChaude),
                          _buildTechRow(Icons.language,
                              "Réservation en ligne conseillée", pierreChaude),
                          _buildTechRow(Icons.auto_awesome,
                              "Classé monument historique", pierreChaude),
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