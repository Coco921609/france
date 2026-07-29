import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LacDAllosPage extends StatefulWidget {
  const LacDAllosPage({super.key});

  @override
  State<LacDAllosPage> createState() => _LacDAllosPageState();
}

class _LacDAllosPageState extends State<LacDAllosPage> {
  @override
  Widget build(BuildContext context) {
    const Color bleuEau = Color(0xFF5DADE2);

    return Scaffold(
      backgroundColor: const Color(0xFF0B0C0E),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. IMAGE DE HAUT (Intégrée au défilement global)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/20.jpg',
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
                        child: Text(
                          'بحيرة ألوس 🇳🇴',
                          style: GoogleFonts.cairo(
                              color: bleuEau, fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "🏔️ لمسة من طبيعة النرويج في قلب جبال الألب",
                        style: GoogleFonts.cairo(
                            color: bleuEau.withOpacity(0.7),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "تقع بحيرة ألوس على ارتفاع 2228 متراً، وهي أكبر بحيرة طبيعية شاهقة الارتفاع في أوروبا. بمياهها الصافية المحاطة بقمم جبلية وعرة، توفر مشهداً يشبه المضايق النرويجية، مما يدعو للتأمل والاسترخاء في أحضان الطبيعة البرية.",
                        style: GoogleFonts.cairo(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      _buildSectionTitle('المواسم والتقويم', bleuEau),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['الموسم', 'نصيحة'],
                        ['🍂 الخريف', 'ألوان مذهلة للأشجار.'],
                        ['🌱 الربيع', 'هواء نقي، الطبيعة تستيقظ.'],
                        ['❄️ الشتاء/الصيف', 'يُفضل تجنبها (صعوبة الوصول/الزحام).'],
                      ], bleuEau),

                      const SizedBox(height: 35),
                      _buildSectionTitle('الأوقات الموصى بها', bleuEau),
                      const SizedBox(height: 15),
                      Text(
                        "للاستمتاع بالهدوء وأجمل الإضاءة، نوصي بالصباح الباكر (قبل الساعة 9 صباحاً). تجنب الفترة من 12 ظهراً إلى 3 عصراً، حيث تكون أكثر ازدحاماً.",
                        style: GoogleFonts.cairo(color: Colors.white70, fontSize: 13, height: 1.5),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('نظرة على المكان', bleuEau),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/21.jpg'),
                            _buildGalleryImage('assets/images/22.jpg'),
                            _buildGalleryImage('assets/images/23.jpg'),
                            _buildGalleryImage('assets/images/24.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),
                      _buildSectionTitle('معلومات عملية', bleuEau),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xFF1A1C20),
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.camera_alt,
                                "كاميرا لا غنى عنها، خاصة في الخريف: غروب الشمس فوق ألوان الأشجار ساحر.", bleuEau),
                            _buildTechRow(Icons.hiking, "يُرجى ارتداء أحذية مشي مناسبة.", bleuEau),
                            _buildTechRow(Icons.landscape,
                                "منطقة محمية: يُرجى البقاء على المسارات المحددة.", bleuEau),
                            _buildTechRow(Icons.thermostat,
                                "درجات حرارة باردة في المرتفعات: يُرجى تجهيز ملابس دافئة.", bleuEau),
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
      ),
    );
  }

  // --- HELPERS ---

  Widget _buildSectionTitle(String title, Color color) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cairo(
            color: color, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2));
  }

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value.map((cell) => Padding(
            padding: const EdgeInsets.all(12),
            child: Text(cell,
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(
                  color: isHeader ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                )),
          )).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildGalleryImage(String path) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(left: 15),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color.withOpacity(0.5), size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Text(label,
                textAlign: TextAlign.right,
                style: GoogleFonts.cairo(color: Colors.white, fontSize: 13, height: 1.4)),
          ),
        ],
      ),
    );
  }
}