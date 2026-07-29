import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PicCanigouPage extends StatefulWidget {
  const PicCanigouPage({super.key});

  @override
  State<PicCanigouPage> createState() => _PicCanigouPageState();
}

class _PicCanigouPageState extends State<PicCanigouPage> {
  @override
  Widget build(BuildContext context) {
    // لون السمة: البرتقالي الكتالوني (الشمس والأرض المعدنية)
    const Color canigouColor = Color(0xFFE67E22);

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
                  'assets/ima/24.jpg',
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
                        'قمة كانيغو ☀️',
                        style: GoogleFonts.cinzel(
                          color: canigouColor,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // --- حقائق أساسية ---
                      _buildFactLine("الموقع", "بيرينيه أورينتال (كتلة كانيغو)", canigouColor),
                      _buildFactLine("الارتفاع", "2784 متراً", canigouColor),
                      _buildFactLine("تشبه", "جبل أوليمبوس (اليونان 🇬🇷)", canigouColor),

                      const SizedBox(height: 25),
                      Text(
                        "⛰️ الجبل المقدس للكتالونيين",
                        style: GoogleFonts.montserrat(
                          color: canigouColor.withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "رمز قوي للهوية الكتالونية، تهيمن قمة كانيغو على سهل روسيون. كتلة من التناقضات، توفر وجوهاً منحدرة ووديان خصبة. سواء كنت تبحث عن نزهة عائلية أو تحدٍ تقني في مدخنتها الشهيرة، يروي كل مسار جانباً مختلفاً من هذا الجبل الذي لا يقهر.",
                        style: GoogleFonts.montserrat(color: Colors.white, fontSize: 15, height: 1.6),
                      ),
                      const SizedBox(height: 35),

                      // --- مسارات الرحلة ---
                      _buildSectionTitle('🥾 المسارات الستة', canigouColor),
                      const SizedBox(height: 20),
                      _buildRouteCard("1. مسار كورتايليت", "4 ساعات ذهاباً وإياباً | الكلاسيكية العائلية، واسعة ومحددة جيداً.", canigouColor),
                      _buildRouteCard("2. ملجأ مارياي", "6-7 ساعات ذهاباً وإياباً | انغماس بري في الغابات والمروج.", canigouColor),
                      _buildRouteCard("3. المدخنة", "7-8 ساعات ذهاباً وإياباً | تقنية: ممر صخري، يتطلب استخدام اليدين والقدمين.", canigouColor),
                      _buildRouteCard("4. الوجه الشمالي", "8 ساعات ذهاباً وإياباً | عزلة ومساحات مفتوحة، يبدأ عبر فيلول.", canigouColor),
                      _buildRouteCard("5. فيرني-لي-بان", "9-10 ساعات ذهاباً وإياباً | الصعود الكامل، متطلب ومجزٍ.", canigouColor),
                      _buildRouteCard("6. كول دو جو", "5-6 ساعات ذهاباً وإياباً | رياضي: منحدرات حادة لتدريب مكثف.", canigouColor),

                      const SizedBox(height: 35),

                      // معرض الصور
                      _buildSectionTitle('📸 معرض الصور', canigouColor),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/ima/24.jpg'),
                            _buildGalleryImage('assets/ima/23.jpg'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 35),

                      // نصائح عملية
                      _buildSectionTitle('📋 نصائح للبقاء', canigouColor),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1C20),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            _buildTechRow(Icons.water_drop, "الماء: أحضر كمية وافرة! الينابيع نادرة في بعض الأقسام.", canigouColor),
                            _buildTechRow(Icons.checkroom, "المعدات: تحقق من الطقس قبل المغادرة؛ طقس الجبال العالية يتغير بسرعة.", canigouColor),
                            _buildTechRow(Icons.terrain, "تقني: المدخنة ليست للجميع؛ قيم مدى ارتياحك مع المرتفعات.", canigouColor),
                            _buildTechRow(Icons.light_mode, "البداية: انطلق مبكراً، خاصة للمسارات التي تزيد عن 8 ساعات.", canigouColor),
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

  Widget _buildRouteCard(String title, String desc, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: GoogleFonts.montserrat(color: color, fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 5),
          Text(desc, style: GoogleFonts.montserrat(color: Colors.white60, fontSize: 13)),
        ],
      ),
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