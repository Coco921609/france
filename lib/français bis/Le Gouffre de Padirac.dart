import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeGouffreDePadiracPage extends StatefulWidget {
  const LeGouffreDePadiracPage({super.key});

  @override
  State<LeGouffreDePadiracPage> createState() => _LeGouffreDePadiracPageState();
}

class _LeGouffreDePadiracPageState extends State<LeGouffreDePadiracPage> {
  @override
  Widget build(BuildContext context) {
    // Couleur thème: Bleu Abysse / Turquoise sombre (Eaux souterraines)
    const Color bleuGouffre = Color(0xFF16A085);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/image/57.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENU
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
                      'Le Gouffre de Padirac 🕳️',
                      style: GoogleFonts.cinzel(
                        color: bleuGouffre,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- FAITS CLÉS ---
                    _buildFactLine("Localisation", "Occitanie (Lot)", bleuGouffre),
                    _buildFactLine("Type", "Cavité naturelle & Rivière souterraine", bleuGouffre),
                    _buildFactLine("Air de", "Quinta da Regaleira (Portugal 🇵🇹)", bleuGouffre),

                    const SizedBox(height: 25),
                    Text(
                      "Sublime voyage à 103 mètres sous terre",
                      style: GoogleFonts.montserrat(
                        color: bleuGouffre.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Le Gouffre de Padirac est le premier site du patrimoine souterrain en France. Une descente monumentale vous ouvre les portes d'une incroyable galerie menant à une rivière mystérieuse, où commence une promenade en barque orchestrée par les bateliers au milieu de concrétions géantes.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // TABLEAU ACCÈS & TARIFS INDIVIDUELS
                    _buildSectionTitle('💰 Grille des Tarifs Individuels', bleuGouffre),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(1)},
                      children: [
                        _buildTableRow(['Formule / Public', 'Tarif'], isHeader: true, hColor: bleuGouffre),
                        _buildTableRow(['Visite Libre - Adulte (audioguide + batelier)', '24.00 €']),
                        _buildTableRow(['Visite Libre - Enfant de 4 à 12 ans', '18.00 €']),
                        _buildTableRow(['Visite Libre - Moins de 4 ans (Billet OBLIGATOIRE)', '0.00 €']),
                        _buildTableRow(['Visite Libre - Enfant +12 ans et étudiant', '22.00 €']),
                        _buildTableRow(['♿ Entrée PSH Adulte', '22.00 €']),
                        _buildTableRow(['♿ Entrée PSH Enfant 4-12 ans', '16.00 €']),
                        _buildTableRow(['♿ Entrée PSH accompagnateur', '22.00 €']),
                        _buildTableRow(['✨ SOIRÉE EXPLORATEURS - Tarif adulte', '150.00 €']),
                        _buildTableRow(['✨ SOIRÉE EXPLORATEURS - Enfant 4-12 ans', '80.00 €']),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // TABLEAU TARIFS GROUPES
                    _buildSectionTitle('👥 Groupes d’Adultes & Mixtes (dès 20 pers.)', bleuGouffre),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      children: [
                        _buildTableRow(['Billet Audioguidé', 'Basse Saison', 'Haute Saison'], isHeader: true, hColor: bleuGouffre),
                        _buildTableRow(['Adulte', '16.00 €', '21.60 €']),
                        _buildTableRow(['Enfant de + de 12 ans', '14.80 €', '19.80 €']),
                        _buildTableRow(['Enfant de 4 à 12 ans', '11.20 €', '16.20 €']),
                        _buildTableRow(['Enfant de moins de 4 ans', 'gratuit', 'gratuit']),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // EXPERIENCES VIP
                    _buildSectionTitle('👑 Expériences VIP Exclusives', bleuGouffre),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "• VISITE VIP CLASSIQUE (Champagne et mets sucrés)\n  De 1 à 4 visiteurs : 480.00€\n  Visiteur supplémentaire adulte : 120.00€\n  Visiteur supplémentaire 4-12 ans : 75.00€\n  Enfant de - de 4 ans : gratuit",
                            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.6),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "• VISITE VIP DÉGUSTATION (Cuvée des 130 ans et mets salés)\n  De 1 à 4 visiteurs : 500.00€\n  Visiteur supplémentaire adulte : 125.00€\n  Visiteur supplémentaire 4-12 ans : 75.00€\n  Enfant de - de 4 ans : gratuit",
                            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.6),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),

                    // GALERIE PHOTO (Avant les conseils)
                    _buildSectionTitle('📸 Galerie', bleuGouffre),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/image/59.jpg'),
                          _buildGalleryImage('assets/image/60.jpg'),
                          _buildGalleryImage('assets/image/61.jpg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),

                    // INFOS PRATIQUES / CONSEILS DE SURVIE
                    _buildSectionTitle('📋 Conseils de survie', bleuGouffre),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.ac_unit, "Température constante à 13°C : vêtement chaud requis", bleuGouffre),
                          _buildTechRow(Icons.scuba_diving, "Milieu humide : prévoyez des chaussures adaptées", bleuGouffre),
                          _buildTechRow(Icons.schedule, "Horaires selon saison (ex: 9h30-17h30 | 8h00-21h30)", bleuGouffre),
                          _buildTechRow(Icons.timer, "Durée de la visite : environ 1h30", bleuGouffre),
                          _buildTechRow(Icons.no_accounts, "Dernière admission : 1h45 avant la fermeture", bleuGouffre),
                          _buildTechRow(Icons.not_interested, "Parcours non adapté / Animaux interdits", bleuGouffre),
                          _buildTechRow(Icons.child_care, "Porte bébé recommandé (Poussettes exclues)", bleuGouffre),
                          _buildTechRow(Icons.info_outline, "Offres VIP soumises à disponibilité, règlement à la commande", bleuGouffre),
                          _buildTechRow(Icons.warning_amber, "Attention : les prix et horaires peuvent changer au cours de l'année", bleuGouffre),
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