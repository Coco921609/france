import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'accueil.dart';

// ==========================================
// 1. THEME DESIGN SYSTEM
// ==========================================
class BubbleTheme {
  static const Color background = Color(0xFF0B0E17);
  static const Color cardDark = Color(0xFF161B26);
  static const Color cardBorder = Color(0xFF232B3E);
  static const Color primaryGradientStart = Color(0xFF6366F1);
  static const Color primaryGradientEnd = Color(0xFFEC4899);
  static const Color accentGold = Color(0xFFF59E0B);
  static const Color textLight = Color(0xFFF8FAFC);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color coral = Color(0xFFFF5252);
}

// ==========================================
// 2. REDIRECTION COMPATIBLE ACCUEIL
// ==========================================
class IdeesPage extends StatelessWidget {
  final String languageCode;
  final Color themeColor;

  const IdeesPage({
    super.key,
    required this.languageCode,
    required this.themeColor,
  });

  @override
  Widget build(BuildContext context) {
    return ParametresScreen(languageCode: languageCode);
  }
}

// ==========================================
// 3. PAGE DES PARAMÈTRES ET MODIFICATION
// ==========================================
class ParametresScreen extends StatefulWidget {
  final String languageCode;
  const ParametresScreen({super.key, this.languageCode = 'fr'});

  @override
  State<ParametresScreen> createState() => _ParametresScreenState();
}

class _ParametresScreenState extends State<ParametresScreen> {
  final TextEditingController _nameController = TextEditingController();

  String _selectedGenre = 'Homme';
  Color _selectedThemeColor = const Color(0xFF6366F1);
  String _selectedAvatar = '👨';
  late String _currentLang;
  bool _hasNameError = false;
  bool _isLoading = true;

  final List<Color> _themeColors = [
    const Color(0xFF6366F1),
    const Color(0xFFEC4899),
    const Color(0xFFEF4444),
    const Color(0xFFF59E0B),
    const Color(0xFF10B981),
    const Color(0xFF3B82F6),
  ];

  final List<String> _avatarsHommes = [
    '👨', '👨‍🦰', '👨‍🦱', '👨‍🦳', '🧔', '👦', '🤵', '👨‍🚀', '👨‍✈️', '🧑‍💼', '🕵️‍♂️', '🥷'
  ];

  final List<String> _avatarsFemmes = [
    '👩', '👩‍🦰', '👩‍🦱', '👩‍🦳', '👱‍♀️', '👰', '💃', '👸', '👩‍💻', '👩‍🎨', '👩‍🚀', '👩‍🔬'
  ];

  final Map<String, Map<String, String>> _localizedText = {
    'fr': {
      'title': 'Paramètres',
      'subtitle': 'Modifier vos informations et préférences',
      'nameLabel': 'Nom et prénom',
      'nameHint': 'Entrez votre nom complet',
      'genreLabel': 'Sélectionnez votre genre',
      'genreMan': 'Homme',
      'genreWoman': 'Femme',
      'themeLabel': 'Couleur du thème',
      'langLabel': 'Langue de l\'application',
      'avatarLabel': 'Choisissez votre avatar',
      'button': 'Valider les modifications',
      'langFr': 'Français',
      'langEn': 'Anglais',
      'langAr': 'Arabe',
    },
    'en': {
      'title': 'Settings',
      'subtitle': 'Update your profile information',
      'nameLabel': 'Full Name',
      'nameHint': 'Enter your full name',
      'genreLabel': 'Select your gender',
      'genreMan': 'Male',
      'genreWoman': 'Female',
      'themeLabel': 'Theme color',
      'langLabel': 'App language',
      'avatarLabel': 'Choose your avatar',
      'button': 'Save Changes',
      'langFr': 'French',
      'langEn': 'English',
      'langAr': 'Arabic',
    },
    'ar': {
      'title': 'الإعدادات',
      'subtitle': 'تعديل معلوماتك وتفضيلاتك',
      'nameLabel': 'الاسم واللقب',
      'nameHint': 'أدخل اسمك الكامل',
      'genreLabel': 'حدد جنسك',
      'genreMan': 'رجل',
      'genreWoman': 'امرأة',
      'themeLabel': 'لون المظهر',
      'langLabel': 'لغة التطبيق',
      'avatarLabel': 'اختر صورتك الرمزية',
      'button': 'حفظ التغييرات',
      'langFr': 'الفرنسية',
      'langEn': 'الإنجليزية',
      'langAr': 'العربية',
    },
  };

  @override
  void initState() {
    super.initState();
    _currentLang = widget.languageCode;
    _loadCurrentUserData();
  }

  Future<void> _loadCurrentUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('user_name') ?? '';
      _selectedGenre = prefs.getString('user_gender') ?? 'Homme';
      _currentLang = prefs.getString('user_lang') ?? widget.languageCode;
      _selectedAvatar = prefs.getString('user_avatar') ?? '👨';
      final int? savedColorValue = prefs.getInt('user_theme_color');
      if (savedColorValue != null) {
        _selectedThemeColor = Color(savedColorValue);
      }
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _validateAndSave() async {
    final bool nameEmpty = _nameController.text.trim().isEmpty;

    if (nameEmpty) {
      setState(() {
        _hasNameError = true;
      });
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', _nameController.text.trim());
    await prefs.setString('user_gender', _selectedGenre);
    await prefs.setInt('user_theme_color', _selectedThemeColor.value);
    await prefs.setString('user_lang', _currentLang);
    await prefs.setString('user_avatar', _selectedAvatar);
    await prefs.setBool('is_profile_created', true);

    if (!mounted) return;

    // Transmet la couleur, la langue, le nom et l'avatar à l'écran d'accueil
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => AccueilScreen(
          userName: _nameController.text.trim(),
          languageCode: _currentLang,
          selectedAvatar: _selectedAvatar,
          themeColor: _selectedThemeColor,
        ),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: BubbleTheme.background,
        body: Center(
          child: CircularProgressIndicator(color: BubbleTheme.primaryGradientStart),
        ),
      );
    }

    final t = _localizedText[_currentLang] ?? _localizedText['fr']!;
    final isRtl = _currentLang == 'ar';
    final currentAvatars = (_selectedGenre == 'Homme' || _selectedGenre == 'Man' || _selectedGenre == 'رجل')
        ? _avatarsHommes
        : _avatarsFemmes;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TITRE DE LA PAGE
                Center(
                  child: Column(
                    children: [
                      Text(
                        t['title']!,
                        style: const TextStyle(
                          color: BubbleTheme.textLight,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        t['subtitle']!,
                        style: const TextStyle(
                          color: BubbleTheme.textMuted,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // 1. NOM ET PRÉNOM
                Text(
                  t['nameLabel']!,
                  style: const TextStyle(color: BubbleTheme.textLight, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: BubbleTheme.cardDark,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: _hasNameError ? BubbleTheme.coral : BubbleTheme.cardBorder,
                      width: _hasNameError ? 2 : 1,
                    ),
                  ),
                  child: TextField(
                    controller: _nameController,
                    style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                    onChanged: (val) {
                      if (_hasNameError && val.trim().isNotEmpty) {
                        setState(() {
                          _hasNameError = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outline_rounded, color: BubbleTheme.textMuted, size: 20),
                      hintText: t['nameHint'],
                      hintStyle: TextStyle(
                        color: _hasNameError ? BubbleTheme.coral.withOpacity(0.8) : BubbleTheme.textMuted.withOpacity(0.6),
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // 2. GENRE
                Text(
                  t['genreLabel']!,
                  style: const TextStyle(color: BubbleTheme.textLight, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildGenreButton(
                        label: t['genreMan']!,
                        icon: Icons.male_rounded,
                        isSelected: _selectedGenre == 'Homme' || _selectedGenre == 'Man' || _selectedGenre == 'رجل',
                        onTap: () {
                          setState(() {
                            _selectedGenre = t['genreMan']!;
                            _selectedAvatar = _avatarsHommes[0];
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildGenreButton(
                        label: t['genreWoman']!,
                        icon: Icons.female_rounded,
                        isSelected: _selectedGenre == 'Femme' || _selectedGenre == 'Woman' || _selectedGenre == 'امرأة',
                        onTap: () {
                          setState(() {
                            _selectedGenre = t['genreWoman']!;
                            _selectedAvatar = _avatarsFemmes[0];
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 3. COULEUR DU THÈME
                Text(
                  t['themeLabel']!,
                  style: const TextStyle(color: BubbleTheme.textLight, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _themeColors.map((color) {
                    final isSelected = _selectedThemeColor.value == color.value;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedThemeColor = color;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.white : Colors.transparent,
                            width: 2.5,
                          ),
                          boxShadow: isSelected
                              ? [
                            BoxShadow(
                              color: color.withOpacity(0.6),
                              blurRadius: 14,
                              spreadRadius: 2,
                            ),
                          ]
                              : [],
                        ),
                        child: isSelected ? const Icon(Icons.check_rounded, color: Colors.white, size: 22) : null,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 26),

                // 4. AVATAR
                Text(
                  t['avatarLabel']!,
                  style: const TextStyle(color: BubbleTheme.textLight, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 14),
                Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          _selectedThemeColor,
                          _selectedThemeColor.withOpacity(0.3),
                          Colors.transparent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: BubbleTheme.cardDark,
                        border: Border.all(color: Colors.white.withOpacity(0.15), width: 1.5),
                      ),
                      child: Center(
                        child: Text(
                          _selectedAvatar,
                          style: const TextStyle(fontSize: 48),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: currentAvatars.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 6,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final avatar = currentAvatars[index];
                    final isSelected = avatar == _selectedAvatar;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedAvatar = avatar;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? _selectedThemeColor.withOpacity(0.2)
                              : BubbleTheme.cardDark,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isSelected ? _selectedThemeColor : BubbleTheme.cardBorder,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            avatar,
                            style: TextStyle(
                              fontSize: isSelected ? 24 : 20,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 26),

                // 5. LANGUE DE L'APPLICATION
                Text(
                  t['langLabel']!,
                  style: const TextStyle(color: BubbleTheme.textLight, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _buildLangButton('fr', t['langFr']!),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLangButton('en', t['langEn']!),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildLangButton('ar', t['langAr']!),
                    ),
                  ],
                ),
                const SizedBox(height: 36),

                // BOUTON VALIDER
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: _selectedThemeColor,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: _selectedThemeColor.withOpacity(0.4),
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    onPressed: _validateAndSave,
                    child: Text(
                      t['button']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenreButton({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? _selectedThemeColor.withOpacity(0.18) : BubbleTheme.cardDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? _selectedThemeColor : BubbleTheme.cardBorder,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : BubbleTheme.textMuted,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : BubbleTheme.textMuted,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLangButton(String code, String label) {
    final isSelected = _currentLang == code;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentLang = code;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? _selectedThemeColor.withOpacity(0.18) : BubbleTheme.cardDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? _selectedThemeColor : BubbleTheme.cardBorder,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : BubbleTheme.textMuted,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}