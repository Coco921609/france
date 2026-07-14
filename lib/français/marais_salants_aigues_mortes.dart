import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaraisSalantsAiguesMortesPage extends StatefulWidget {
  const MaraisSalantsAiguesMortesPage({super.key});

  @override
  State<MaraisSalantsAiguesMortesPage> createState() => _MaraisSalantsAiguesMortesPageState();
}

class _MaraisSalantsAiguesMortesPageState extends State<MaraisSalantsAiguesMortesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.45,
            child: Image.asset(
              'assets/images/16.jpg',
              fit: BoxFit.cover,
            ),
          ),
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
                      child: Text('Marais Salants 🧂',
                          style: GoogleFonts.cinzel(color: const Color(0xFFF1C40F), fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    Text("✨ Un air de Bolivie (Salar de Uyuni) dans le Gard",
                        style: GoogleFonts.montserrat(color: const Color(0xFFF1C40F).withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 25),

                    Text("Les salins d'Aigues-Mortes ont une histoire riche remontant à l'Antiquité. Déjà exploités par les Romains, ils ont façonné le paysage camarguais. Aujourd'hui, ces marais offrent un paysage irréel avec leurs eaux roses éclatantes, un spectacle naturel saisissant.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6)),
                    const SizedBox(height: 35),

                    _buildSectionTitle('Meilleures périodes'),
                    const SizedBox(height: 15),
                    Text("La meilleure période est entre juin et juillet. Je vous conseille vivement d’y aller mi-juin afin d’être sûr de les observer dans les meilleures conditions.",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Horaires d\'ouverture'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      children: [
                        _buildTableRow(['Période', 'Horaires', 'Dernière adm.'], isHeader: true),
                        _buildTableRow(['1 Mars - 31 Mai', '10h - 18h', '17h']),
                        _buildTableRow(['1 Juin - 31 Août', '9h - 19h', '18h']),
                        _buildTableRow(['1 Sept - 31 Oct', '10h - 18h', '17h']),
                        _buildTableRow(['1 Nov - 28 Fév', '10h - 17h', '16h']),
                      ],
                    ),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Tarifs Petit Train (1h15)'),
                    const SizedBox(height: 10),
                    _buildPriceTable([
                      ['Type', 'Prix'],
                      ['Adulte', '14,00 €'],
                      ['Enfant (5-13 ans)', '10,00 €'],
                      ['Enfant (3-4 ans)', 'Gratuit'],
                      ['Forfait Famille (2 ad. + 2 enf.)', '44,00 €'],
                    ]),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Tarifs Balade à Pied'),
                    const SizedBox(height: 10),
                    _buildPriceTable([
                      ['Type', 'Prix'],
                      ['Adulte', '9,60 €'],
                      ['Enfant (5-13 ans)', '7,20 €'],
                      ['Forfait Famille', '32,00 €'],
                    ]),
                    const SizedBox(height: 10),
                    Text("À pied avec votre rythme pour profiler endroits et paysages :\n- Parcours point de vue Remparts (environ 4 kms) et/ou parcours point de vue Camelle (environ 4 kms)\n- Ou parcours 12 kms",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Vélo en liberté (12 km et 30 km)'),
                    const SizedBox(height: 10),
                    _buildPriceTable([
                      ['Type', 'Prix'],
                      ['Adulte (14 ans +)', '22,30 €'],
                      ['Enfant (5-13 ans)', '16,70 €'],
                    ]),
                    const SizedBox(height: 10),
                    Text("LOCATION DE VÉLO ÉLECTRIQUE\nProfitez d'une balade en toute liberté grâce à nos vélos électriques disponibles sur place (sans réservation, selon disponibilité).\nTarif : 21,00 € (location) + entrée (parcours 12 ou 30 km).",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Aperçu'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildGalleryImage('assets/images/14.jpg'),
                          _buildGalleryImage('assets/images/15.jpg'),
                          _buildGalleryImage('assets/images/17.jpg'),
                          _buildGalleryImage('assets/images/18.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Indispensables & Infos'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: const Color(0xFF1A1C20), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.camera_alt, "Photos recommandées : paysages à couper le souffle."),
                          _buildTechRow(Icons.train, "Train : Réservez vivement en ligne. Sur place, c'est risqué (train souvent complet)."),
                          _buildTechRow(Icons.water_drop, "Prévoyez de l'eau : forte chaleur possible."),
                          _buildTechRow(Icons.directions_walk, "Poussettes et tricycles acceptés à pied."),
                          _buildTechRow(Icons.warning_amber, "Attention : horaires/prix sujets à changement."),
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

  TableRow _buildTableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(children: cells.map((cell) => Padding(padding: const EdgeInsets.all(8), child: Text(cell, style: GoogleFonts.montserrat(color: isHeader ? const Color(0xFFF1C40F) : Colors.white70, fontSize: 11, fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)))).toList());
  }

  Widget _buildPriceTable(List<List<String>> data) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) => _buildTableRow(entry.value, isHeader: entry.key == 0)).toList(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title.toUpperCase(), style: GoogleFonts.cinzel(color: const Color(0xFFF1C40F), fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildGalleryImage(String path) {
    return Container(width: 280, margin: const EdgeInsets.only(right: 15), decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)));
  }

  Widget _buildTechRow(IconData icon, String label) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 8), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, color: const Color(0xFFF1C40F).withOpacity(0.5), size: 20), const SizedBox(width: 15), Expanded(child: Text(label, style: GoogleFonts.montserrat(color: Colors.white, fontSize: 13, height: 1.4)))]));
  }
}