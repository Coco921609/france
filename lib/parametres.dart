import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'accueil.dart';

// ==========================================
// THEME DESIGN SYSTEM (aligné sur ModernTheme)
// ==========================================
class BubbleTheme {
  static const Color background = ModernTheme.background;
  static const Color cardDark = ModernTheme.surfaceCard;
  static const Color cardBorder = ModernTheme.borderLight;
  static const Color primaryGradientStart = ModernTheme.primaryAccent;
  static const Color primaryGradientEnd = ModernTheme.secondaryAccent;
  static const Color accentGold = ModernTheme.gold;
  static const Color textLight = ModernTheme.textLight;
  static const Color textMuted = ModernTheme.textMuted;
  static const Color coral = Color(0xFFFF5C6C);
}

// ==========================================
// WRAPPER COMPATIBLE ACCUEIL
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
  Widget build(BuildContext context) => ParametresScreen(languageCode: languageCode);
}

// ==========================================
// PAGE PARAMÈTRES
// ==========================================
class ParametresScreen extends StatefulWidget {
  final String languageCode;
  const ParametresScreen({super.key, this.languageCode = 'fr'});

  @override
  State<ParametresScreen> createState() => _ParametresScreenState();
}

class _ParametresScreenState extends State<ParametresScreen> with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _nameFocus = FocusNode();

  String _selectedGenre = 'Homme';
  Color _selectedThemeColor = const Color(0xFF6366F1);
  String _selectedAvatar = '👨';
  late String _currentLang;
  bool _hasNameError = false;
  bool _isLoading = true;
  bool _isSaving = false;

  late final AnimationController _entryCtrl =
  AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
  late final Animation<double> _fadeAnim =
  CurvedAnimation(parent: _entryCtrl, curve: Curves.easeOutCubic);
  late final AnimationController _ringCtrl =
  AnimationController(vsync: this, duration: const Duration(seconds: 9))..repeat();

  final List<Color> _themeColors = [
    const Color(0xFF6366F1),
    const Color(0xFFEC4899),
    const Color(0xFFEF4444),
    const Color(0xFFF59E0B),
    const Color(0xFF10B981),
    const Color(0xFF3B82F6),
  ];

  final List<String> _avatarsHommes = [
    '👨', '👨‍🦰', '👨‍🦱', '👨‍🦳', '🧔', '👦', '🤵', '👨‍🚀', '👨‍✈️', '🧑‍💼', '🕵️‍♂️', '🥷',
  ];
  final List<String> _avatarsFemmes = [
    '👩', '👩‍🦰', '👩‍🦱', '👩‍🦳', '👱‍♀️', '👰', '💃', '👸', '👩‍💻', '👩‍🎨', '👩‍🚀', '👩‍🔬',
  ];

  final Map<String, Map<String, String>> _loc = {
    'fr': {
      'title': 'Paramètres',
      'subtitle': 'Personnalisez votre profil',
      'namePlaceholder': 'Votre nom',
      'nameLabel': 'Nom et prénom',
      'nameHint': 'Entrez votre nom complet',
      'genreLabel': 'Genre',
      'genreMan': 'Homme',
      'genreWoman': 'Femme',
      'themeLabel': 'Couleur du thème',
      'langLabel': 'Langue',
      'avatarLabel': 'Avatar',
      'button': 'Enregistrer',
      'langFr': 'Français',
      'langEn': 'Anglais',
      'langAr': 'Arabe',
      'nameError': 'Le nom est requis',
      'section1': 'Identité',
      'section2': 'Apparence',
      'section3': 'Préférences',
    },
    'en': {
      'title': 'Settings',
      'subtitle': 'Customize your profile',
      'namePlaceholder': 'Your name',
      'nameLabel': 'Full Name',
      'nameHint': 'Enter your full name',
      'genreLabel': 'Gender',
      'genreMan': 'Male',
      'genreWoman': 'Female',
      'themeLabel': 'Theme color',
      'langLabel': 'Language',
      'avatarLabel': 'Avatar',
      'button': 'Save',
      'langFr': 'French',
      'langEn': 'English',
      'langAr': 'Arabic',
      'nameError': 'Name is required',
      'section1': 'Identity',
      'section2': 'Appearance',
      'section3': 'Preferences',
    },
    'ar': {
      'title': 'الإعدادات',
      'subtitle': 'خصّص ملفك الشخصي',
      'namePlaceholder': 'اسمك',
      'nameLabel': 'الاسم واللقب',
      'nameHint': 'أدخل اسمك الكامل',
      'genreLabel': 'الجنس',
      'genreMan': 'رجل',
      'genreWoman': 'امرأة',
      'themeLabel': 'لون المظهر',
      'langLabel': 'اللغة',
      'avatarLabel': 'الصورة الرمزية',
      'button': 'حفظ التغييرات',
      'langFr': 'الفرنسية',
      'langEn': 'الإنجليزية',
      'langAr': 'العربية',
      'nameError': 'الاسم مطلوب',
      'section1': 'الهوية',
      'section2': 'المظهر',
      'section3': 'التفضيلات',
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
    if (!mounted) return;
    setState(() {
      _nameController.text = prefs.getString('user_name') ?? '';
      _selectedGenre = prefs.getString('user_gender') ?? 'Homme';
      _currentLang = prefs.getString('user_lang') ?? widget.languageCode;
      _selectedAvatar = prefs.getString('user_avatar') ?? '👨';
      final cv = prefs.getInt('user_theme_color');
      if (cv != null) _selectedThemeColor = Color(cv);
      _isLoading = false;
    });
    _entryCtrl.forward();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    _entryCtrl.dispose();
    _ringCtrl.dispose();
    super.dispose();
  }

  Future<void> _validateAndSave() async {
    if (_nameController.text.trim().isEmpty) {
      setState(() => _hasNameError = true);
      HapticFeedback.heavyImpact();
      return;
    }
    setState(() => _isSaving = true);
    HapticFeedback.mediumImpact();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', _nameController.text.trim());
    await prefs.setString('user_gender', _selectedGenre);
    await prefs.setInt('user_theme_color', _selectedThemeColor.value);
    await prefs.setString('user_lang', _currentLang);
    await prefs.setString('user_avatar', _selectedAvatar);
    await prefs.setBool('is_profile_created', true);

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => AccueilScreen(
          userName: _nameController.text.trim(),
          languageCode: _currentLang,
          selectedAvatar: _selectedAvatar,
          themeColor: _selectedThemeColor,
        ),
      ),
          (_) => false,
    );
  }

  bool _isMan() =>
      _selectedGenre == 'Homme' || _selectedGenre == 'Male' || _selectedGenre == 'رجل';

  // ==========================================================================
  //  BUILD
  // ==========================================================================
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: ModernTheme.background,
        body: LuxBackdrop(
          color: _selectedThemeColor,
          child: Center(child: CircularProgressIndicator(color: _selectedThemeColor)),
        ),
      );
    }

    final Map<String, String> t = _loc[_currentLang] ?? _loc['fr']!;
    final bool isRtl = _currentLang == 'ar';
    final MediaQueryData mq = MediaQuery.of(context);
    final List<String> avatars = _isMan() ? _avatarsHommes : _avatarsFemmes;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: ModernTheme.background,
        body: LuxBackdrop(
          color: _selectedThemeColor,
          child: FadeTransition(
            opacity: _fadeAnim,
            child: Stack(
              children: [
                CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    SliverToBoxAdapter(child: _buildHeader(t, isRtl, mq)),
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 130 + mq.padding.bottom),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          // ========= IDENTITÉ
                          _sectionCard(
                            icon: Icons.person_rounded,
                            title: t['section1']!,
                            children: [
                              _fieldLabel(t['nameLabel']!),
                              const SizedBox(height: 10),
                              _buildNameField(t),
                              if (_hasNameError)
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(start: 6, top: 8),
                                  child: Text(
                                    t['nameError']!,
                                    style: const TextStyle(
                                      color: BubbleTheme.coral,
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 22),
                              _fieldLabel(t['genreLabel']!),
                              const SizedBox(height: 10),
                              _buildGenderSwitch(t),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // ========= APPARENCE
                          _sectionCard(
                            icon: Icons.palette_rounded,
                            title: t['section2']!,
                            children: [
                              _fieldLabel(t['themeLabel']!),
                              const SizedBox(height: 14),
                              _buildThemeColors(),
                              const SizedBox(height: 26),
                              _fieldLabel(t['avatarLabel']!),
                              const SizedBox(height: 14),
                              _buildAvatarGrid(avatars),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // ========= PRÉFÉRENCES
                          _sectionCard(
                            icon: Icons.translate_rounded,
                            title: t['section3']!,
                            children: [
                              _fieldLabel(t['langLabel']!),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  _langTile('fr', '🇫🇷', t['langFr']!),
                                  const SizedBox(width: 8),
                                  _langTile('en', '🇬🇧', t['langEn']!),
                                  const SizedBox(width: 8),
                                  _langTile('ar', '🇸🇦', t['langAr']!),
                                ],
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),

                // ---- Bouton Enregistrer flottant ----
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildSaveBar(t, mq),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  //  EN-TÊTE : avatar vivant + aperçu du nom
  // ==========================================================================
  Widget _buildHeader(Map<String, String> t, bool isRtl, MediaQueryData mq) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, mq.padding.top + 12, 20, 0),
      child: Column(
        children: [
          Row(
            children: [
              if (Navigator.canPop(context))
                LuxPress(
                  onTap: () => Navigator.pop(context),
                  child: LuxGlass(
                    radius: 22,
                    width: 44,
                    height: 44,
                    alignment: Alignment.center,
                    child: Icon(
                      isRtl ? Icons.arrow_forward_ios_rounded : Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      textDirection: TextDirection.ltr,
                      color: ModernTheme.textLight,
                    ),
                  ),
                )
              else
                const SizedBox(width: 44, height: 44),
              Expanded(
                child: Text(
                  t['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ModernTheme.textLight,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 44, height: 44),
            ],
          ),
          const SizedBox(height: 22),
          _buildAvatarHero(),
          const SizedBox(height: 18),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: _nameController,
            builder: (context, value, _) {
              final String name = value.text.trim();
              return Text(
                name.isEmpty ? t['namePlaceholder']! : name,
                textAlign: TextAlign.center,
                style: luxDisplay(
                  34,
                  rtl: isRtl,
                  letterSpacing: -0.8,
                  color: name.isEmpty ? Colors.white.withOpacity(0.35) : Colors.white,
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          Text(
            t['subtitle']!,
            style: const TextStyle(
              color: ModernTheme.textMuted,
              fontSize: 13.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarHero() {
    return SizedBox(
      width: 136,
      height: 136,
      child: AnimatedBuilder(
        animation: _ringCtrl,
        builder: (context, _) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _selectedThemeColor.withOpacity(0.42),
                      blurRadius: 54,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              CustomPaint(
                size: const Size(136, 136),
                painter: LuxRingPainter(
                  angle: _ringCtrl.value * 2 * math.pi,
                  color: _selectedThemeColor,
                ),
              ),
              Container(
                width: 106,
                height: 106,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [ModernTheme.surfaceCard, ModernTheme.surface],
                  ),
                  border: Border.all(color: Colors.white.withOpacity(0.08), width: 1),
                ),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 260),
                    transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                    child: Text(
                      _selectedAvatar,
                      key: ValueKey<String>(_selectedAvatar),
                      style: const TextStyle(fontSize: 56),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // ==========================================================================
  //  CARTES DE SECTION
  // ==========================================================================
  Widget _sectionCard({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return LuxGlass(
      radius: 30,
      fillOpacity: 0.055,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: _selectedThemeColor.withOpacity(0.16),
                  border: Border.all(color: _selectedThemeColor.withOpacity(0.45), width: 1),
                ),
                child: Icon(icon, color: _selectedThemeColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: ModernTheme.textLight,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          ...children,
        ],
      ),
    );
  }

  Widget _fieldLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: ModernTheme.textMuted,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // ==========================================================================
  //  CHAMP NOM
  // ==========================================================================
  Widget _buildNameField(Map<String, String> t) {
    return AnimatedBuilder(
      animation: _nameFocus,
      builder: (context, _) {
        final bool focused = _nameFocus.hasFocus;
        final bool active = focused || _hasNameError;
        final Color border = _hasNameError
            ? BubbleTheme.coral
            : (focused ? _selectedThemeColor : Colors.white.withOpacity(0.12));
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black.withOpacity(0.28),
            border: Border.all(color: border, width: active ? 1.6 : 1),
            boxShadow: active
                ? [BoxShadow(color: border.withOpacity(0.28), blurRadius: 16)]
                : [],
          ),
          child: TextField(
            controller: _nameController,
            focusNode: _nameFocus,
            cursorColor: _selectedThemeColor,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.words,
            onChanged: (v) {
              if (_hasNameError && v.trim().isNotEmpty) {
                setState(() => _hasNameError = false);
              }
            },
            style: const TextStyle(
              color: ModernTheme.textLight,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: t['nameHint'],
              hintStyle: const TextStyle(
                color: ModernTheme.textMuted,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              filled: false,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 17),
              prefixIcon: Icon(
                Icons.person_rounded,
                size: 21,
                color: focused ? _selectedThemeColor : ModernTheme.textMuted,
              ),
              suffixIcon: _hasNameError
                  ? const Icon(Icons.error_outline_rounded, color: BubbleTheme.coral, size: 21)
                  : null,
            ),
          ),
        );
      },
    );
  }

  // ==========================================================================
  //  GENRE : interrupteur à pastille glissante
  // ==========================================================================
  Widget _buildGenderSwitch(Map<String, String> t) {
    final bool man = _isMan();

    Widget segment(IconData icon, String label, bool selected, VoidCallback onTap) {
      return Expanded(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(
            height: 50,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 21,
                    color: selected ? Colors.white : ModernTheme.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      color: selected ? Colors.white : ModernTheme.textMuted,
                      fontSize: 14.5,
                      fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      height: 56,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(0.28),
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            alignment: man ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  gradient: luxGradient(_selectedThemeColor),
                  boxShadow: [
                    BoxShadow(
                      color: _selectedThemeColor.withOpacity(0.5),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              segment(Icons.man_rounded, t['genreMan']!, man, () {
                HapticFeedback.selectionClick();
                setState(() {
                  _selectedGenre = t['genreMan']!;
                  if (!_avatarsHommes.contains(_selectedAvatar)) {
                    _selectedAvatar = _avatarsHommes.first;
                  }
                });
              }),
              segment(Icons.woman_rounded, t['genreWoman']!, !man, () {
                HapticFeedback.selectionClick();
                setState(() {
                  _selectedGenre = t['genreWoman']!;
                  if (!_avatarsFemmes.contains(_selectedAvatar)) {
                    _selectedAvatar = _avatarsFemmes.first;
                  }
                });
              }),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================================
  //  COULEUR DU THÈME + AVATARS
  // ==========================================================================
  Widget _buildThemeColors() {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 6,
      runSpacing: 12,
      children: _themeColors.map((color) {
        final bool selected = color.value == _selectedThemeColor.value;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            HapticFeedback.selectionClick();
            setState(() => _selectedThemeColor = color);
          },
          child: SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                width: selected ? 38 : 30,
                height: selected ? 38 : 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  border: Border.all(
                    color: selected ? Colors.white : Colors.white.withOpacity(0.14),
                    width: selected ? 2.5 : 1,
                  ),
                  boxShadow: selected
                      ? [
                    BoxShadow(
                      color: color.withOpacity(0.6),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                      : [],
                ),
                child: selected
                    ? const Icon(Icons.check_rounded, color: Colors.white, size: 20)
                    : null,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAvatarGrid(List<String> avatars) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: avatars.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (_, i) {
        final String av = avatars[i];
        final bool selected = av == _selectedAvatar;
        return GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            setState(() => _selectedAvatar = av);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              color: selected
                  ? _selectedThemeColor.withOpacity(0.2)
                  : Colors.black.withOpacity(0.22),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: selected ? _selectedThemeColor : Colors.white.withOpacity(0.08),
                width: selected ? 1.8 : 1,
              ),
              boxShadow: selected
                  ? [BoxShadow(color: _selectedThemeColor.withOpacity(0.38), blurRadius: 12)]
                  : [],
            ),
            child: Center(
              child: AnimatedScale(
                scale: selected ? 1.18 : 1.0,
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutBack,
                child: Text(av, style: const TextStyle(fontSize: 21)),
              ),
            ),
          ),
        );
      },
    );
  }

  // ==========================================================================
  //  LANGUE
  // ==========================================================================
  Widget _langTile(String code, String flag, String label) {
    final bool sel = _currentLang == code;
    return Expanded(
      child: LuxPress(
        onTap: () {
          HapticFeedback.selectionClick();
          setState(() => _currentLang = code);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: sel ? _selectedThemeColor.withOpacity(0.18) : Colors.black.withOpacity(0.22),
            border: Border.all(
              color: sel ? _selectedThemeColor : Colors.white.withOpacity(0.1),
              width: sel ? 1.6 : 1,
            ),
            boxShadow: sel
                ? [BoxShadow(color: _selectedThemeColor.withOpacity(0.3), blurRadius: 14)]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(flag, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: sel ? Colors.white : ModernTheme.textMuted,
                  fontSize: 12.5,
                  fontWeight: sel ? FontWeight.w800 : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================================
  //  BARRE D'ENREGISTREMENT
  // ==========================================================================
  Widget _buildSaveBar(Map<String, String> t, MediaQueryData mq) {
    return Stack(
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ModernTheme.background.withOpacity(0.0),
                    ModernTheme.background.withOpacity(0.94),
                    ModernTheme.background,
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 38, 20, mq.padding.bottom + 16),
          child: LuxPress(
            onTap: _isSaving ? null : _validateAndSave,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: luxGradient(_selectedThemeColor),
                boxShadow: [
                  BoxShadow(
                    color: _selectedThemeColor.withOpacity(0.5),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Center(
                child: _isSaving
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                )
                    : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_rounded, color: Colors.white, size: 22),
                    const SizedBox(width: 8),
                    Text(
                      t['button']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}