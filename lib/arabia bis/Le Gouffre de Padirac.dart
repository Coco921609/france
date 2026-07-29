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
    // لون السمة: أزرق هاوية / فيروزي داكن (مياه جوفية)
    const Color bleuGouffre = Color(0xFF16A085);

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
                  'assets/image/57.jpg',
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
                        'هاوية باديراك 🕳️',
                        style: GoogleFonts.cinzel(
                          color: bleuGouffre,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "أوكسيتاني (لوت)", bleuGouffre),
                      _buildFactLine("النوع", "تكهف طبيعي ونهر جوفي", bleuGouffre),
                      _buildFactLine("تشبه", "كوينتا دا ريغاليرا (البرتغال 🇵🇹)", bleuGouffre),

                      const SizedBox(height: 25),
                      Text(
                        "رحلة رائعة على عمق 103 أمتار تحت الأرض",
                        style: GoogleFonts.montserrat(
                          color: bleuGouffre.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "تُعد هاوية باديراك الموقع التراثي الجوفي الأول في فرنسا. هبوط هائل يفتح أبواب معرض لا يصدق يؤدي إلى نهر غامض، حيث تبدأ رحلة بالقوارب يديرها ملاحون وسط تكوينات صخرية عملاقة.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // جدول الأسعار الفردية
                      _buildSectionTitle('💰 شبكة الأسعار الفردية', bleuGouffre),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        columnWidths: const {0: FlexColumnWidth(1.5), 1: FlexColumnWidth(1)},
                        children: [
                          _buildTableRow(['الباقة / الجمهور', 'السعر'], isHeader: true, hColor: bleuGouffre),
                          _buildTableRow(['جولة ذاتية - بالغ (دليل صوتي + ملاح)', '24.00 €']),
                          _buildTableRow(['جولة ذاتية - طفل من 4 إلى 12 سنة', '18.00 €']),
                          _buildTableRow(['جولة ذاتية - أقل من 4 سنوات (تذكرة إلزامية)', '0.00 €']),
                          _buildTableRow(['جولة ذاتية - طفل +12 سنة وطالب', '22.00 €']),
                          _buildTableRow(['♿ دخول بالغ من ذوي الإعاقة', '22.00 €']),
                          _buildTableRow(['♿ دخول طفل من ذوي الإعاقة 4-12 سنة', '16.00 €']),
                          _buildTableRow(['♿ دخول (مرافق الشخص ذوي الإعاقة)', '22.00 €']),
                          _buildTableRow(['✨ أمسيات المستكشف - سعر البالغ', '150.00 €']),
                          _buildTableRow(['✨ أمسيات المستكشف - طفل 4-12 سنة', '80.00 €']),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // جدول أسعار المجموعات
                      _buildSectionTitle('👥 مجموعات البالغين والمختلطة (من 20 شخصاً)', bleuGouffre),
                      const SizedBox(height: 15),
                      Table(
                        border: TableBorder.all(color: Colors.white10, width: 1),
                        children: [
                          _buildTableRow(['تذكرة الدليل الصوتي', 'الموسم المنخفض', 'الموسم العالي'], isHeader: true, hColor: bleuGouffre),
                          _buildTableRow(['بالغ', '16.00 €', '21.60 €']),
                          _buildTableRow(['طفل +12 سنة', '14.80 €', '19.80 €']),
                          _buildTableRow(['طفل 4-12 سنة', '11.20 €', '16.20 €']),
                          _buildTableRow(['طفل أقل من 4 سنوات', 'مجاناً', 'مجاناً']),
                        ],
                      ),
                      const SizedBox(height: 25),

                      // تجارب VIP
                      _buildSectionTitle('👑 تجارب VIP حصرية', bleuGouffre),
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
                              "• جولة VIP كلاسيكية (شمبانيا وحلويات)\n  من 1 إلى 4 زوار: 480.00€\n  زائر بالغ إضافي: 120.00€\n  زائر طفل إضافي 4-12 سنة: 75.00€\n  طفل أقل من 4 سنوات: مجاناً",
                              style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.6),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "• جولة VIP تذوق (نبيذ الذكرى الـ130 ومقبلات مالحة)\n  من 1 إلى 4 زوار: 500.00€\n  زائر بالغ إضافي: 125.00€\n  زائر طفل إضافي 4-12 سنة: 75.00€\n  طفل أقل من 4 سنوات: مجاناً",
                              style: GoogleFonts.montserrat(color: Colors.white70, fontSize: 13, height: 1.6),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', bleuGouffre),
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

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', bleuGouffre),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.ac_unit, "درجة حرارة ثابتة 13 درجة مئوية: ملابس دافئة مطلوبة", bleuGouffre),
                            _buildTechRow(Icons.scuba_diving, "بيئة رطبة: أحضر أحذية مناسبة", bleuGouffre),
                            _buildTechRow(Icons.schedule, "ساعات العمل تختلف حسب الموسم", bleuGouffre),
                            _buildTechRow(Icons.timer, "مدة الزيارة: حوالي ساعة ونصف", bleuGouffre),
                            _buildTechRow(Icons.no_accounts, "آخر دخول: ساعة و45 دقيقة قبل الإغلاق", bleuGouffre),
                            _buildTechRow(Icons.not_interested, "المسار غير متاح للمعاقين / الحيوانات الأليفة ممنوعة", bleuGouffre),
                            _buildTechRow(Icons.child_care, "يوصى بحمالة أطفال (عربات الأطفال مستبعدة)", bleuGouffre),
                            _buildTechRow(Icons.info_outline, "عروض VIP خاضعة للتوفر، الدفع عند الطلب", bleuGouffre),
                            _buildTechRow(Icons.warning_amber, "ملاحظة: الأسعار والساعات قد تتغير طوال العام", bleuGouffre),
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