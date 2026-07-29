import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MontSaintMichelPage extends StatefulWidget {
  const MontSaintMichelPage({super.key});

  @override
  State<MontSaintMichelPage> createState() => _MontSaintMichelPageState();
}

class _MontSaintMichelPageState extends State<MontSaintMichelPage> {
  @override
  Widget build(BuildContext context) {
    const Color orSable = Color(0xFFD4AF37);

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
                'assets/image/29.jpg',
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
                      'Le Mont Saint-Michel 🏰',
                      style: GoogleFonts.cinzel(
                        color: orSable,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Accès", "Gratuit et libre 24h/24", orSable),
                    _buildFactLine("Particularité", "Redevient une île aux grandes marées", orSable),
                    _buildFactLine("Air de", "St Michael's Mount (Cornouailles 🇬🇧)", orSable),

                    const SizedBox(height: 25),
                    Text(
                      "🌊 La Merveille de l'Occident",
                      style: GoogleFonts.montserrat(
                        color: orSable.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Véritable merveille architecturale, le Mont Saint-Michel est avant tout une commune dont l'accès au rocher est entièrement libre, de jour comme de nuit. Depuis qu'il redevient une île lors des grandes marées, l’approche par le pont-passerelle permet d'admirer l'arrivée sur ce chef-d'œuvre. Un lieu magique à rejoindre à pied, à vélo, ou grâce à la navette gratuite « Le Passeur ».",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU PÉRIODES
                    _buildSectionTitle('📅 Meilleures saisons', orSable),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Saison', 'Ambiance & Conseils'], isHeader: true, hColor: orSable),
                        _buildTableRow(['🌱 Printemps \n🍂 Automne', 'RECOMMANDÉ : Climat agréable, belles lumières et périodes idéales pour observer les grandes marées.']),
                        _buildTableRow(['❄️ Hiver', 'CALME : Venteux et frais, mais offre une atmosphère mystique et des ruelles presque désertes.']),
                        _buildTableRow(['☀️ Été', 'À ÉVITER : Très forte affluence touristique, les ruelles étroites deviennent rapidement impraticables.']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // TABLEAU HORAIRES
                    _buildSectionTitle('⏰ Horaires conseillés', orSable),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                      children: [
                        _buildTableRow(['Moment', 'Conseils'], isHeader: true, hColor: orSable),
                        _buildTableRow(['✨ Matin (tôt)', 'RECOMMANDÉ : Idéal pour parcourir les remparts en toute sérénité avant l\'arrivée des foules.']),
                        _buildTableRow(['🌙 Nuit', 'MAGIQUE : Accès au rocher libre 24h/24. Le Mont illuminé offre un spectacle inoubliable.']),
                        _buildTableRow(['☀️ 11h - 16h', 'À ÉVITER : Pic d\'affluence quotidien. Privilégiez ce moment pour visiter l\'Abbaye (payante).']),
                      ],
                    ),

                    const SizedBox(height: 35),

                    // GALERIE PHOTO
                    _buildSectionTitle('📸 Aperçu du lieu', orSable),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/25.jpg'),
                          _buildGalleryImage('assets/image/26.webp'),
                          _buildGalleryImage('assets/image/27.jpg'),
                          _buildGalleryImage('assets/image/30.jpg'),
                          _buildGalleryImage('assets/image/31.webp'),
                          _buildGalleryImage('assets/image/32.webp'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // INFOS PRATIQUES
                    _buildSectionTitle('📋 Indispensables & Infos', orSable),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.map_outlined, "Situé en Normandie", orSable),
                          _buildTechRow(Icons.directions_bus, "Navette « Le Passeur » gratuite depuis les parkings", orSable),
                          _buildTechRow(Icons.account_balance, "L'accès au village est gratuit. Seule l'Abbaye est payante.", orSable),
                          _buildTechRow(Icons.waves, "Attention : vérifier les horaires des marées avant toute sortie dans la baie", orSable),
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

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_forward, color: Colors.white24, size: 16),
          const SizedBox(width: 12),
          Expanded(child: Text(value, style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 16))),
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

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title, style: GoogleFonts.cinzel(color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white10,
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