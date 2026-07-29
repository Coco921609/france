import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheminCimesAlsacePage extends StatefulWidget {
  const CheminCimesAlsacePage({super.key});

  @override
  State<CheminCimesAlsacePage> createState() => _CheminCimesAlsacePageState();
}

class _CheminCimesAlsacePageState extends State<CheminCimesAlsacePage> {
  @override
  Widget build(BuildContext context) {
    const Color vertCime = Color(0xFF27AE60);

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
                  'assets/images/55.jpg',
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
                      Text('مسار القمم 🌳',
                          style: GoogleFonts.cairo(
                              color: vertCime,
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 15),
                      Text("🇩🇪 لمسة من الغابة السوداء في الألزاس",
                          style: GoogleFonts.cairo(
                              color: vertCime.withOpacity(0.7),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic)),
                      const SizedBox(height: 25),
                      Text(
                          "يقع في قلب جبال الفوج الشمالية، ويدعوك مسار القمم لنزهة فريدة فوق رؤوس الأشجار. مسار بانورامي مذهل يوفر منظوراً غير مسبوق للغابة والمناظر الطبيعية المحيطة.",
                          style: GoogleFonts.cairo(
                              color: Colors.white, fontSize: 15, height: 1.6)),

                      // --- TARIFS ---
                      const SizedBox(height: 35),
                      _buildSectionTitle('🎟️ أسعار مسار القمم'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['النوع', 'السعر'],
                        ['بالغ', '15.00 €'],
                        ['طفل (4-14 سنة)*', '12.00 €'],
                        ['تذكرة عائلية', '39.00 €'],
                        ['سعر مخفض', '13.00 €'],
                        ['طفل أقل من 4 سنوات', 'مجاناً'],
                        ['الزحلوقة', '2.00 €'],
                      ], vertCime),
                      Text("*يجب أن يكون الأطفال دون سن 14 برفقة شخص بالغ.",
                          style: GoogleFonts.cairo(
                              color: Colors.white38, fontSize: 11)),

                      const SizedBox(height: 25),
                      _buildSectionTitle('💳 اشتراك الموسم'),
                      const SizedBox(height: 15),
                      _buildTable([
                        ['النوع', 'السعر'],
                        ['بالغ', '45.00 €'],
                        ['سعر مخفض', '39.00 €'],
                        ['طفل (4-14 سنة)', '32.00 €'],
                        ['تذكرة عائلية', '99.00 €'],
                      ], vertCime),

                      const SizedBox(height: 25),
                      _buildSectionTitle('🎫 تذاكر مشتركة'),
                      const SizedBox(height: 15),
                      Text("تذكرة عائلية (غابة المغامرات + مسار القمم) : 53.00 €",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14)),

                      // --- CALENDRIER ---
                      const SizedBox(height: 35),
                      _buildSectionTitle('🗓️ تقويم الفتح'),
                      const SizedBox(height: 15),
                      Text("الإغلاق السنوي: من نوفمبر إلى مارس.",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14)),
                      const SizedBox(height: 10),
                      _buildTable([
                        ['الفترة', 'التفاصيل'],
                        ['أبريل', '10ص-6م (مغلق: 1, 2, 7, 28)'],
                        ['مايو - يونيو', '10ص-7م (مغلق أيام الثلاثاء)'],
                        ['يوليو - سبتمبر', '10ص-7م (سبتمبر: مغلق الثلاثاء)'],
                        ['أكتوبر', '10ص-6م (مغلق: 6, 13)'],
                      ], vertCime),

                      // --- GALERIE ---
                      const SizedBox(height: 35),
                      _buildSectionTitle('📸 معرض الصور'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 220,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildGalleryImage('assets/images/54.jpg'),
                            _buildGalleryImage('assets/images/66.jpg'),
                            _buildGalleryImage('assets/images/33.jpg'),
                            _buildGalleryImage('assets/images/36.jpg'),
                          ],
                        ),
                      ),

                      // --- ACCÈS ---
                      const SizedBox(height: 35),
                      _buildSectionTitle('🚗 الوصول ومواقف السيارات'),
                      const SizedBox(height: 15),
                      Text(
                          "عنوان GPS: Route de Schoenenbourg, 67160 Drachenbronn.\n\nيرجى ركن سيارتك في الموقف المجاني الكبير بجانب مسبح 7 Fontaines. يوفر الموقف أماكن للسيارات والحافلات والدراجات ومحطتي شحن كهربائي. يمنع الوقوف على جوانب الطرق لأسباب تتعلق بالسلامة.",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14, height: 1.5)),

                      const SizedBox(height: 20),
                      _buildSectionTitle('🚌 الحافلة والمشي'),
                      const SizedBox(height: 15),
                      Text(
                          "توجد حافلة مجانية تأخذك من الموقف إلى المدخل. استمتع بطبيعة جبال الفوج أثناء الرحلة! \n\nتفضل المشي؟ يوجد مسار للمشي يوصلك للموقع في حوالي ساعة مع لوحات إرشادية ومناطق للاستراحة.",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14, height: 1.5)),

                      // --- INFOS SUPPLEMENTAIRES ---
                      const SizedBox(height: 35),
                      _buildSectionTitle('🗼 إطلالة 360 درجة'),
                      const SizedBox(height: 15),
                      Text(
                          "يصل البرج البانورامي إلى 29 متراً على 10 طوابق. متاح للكراسي المتحركة وعربات الأطفال. إطلالة فريدة على سهل الراين والغابة السوداء وجبال الفوج.\n\nحقائق: الطول 425م، الميل 6%.",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14, height: 1.5)),

                      const SizedBox(height: 20),
                      _buildSectionTitle('🎢 الزحلوقة'),
                      const SizedBox(height: 15),
                      Text(
                          "زحلوقة نفق بطول 75 متراً! السعر: 2 يورو/نزلة. متاحة من عمر 6 سنوات. مجانية لمن هم دون 6 سنوات برفقة شخص بالغ. مغلقة في حالة المطر أو الثلج.",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14, height: 1.5)),

                      const SizedBox(height: 20),
                      _buildSectionTitle('🌿 المسار'),
                      const SizedBox(height: 15),
                      Text(
                          "1050 متراً من المسارات الممهدة بين 5 و23 متراً من الارتفاع. ألعاب تعليمية ومسارات توازن عن الحيوانات المحلية (الوشق، القط البري) للتعلم أثناء الاستمتاع.",
                          style: GoogleFonts.cairo(
                              color: Colors.white70, fontSize: 14, height: 1.5)),

                      const SizedBox(height: 35),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            "⚠️ تحذير: الأسعار والأوقات قد تتغير خلال العام. تحقق من الظروف ومواعيد الفتح قبل الانطلاق.",
                            style: GoogleFonts.cairo(
                                color: Colors.orangeAccent,
                                fontSize: 13,
                                fontStyle: FontStyle.italic)),
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

  Widget _buildSectionTitle(String title) {
    return Text(title.toUpperCase(),
        style: GoogleFonts.cairo(
            color: const Color(0xFF27AE60),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2));
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

  Widget _buildTable(List<List<String>> data, Color hColor) {
    return Table(
      border: TableBorder.all(color: Colors.white10, width: 1),
      children: data.asMap().entries.map((entry) {
        bool isHeader = entry.key == 0;
        return TableRow(
          children: entry.value
              .map((cell) => Padding(
            padding: const EdgeInsets.all(10),
            child: Text(cell,
                style: GoogleFonts.cairo(
                  color: isHeader ? hColor : Colors.white70,
                  fontSize: 12,
                  fontWeight:
                  isHeader ? FontWeight.bold : FontWeight.normal,
                )),
          ))
              .toList(),
        );
      }).toList(),
    );
  }
}