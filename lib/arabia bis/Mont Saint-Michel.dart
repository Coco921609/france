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
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // 1. صورة الغلاف
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                child: Image.asset(
                  'assets/image/29.jpg',
                  fit: BoxFit.cover,
                ),
              ),

              // 2. المحتوى
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
                        'مون سان ميشيل 🏰',
                        style: GoogleFonts.cinzel(
                          color: orSable,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الوصول", "مفتوح مجاناً على مدار الساعة", orSable),
                      _buildFactLine("ميزة خاصة", "يتحول إلى جزيرة أثناء المد العالي", orSable),
                      _buildFactLine("تشبه", "جبل سانت مايكل (كورنوال 🇬🇧)", orSable),

                      const SizedBox(height: 25),
                      Text(
                        "🌊 أعجوبة الغرب",
                        style: GoogleFonts.montserrat(
                          color: orSable.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "أعجوبة معمارية حقيقية، مون سان ميشيل هي في الأساس بلدية ذات وصول مجاني للصخرة، ليلاً ونهاراً. وبما أنها تصبح جزيرة مرة أخرى أثناء المد العالي، فإن الاقتراب عبر جسر المشاة يتيح لك الاستمتاع بالوصول إلى هذه التحفة الفنية. مكان ساحر يمكن الوصول إليه سيراً على الأقدام، أو بالدراجة، أو باستخدام الحافلة المكوكية المجانية 'Le Passeur'.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول المواسم
                      _buildSectionTitle('📅 أفضل المواسم', orSable),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الموسم', 'الأجواء والنصائح'], isHeader: true, hColor: orSable),
                          _buildTableRow(['🌱 الربيع \n🍂 الخريف', 'موصى به: مناخ لطيف، إضاءة جميلة، وفترات مثالية لمراقبة المد العالي.']),
                          _buildTableRow(['❄️ الشتاء', 'الهدوء: عاصف ومنعش، لكنه يوفر أجواءً غامضة وشوارع ضيقة شبه مهجورة.']),
                          _buildTableRow(['☀️ الصيف', 'تجنبه: تدفق سياحي كبير جداً؛ تصبح الشوارع الضيقة غير سالكة بسرعة.']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // جدول الأوقات
                      _buildSectionTitle('⏰ الأوقات الموصى بها', orSable),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1), 1: FlexColumnWidth(2)},
                        children: [
                          _buildTableRow(['الوقت', 'نصائح'], isHeader: true, hColor: orSable),
                          _buildTableRow(['✨ الصباح الباكر', 'موصى به: مثالي للمشي على الأسوار بصفاء تام قبل وصول الحشود.']),
                          _buildTableRow(['🌙 الليل', 'ساحر: وصول مجاني للصخرة على مدار الساعة. يوفر المون المضاء مشهداً لا يُنسى.']),
                          _buildTableRow(['☀️ 11 ص - 4 م', 'تجنبه: ذروة التدفق اليومي. استخدم هذا الوقت لزيارة الدير (دخول مدفوع).']),
                        ],
                      ),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معاينة الموقع', orSable),
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

                      // معلومات عملية
                      _buildSectionTitle('📋 الأساسيات ومعلومات', orSable),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.map_outlined, "تقع في منطقة نورماندي", orSable),
                            _buildTechRow(Icons.directions_bus, "حافلة مكوكية مجانية 'Le Passeur' من مواقف السيارات", orSable),
                            _buildTechRow(Icons.account_balance, "الدخول إلى القرية مجاني. الدير فقط يتطلب تذكرة مدفوعة.", orSable),
                            _buildTechRow(Icons.waves, "تنبيه: تحقق من أوقات المد والجزر قبل أي رحلة في الخليج", orSable),
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

  // --- دوال مساعدة ---

  Widget _buildFactLine(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 12),
          const Icon(Icons.arrow_back, color: Colors.white24, size: 16),
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
      margin: const EdgeInsetsDirectional.only(end: 15),
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