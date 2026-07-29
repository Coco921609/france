import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrguesIlleSurTetPage extends StatefulWidget {
  const OrguesIlleSurTetPage({super.key});

  @override
  State<OrguesIlleSurTetPage> createState() => _OrguesIlleSurTetPageState();
}

class _OrguesIlleSurTetPageState extends State<OrguesIlleSurTetPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thématique : Ocre / Terre Cuite
    const Color ocreDesert = Color(0xFFD35400);

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
                'assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg',
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
                      "Les Orgues d'Ille 🏜️",
                      style: GoogleFonts.cinzel(
                        color: ocreDesert,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildTranslationLine(
                        "Ille-sur-Têt", "Un air de Cappadoce (Turquie)", ocreDesert),

                    const SizedBox(height: 25),

                    Text(
                      "🇹🇷 Le Far West des Pyrénées-Orientales",
                      style: GoogleFonts.montserrat(
                        color: ocreDesert.withOpacity(0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Un paysage minéral unique en France. Ces cheminées de fées sculptées par l'érosion offrent un décor lunaire qui rappelle les canyons américains ou la Cappadoce.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    _buildSectionTitle('Saisons & périodes', ocreDesert),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Période', 'Recommandation'],
                      ['🌸 Printemps', 'Idéal (climat doux et belle lumière)'],
                      ['🍂 Automne', 'Recommandé (couleurs ocre flamboyantes)'],
                      ['☀️ Été', 'À éviter l\'après-midi (forte chaleur)'],
                      ['❄️ Hiver', 'Possible (vue dégagée sur le Canigou)'],
                    ], ocreDesert),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Horaires & durée', ocreDesert),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Informations'],
                      ['Visite libre', 'Environ 45 minutes à 1h30'],
                      ['Dernière entrée', '1h avant la fermeture du site'],
                      ['Conseil', 'Privilégier le matin pour éviter l\'attente'],
                    ], ocreDesert),

                    const SizedBox(height: 35),

                    // --- SECTION TARIFS ---
                    _buildSectionTitle('Tarifs', ocreDesert),
                    const SizedBox(height: 10),
                    Text(
                      "⚠️ Attention : Les tarifs sont donnés à titre indicatif et peuvent varier selon la saison ou l'année.",
                      style: GoogleFonts.montserrat(
                          color: Colors.white54,
                          fontSize: 13,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    const SizedBox(height: 15),
                    _buildTable([
                      ['Type', 'Prix'],
                      ['Adulte (Plein tarif)', '5,00 €'],
                      ['Tarif réduit*', '4,00 €'],
                      ['Enfant (10-13 ans)', '3,50 €'],
                      ['Moins de 10 ans', 'Gratuit'],
                    ], ocreDesert),
                    const SizedBox(height: 10),
                    Text(
                      "*Tarif réduit : justificatif requis (adolescents, étudiants, demandeurs d'emploi).",
                      style: GoogleFonts.montserrat(
                          color: Colors.white70, fontSize: 12),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Galerie photos', ocreDesert),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/108ff4_bbb7dcb34a5d4da58a2da3b0ff554797~mv2.jpg'),
                          _buildGalleryImage('assets/images/108ff4_42ce7b69795d4eb78a54e21727265149~mv2.avif'),
                          _buildGalleryImage('assets/images/orgues-ille-sur-tet-55.jpg'),
                          _buildGalleryImage('assets/images/visiter-orgues-illes-sur-tet-camping-latour-de-france-commune-pyrenees-orientales.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    _buildSectionTitle('Infos pratiques', ocreDesert),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.confirmation_number_outlined, "Achat en ligne recommandé", ocreDesert),
                          _buildTechRow(Icons.timer_outlined, "Prévoir environ 1h de marche", ocreDesert),
                          _buildTechRow(Icons.wb_sunny_outlined, "Peu d'ombre, prévoir de l'eau", ocreDesert),
                          _buildTechRow(Icons.camera_enhance_outlined, "Lumière idéale en fin de journée", ocreDesert),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          path,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.white10,
            child: const Icon(Icons.broken_image, color: Colors.white24),
          ),
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