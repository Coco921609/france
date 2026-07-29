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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. IMAGE DE HAUT (Intégrée au défilement global)
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/images/16.jpg',
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
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Aigues-Mortes Salt Marshes 🧂',
                          style: GoogleFonts.cinzel(color: const Color(0xFFF1C40F), fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    Text("✨ A touch of Bolivia (Salar de Uyuni) in the Gard",
                        style: GoogleFonts.montserrat(color: const Color(0xFFF1C40F).withOpacity(0.7), fontSize: 16, fontWeight: FontWeight.w600, fontStyle: FontStyle.italic)),
                    const SizedBox(height: 25),

                    Text("The salt marshes of Aigues-Mortes have a rich history dating back to antiquity. Already exploited by the Romans, they have shaped the Camargue landscape. Today, these marshes offer a surreal sight with their vibrant pink waters, a striking natural spectacle.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6)),
                    const SizedBox(height: 35),

                    _buildSectionTitle('Best time to visit'),
                    const SizedBox(height: 15),
                    Text("The best time is between June and July. I highly recommend going in mid-June to ensure you observe them under the best conditions.",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Opening hours'),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      children: [
                        _buildTableRow(['Period', 'Hours', 'Last adm.'], isHeader: true),
                        _buildTableRow(['Mar 1 - May 31', '10am - 6pm', '5pm']),
                        _buildTableRow(['Jun 1 - Aug 31', '9am - 7pm', '6pm']),
                        _buildTableRow(['Sep 1 - Oct 31', '10am - 6pm', '5pm']),
                        _buildTableRow(['Nov 1 - Feb 28', '10am - 5pm', '4pm']),
                      ],
                    ),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Little Train Rates (1h15)'),
                    const SizedBox(height: 10),
                    _buildPriceTable([
                      ['Type', 'Price'],
                      ['Adult', '14.00 €'],
                      ['Child (5-13 yrs)', '10.00 €'],
                      ['Child (3-4 yrs)', 'Free'],
                      ['Family Pack (2 ad. + 2 ch.)', '44.00 €'],
                    ]),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Walking Tour Rates'),
                    const SizedBox(height: 10),
                    _buildPriceTable([
                      ['Type', 'Price'],
                      ['Adult', '9.60 €'],
                      ['Child (5-13 yrs)', '7.20 €'],
                      ['Family Pack', '32.00 €'],
                    ]),
                    const SizedBox(height: 10),
                    Text("On foot at your own pace to explore spots and landscapes:\n- Remparts viewpoint trail (approx. 4 km) and/or Camelle viewpoint trail (approx. 4 km)\n- Or 12 km trail",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Cycling at your own pace (12 & 30 km)'),
                    const SizedBox(height: 10),
                    _buildPriceTable([
                      ['Type', 'Price'],
                      ['Adult (14+ yrs)', '22.30 €'],
                      ['Child (5-13 yrs)', '16.70 €'],
                    ]),
                    const SizedBox(height: 10),
                    Text("ELECTRIC BIKE RENTAL\nEnjoy a free ride with our electric bikes available on-site (no reservation, subject to availability).\nRate: 21.00 € (rental) + entry fee (12 or 30 km trail).",
                        style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.5)),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Overview'),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 220,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          _buildGalleryImage('assets/images/14.jpg'),
                          _buildGalleryImage('assets/images/15.jpg'),
                          _buildGalleryImage('assets/images/17.jpg'),
                          _buildGalleryImage('assets/images/18.jpg'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),
                    _buildSectionTitle('Essentials & Info'),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: const Color(0xFF1A1C20), borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.camera_alt, "Recommended photos: breathtaking landscapes."),
                          _buildTechRow(Icons.train, "Train: Book online. On-site is risky (often sold out)."),
                          _buildTechRow(Icons.water_drop, "Bring water: strong heat is possible."),
                          _buildTechRow(Icons.directions_walk, "Strollers and tricycles are allowed on foot."),
                          _buildTechRow(Icons.warning_amber, "Note: hours/prices are subject to change."),
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