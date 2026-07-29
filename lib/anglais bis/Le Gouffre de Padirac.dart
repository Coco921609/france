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
    // Theme color: Abyss Blue / Dark Turquoise (Underground waters)
    const Color bleuGouffre = Color(0xFF16A085);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // 1. TOP IMAGE
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              child: Image.asset(
                'assets/image/57.jpg',
                fit: BoxFit.cover,
              ),
            ),

            // 2. CONTENT
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
                      'Padirac Chasm 🕳️',
                      style: GoogleFonts.cinzel(
                        color: bleuGouffre,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    // --- KEY FACTS ---
                    _buildFactLine("Location", "Occitania (Lot)", bleuGouffre),
                    _buildFactLine("Type", "Natural cave & Underground river", bleuGouffre),
                    _buildFactLine("Looks like", "Quinta da Regaleira (Portugal 🇵🇹)", bleuGouffre),

                    const SizedBox(height: 25),
                    Text(
                      "A sublime journey 103 meters underground",
                      style: GoogleFonts.montserrat(
                        color: bleuGouffre.withOpacity(0.7),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "The Padirac Chasm is the premier underground heritage site in France. A monumental descent opens the doors to an incredible gallery leading to a mysterious river, where a boat ride orchestrated by guides begins amidst giant rock formations.",
                      style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                    ),
                    const SizedBox(height: 35),

                    // INDIVIDUAL TICKETS & RATES TABLE
                    _buildSectionTitle('💰 Individual Ticket Rates', bleuGouffre),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(1)},
                      children: [
                        _buildTableRow(['Option / Public', 'Rate'], isHeader: true, hColor: bleuGouffre),
                        _buildTableRow(['Self-Guided Tour - Adult (audioguide + boatman)', '24.00 €']),
                        _buildTableRow(['Self-Guided Tour - Child 4 to 12 years old', '18.00 €']),
                        _buildTableRow(['Self-Guided Tour - Under 4 years old (COMPULSORY ticket)', '0.00 €']),
                        _buildTableRow(['Self-Guided Tour - Child over 12 and student', '22.00 €']),
                        _buildTableRow(['♿ Disabled Visitor Admission - Adult', '22.00 €']),
                        _buildTableRow(['♿ Disabled Visitor Admission - Child 4-12 years old', '16.00 €']),
                        _buildTableRow(['♿ Disabled Visitor Admission - Accompanying person', '22.00 €']),
                        _buildTableRow(['✨ EXPLORERS EVENING - Adult rate', '150.00 €']),
                        _buildTableRow(['✨ EXPLORERS EVENING - Child 4-12 years old', '80.00 €']),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // GROUP RATES TABLE
                    _buildSectionTitle('👥 Adult & Mixed Groups (from 20 people)', bleuGouffre),
                    const SizedBox(height: 15),
                    Table(
                      border: TableBorder.all(color: Colors.white10, width: 1),
                      children: [
                        _buildTableRow(['Audioguided Ticket', 'Low Season', 'High Season'], isHeader: true, hColor: bleuGouffre),
                        _buildTableRow(['Adult', '16.00 €', '21.60 €']),
                        _buildTableRow(['Child over 12 years old', '14.80 €', '19.80 €']),
                        _buildTableRow(['Child 4 to 12 years old', '11.20 €', '16.20 €']),
                        _buildTableRow(['Child under 4 years old', 'free', 'free']),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // VIP EXPERIENCES
                    _buildSectionTitle('👑 Exclusive VIP Experiences', bleuGouffre),
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
                            "• CLASSIC VIP TOUR (Champagne and sweet delicacies)\n  From 1 to 4 visitors: 480.00€\n  Additional adult visitor: 120.00€\n  Additional visitor 4-12 years old: 75.00€\n  Child under 4 years old: free",
                            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.6),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "• VIP TASTING TOUR (130th Anniversary Cuvée and savory delicacies)\n  From 1 to 4 visitors: 500.00€\n  Additional adult visitor: 125.00€\n  Additional visitor 4-12 years old: 75.00€\n  Child under 4 years old: free",
                            style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.6),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),

                    // PHOTO GALLERY (Before advice)
                    _buildSectionTitle('📸 Gallery', bleuGouffre),
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

                    // PRACTICAL INFO / SURVIVAL TIPS
                    _buildSectionTitle('📋 Survival tips', bleuGouffre),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1C20),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          _buildTechRow(Icons.ac_unit, "Constant temperature at 13°C: warm clothing required", bleuGouffre),
                          _buildTechRow(Icons.scuba_diving, "Humid environment: bring appropriate footwear", bleuGouffre),
                          _buildTechRow(Icons.schedule, "Hours vary by season (e.g., 9:30 AM - 5:30 PM | 8:00 AM - 9:30 PM)", bleuGouffre),
                          _buildTechRow(Icons.timer, "Tour duration: approximately 1h30", bleuGouffre),
                          _buildTechRow(Icons.no_accounts, "Last admission: 1h45 before closing", bleuGouffre),
                          _buildTechRow(Icons.not_interested, "Route not accessible / Pets forbidden", bleuGouffre),
                          _buildTechRow(Icons.child_care, "Baby carrier recommended (Strollers excluded)", bleuGouffre),
                          _buildTechRow(Icons.info_outline, "VIP offers subject to availability, payment upon ordering", bleuGouffre),
                          _buildTechRow(Icons.warning_amber, "Note: prices and hours may change during the year", bleuGouffre),
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