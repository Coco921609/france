import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'presentation.dart';

class LanguesPage extends StatefulWidget {
  final bool isProfileCreated;

  const LanguesPage({super.key, required this.isProfileCreated});

  @override
  State<LanguesPage> createState() => _LanguesPageState();
}

class _LanguesPageState extends State<LanguesPage>
    with TickerProviderStateMixin {
  String _selectedCode = 'fr';

  // ---- Ouverture parisienne (10 secondes) ----
  late final AnimationController _introController;
  bool _introVisible = true;
  bool _introFading = false;
  Timer? _removeTimer;

  // ---- Animations de la page des langues ----
  late final AnimationController _entranceController; // apparition en cascade
  late final AnimationController _ambientController; // fond vivant (boucle)
  late final AnimationController _pulseController; // pulsation du bouton

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _ambientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _introController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _introController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() => _introFading = true);
        _entranceController.forward();
        _removeTimer = Timer(const Duration(milliseconds: 800), () {
          if (mounted) setState(() => _introVisible = false);
        });
      }
    });
    _introController.forward();
  }

  @override
  void dispose() {
    _removeTimer?.cancel();
    _introController.dispose();
    _entranceController.dispose();
    _ambientController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _confirmSelection() {
    HapticFeedback.mediumImpact();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PresentationScreen(languageCode: _selectedCode),
      ),
    );
  }

  Widget _stagger(double start, double end, Widget child) {
    return AnimatedBuilder(
      animation: _entranceController,
      child: child,
      builder: (context, ch) {
        final double p = Curves.easeOutCubic.transform(
          ((_entranceController.value - start) / (end - start)).clamp(0.0, 1.0),
        );
        return Opacity(
          opacity: p,
          child: Transform.translate(
            offset: Offset(0, (1 - p) * 26),
            child: ch,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguagesList =
        localizedLanguagesData[_selectedCode] ?? localizedLanguagesData['fr']!;
    final selectedLangItem = currentLanguagesList.firstWhere(
          (element) => element['code'] == _selectedCode,
      orElse: () => currentLanguagesList.first,
    );
    final String currentQuestion = selectedLangItem['question'] ?? '';
    final Color accent = selectedLangItem['color'] ?? BubbleTheme.coral;

    final uiText = localizedUi[_selectedCode] ?? localizedUi['fr'] ?? {};
    final String welcomeMessage = uiText['welcome'] ?? 'Bienvenue !';
    final String validateText = uiText['validate'] ?? 'Valider';

    final bool isRtl = _selectedCode == 'ar';

    final Widget page = Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        body: Stack(
          children: [
            SafeArea(
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      _stagger(
                        0.0,
                        0.5,
                        _OrbitBadge(
                          animation: _ambientController,
                          color: accent,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _stagger(
                        0.08,
                        0.6,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 92,
                                child: Center(
                                  child: AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 500),
                                    transitionBuilder: (child, anim) {
                                      return FadeTransition(
                                        opacity: anim,
                                        child: SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(0, 0.3),
                                            end: Offset.zero,
                                          ).animate(anim),
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: ShaderMask(
                                      key: ValueKey<String>('q$_selectedCode'),
                                      blendMode: BlendMode.srcIn,
                                      shaderCallback: (rect) =>
                                          LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Colors.white.withOpacity(0.85),
                                              accent.withOpacity(0.9),
                                            ],
                                            stops: const [0.0, 0.55, 1.0],
                                          ).createShader(rect),
                                      child: Text(
                                        currentQuestion,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                          height: 1.25,
                                          letterSpacing: 0.2,
                                          shadows: [
                                            Shadow(
                                              color: accent.withOpacity(0.45),
                                              blurRadius: 26,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                width: 64,
                                height: 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  gradient: LinearGradient(
                                    colors: [
                                      accent,
                                      BubbleTheme.primaryGradientEnd,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: accent.withOpacity(0.6),
                                      blurRadius: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            padding:
                            const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0;
                                i < currentLanguagesList.length;
                                i++)
                                  _buildCard(currentLanguagesList[i], i),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),

                  // ---- Barre de validation (verre dépoli) ----
                  Positioned(
                    bottom: 22,
                    left: 18,
                    right: 18,
                    child: AnimatedBuilder(
                      animation: Listenable.merge([
                        _entranceController,
                        _pulseController,
                        _ambientController,
                      ]),
                      builder: (context, _) {
                        final double p = Curves.easeOutCubic.transform(
                          ((_entranceController.value - 0.35) / 0.65)
                              .clamp(0.0, 1.0),
                        );
                        final double pulse =
                        Curves.easeInOut.transform(_pulseController.value);
                        final double shimmer =
                            (_ambientController.value * 5) % 1.0;
                        return Opacity(
                          opacity: p,
                          child: Transform.translate(
                            offset: Offset(0, (1 - p) * 90),
                            child: _buildBottomBar(
                              accent: accent,
                              welcomeMessage: welcomeMessage,
                              validateText: validateText,
                              languageName: selectedLangItem['name'] ?? '',
                              isRtl: isRtl,
                              pulse: pulse,
                              shimmer: shimmer,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        page,
        if (_introVisible)
          Positioned.fill(
            child: IgnorePointer(
              ignoring: _introFading,
              child: AnimatedOpacity(
                opacity: _introFading ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 800),
                child: ParisIntro(animation: _introController),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildCard(Map<String, dynamic> item, int index) {
    final String code = item['code'] ?? 'fr';
    final String name = item['name'] ?? '';
    final Color color = item['color'] ?? BubbleTheme.coral;
    final IconData icon = item['icon'] ?? Icons.language;
    final bool isSelected = (code == _selectedCode);

    return _LanguageCard(
      code: code,
      name: name,
      color: color,
      icon: icon,
      isSelected: isSelected,
      index: index,
      entrance: _entranceController,
      ambient: _ambientController,
      onTap: () {
        if (code != _selectedCode) {
          HapticFeedback.selectionClick();
        }
        setState(() {
          _selectedCode = code;
        });
      },
    );
  }

  Widget _buildBottomBar({
    required Color accent,
    required String welcomeMessage,
    required String validateText,
    required String languageName,
    required bool isRtl,
    required double pulse,
    required double shimmer,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.20 + 0.18 * pulse),
            blurRadius: 40,
            spreadRadius: -2,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 22, sigmaY: 22),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF1B1836).withOpacity(0.86),
                  const Color(0xFF110E24).withOpacity(0.82),
                ],
              ),
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: accent.withOpacity(0.38 + 0.3 * pulse),
                width: 1.4,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: Text(
                          welcomeMessage,
                          key: ValueKey<String>('w$_selectedCode'),
                          style: const TextStyle(
                            color: BubbleTheme.textLight,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 3),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 350),
                        child: Text(
                          languageName,
                          key: ValueKey<String>('n$_selectedCode'),
                          style: TextStyle(
                            color: accent,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: BubbleTheme.primaryGradientEnd
                            .withOpacity(0.30 + 0.30 * pulse),
                        blurRadius: 18 + 10 * pulse,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              BubbleTheme.primaryGradientStart,
                              accent,
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: _confirmSelection,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: IgnorePointer(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment(
                                            -2.0 + 4.0 * shimmer, -0.5),
                                        end: Alignment(
                                            -1.0 + 4.0 * shimmer, 0.5),
                                        colors: [
                                          Colors.white.withOpacity(0.0),
                                          Colors.white.withOpacity(0.35),
                                          Colors.white.withOpacity(0.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 15),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      validateText,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Transform.translate(
                                      offset: Offset(
                                          (isRtl ? -1 : 1) * 4 * pulse, 0),
                                      child: Icon(
                                        isRtl
                                            ? Icons.arrow_back_rounded
                                            : Icons.arrow_forward_rounded,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ===========================================================================
//  PAGE LANGUES : composants du nouveau design
// ===========================================================================

class _LanguageCard extends StatelessWidget {
  final String code;
  final String name;
  final Color color;
  final IconData icon;
  final bool isSelected;
  final int index;
  final Animation<double> entrance;
  final Animation<double> ambient;
  final VoidCallback onTap;

  const _LanguageCard({
    required this.code,
    required this.name,
    required this.color,
    required this.icon,
    required this.isSelected,
    required this.index,
    required this.entrance,
    required this.ambient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([entrance, ambient]),
      builder: (context, _) {
        final double start = (0.13 * index).clamp(0.0, 0.6);
        final double p = Curves.easeOutCubic.transform(
          ((entrance.value - start) / 0.5).clamp(0.0, 1.0),
        );
        final double angle = ambient.value * 2 * pi;
        final double shimmer = (ambient.value * 4 + index * 0.2) % 1.0;

        return Opacity(
          opacity: p,
          child: Transform.translate(
            offset: Offset(0, (1 - p) * 44),
            child: AnimatedScale(
              scale: isSelected ? 1.02 : 1.0,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutBack,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 9.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onTap,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    height: 92,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isSelected
                            ? [
                          color.withOpacity(0.38),
                          color.withOpacity(0.12),
                          const Color(0xFF17132B).withOpacity(0.85),
                        ]
                            : [
                          const Color(0xFF1E1A38).withOpacity(0.72),
                          const Color(0xFF131027).withOpacity(0.55),
                        ],
                      ),
                      border: Border.all(
                        color: isSelected
                            ? color.withOpacity(0.95)
                            : Colors.white.withOpacity(0.09),
                        width: isSelected ? 1.8 : 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? color.withOpacity(0.38)
                              : Colors.black.withOpacity(0.30),
                          blurRadius: isSelected ? 34 : 16,
                          spreadRadius: isSelected ? -2 : 0,
                          offset: Offset(0, isSelected ? 12 : 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(
                        children: [
                          // Reflet lumineux qui balaie la carte sélectionnée
                          if (isSelected)
                            Positioned.fill(
                              child: IgnorePointer(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(
                                          -2.0 + 4.0 * shimmer, -0.4),
                                      end: Alignment(
                                          -1.0 + 4.0 * shimmer, 0.4),
                                      colors: [
                                        Colors.white.withOpacity(0.0),
                                        color.withOpacity(0.20),
                                        Colors.white.withOpacity(0.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // Liseré lumineux à gauche de la carte sélectionnée
                          if (isSelected)
                            Positioned(
                              left: 0,
                              top: 22,
                              bottom: 22,
                              width: 4,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(4),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      color,
                                      BubbleTheme.primaryGradientEnd,
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: color.withOpacity(0.7),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              children: [
                                _IconOrb(
                                  icon: icon,
                                  color: color,
                                  isSelected: isSelected,
                                  angle: angle,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      AnimatedDefaultTextStyle(
                                        duration:
                                        const Duration(milliseconds: 300),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isSelected ? 20 : 18,
                                          fontWeight: isSelected
                                              ? FontWeight.w800
                                              : FontWeight.w600,
                                          letterSpacing: 0.3,
                                        ),
                                        child: Text(name),
                                      ),
                                      const SizedBox(height: 6),
                                      AnimatedContainer(
                                        duration:
                                        const Duration(milliseconds: 300),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(8),
                                          color: isSelected
                                              ? color.withOpacity(0.18)
                                              : Colors.white
                                              .withOpacity(0.04),
                                        ),
                                        child: Text(
                                          code.toUpperCase(),
                                          style: TextStyle(
                                            color: isSelected
                                                ? color
                                                : Colors.white38,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: 2.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                _CheckBadge(
                                  isSelected: isSelected,
                                  color: color,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _IconOrb extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool isSelected;
  final double angle;

  const _IconOrb({
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.angle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(60, 60),
            painter: _RingPainter(
              angle: angle * 4,
              color: color,
              active: isSelected,
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isSelected
                  ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.55),
                  color.withOpacity(0.18),
                ],
              )
                  : null,
              color: isSelected ? null : Colors.white.withOpacity(0.05),
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: color.withOpacity(0.45),
                  blurRadius: 14,
                ),
              ]
                  : const [],
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : Colors.white60,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _CheckBadge extends StatelessWidget {
  final bool isSelected;
  final Color color;

  const _CheckBadge({required this.isSelected, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.elasticOut,
      switchOutCurve: Curves.easeIn,
      transitionBuilder: (child, anim) =>
          ScaleTransition(scale: anim, child: child),
      child: isSelected
          ? Container(
        key: const ValueKey<bool>(true),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.75)],
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.6),
              blurRadius: 14,
            ),
          ],
        ),
        child: const Center(
          child: Icon(
            Icons.check_rounded,
            size: 18,
            color: Colors.white,
          ),
        ),
      )
          : Container(
        key: const ValueKey<bool>(false),
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white24, width: 2),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double angle;
  final Color color;
  final bool active;

  _RingPainter({
    required this.angle,
    required this.color,
    required this.active,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double r = size.width / 2 - 2;
    final Rect rect = Rect.fromCircle(center: c, radius: r);

    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.4
        ..color = Colors.white.withOpacity(0.08),
    );

    if (active) {
      canvas.drawCircle(
        c,
        r,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.8
          ..strokeCap = StrokeCap.round
          ..shader = SweepGradient(
            colors: [
              color.withOpacity(0.0),
              color,
              color.withOpacity(0.0),
            ],
            transform: GradientRotation(angle),
          ).createShader(rect),
      );
    }
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.angle != angle || old.color != color || old.active != active;
}

class _OrbitBadge extends StatelessWidget {
  final Animation<double> animation;
  final Color color;

  const _OrbitBadge({required this.animation, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 84,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(84, 84),
            painter: _OrbitPainter(animation, color),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  BubbleTheme.primaryGradientStart,
                  BubbleTheme.primaryGradientEnd,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.55),
                  blurRadius: 28,
                ),
              ],
            ),
            child: const Icon(
              Icons.translate_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrbitPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _OrbitPainter(this.animation, this.color) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double r = size.width / 2 - 4;
    final double a = animation.value * 2 * pi;
    final Rect rect = Rect.fromCircle(center: c, radius: r);

    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2
        ..color = Colors.white.withOpacity(0.08),
    );
    canvas.drawCircle(
      c,
      r,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.4
        ..strokeCap = StrokeCap.round
        ..shader = SweepGradient(
          colors: [
            color.withOpacity(0.0),
            color,
            color.withOpacity(0.0),
          ],
          transform: GradientRotation(a * 4),
        ).createShader(rect),
    );

    for (int k = 0; k < 3; k++) {
      final double ang = a * 4 + k * 2 * pi / 3;
      final Offset pos = c + Offset(cos(ang), sin(ang)) * r;
      final Color dotColor = k == 0 ? BubbleTheme.accentGold : color;
      canvas.drawCircle(
        pos,
        6,
        Paint()..color = dotColor.withOpacity(0.25),
      );
      canvas.drawCircle(pos, 2.8, Paint()..color = dotColor);
    }
  }

  @override
  bool shouldRepaint(covariant _OrbitPainter old) => old.color != color;
}

// ===========================================================================
//  OUVERTURE PARISIENNE : lever de soleil, Tour Eiffel, Arc de Triomphe,
//  La Défense, Sacré-Cœur, Notre-Dame, Louvre, bateau-mouche, métro-train
//  dans son tunnel (deux sens, vrais rails).
//  Dure 10 secondes, avec les langues Français / English / العربية
// ===========================================================================

class _IntroGreeting {
  final String hello;
  final String sub;
  final String label;
  final bool rtl;

  const _IntroGreeting({
    required this.hello,
    required this.sub,
    required this.label,
    this.rtl = false,
  });
}

class ParisIntro extends StatelessWidget {
  final Animation<double> animation;

  const ParisIntro({super.key, required this.animation});

  static const List<_IntroGreeting> _greetings = [
    _IntroGreeting(
        hello: 'Bonjour', sub: 'Bienvenue à Paris', label: 'Français'),
    _IntroGreeting(hello: 'Hello', sub: 'Welcome to Paris', label: 'English'),
    _IntroGreeting(
        hello: 'مرحباً',
        sub: 'أهلاً بكم في باريس',
        label: 'العربية',
        rtl: true),
  ];

  static const Color _gold = Color(0xFFFFD27A);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        type: MaterialType.transparency,
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, _) {
            final double t = animation.value;
            final int index = min(2, (t * 3).floor());
            final double local = (t * 3 - index).clamp(0.0, 1.0);
            final double fadeIn =
            Curves.easeOut.transform((local / 0.2).clamp(0.0, 1.0));
            final double fadeOut = index == 2
                ? 1.0
                : ((1 - local) / 0.2).clamp(0.0, 1.0);
            final double opacity = fadeIn * fadeOut;
            final _IntroGreeting g = _greetings[index];

            return Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(painter: _ParisIntroPainter(animation)),
                SafeArea(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.05),
                      Opacity(
                        opacity: opacity,
                        child: Transform.translate(
                          offset: Offset(0, (1 - fadeIn) * 16),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Directionality(
                                  textDirection: g.rtl
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (rect) =>
                                        const LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Color(0xFFFFF3D6),
                                          ],
                                        ).createShader(rect),
                                    child: Text(
                                      g.hello,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 48,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: g.rtl ? 0 : 1.2,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black
                                                .withOpacity(0.35),
                                            blurRadius: 16,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Directionality(
                                  textDirection: g.rtl
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  child: Text(
                                    g.sub,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: g.rtl ? 0 : 0.6,
                                      shadows: [
                                        Shadow(
                                          color:
                                          Colors.black.withOpacity(0.35),
                                          blurRadius: 10,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_greetings.length, (i) {
                          final bool active = i == index;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin:
                            const EdgeInsets.symmetric(horizontal: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 7),
                            decoration: BoxDecoration(
                              color: active
                                  ? _gold
                                  : Colors.white.withOpacity(0.10),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: active
                                    ? _gold
                                    : Colors.white.withOpacity(0.3),
                                width: 1,
                              ),
                              boxShadow: active
                                  ? [
                                BoxShadow(
                                  color: _gold.withOpacity(0.5),
                                  blurRadius: 14,
                                ),
                              ]
                                  : const [],
                            ),
                            child: Text(
                              _greetings[i].label,
                              style: TextStyle(
                                color: active
                                    ? const Color(0xFF1B1646)
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 14),
                      SizedBox(
                        width: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: t,
                            minHeight: 3,
                            backgroundColor: Colors.white24,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                _gold),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _ParisIntroPainter extends CustomPainter {
  final Animation<double> animation;

  _ParisIntroPainter(this.animation) : super(repaint: animation);

  static Color _lerp3(Color a, Color b, Color c, double p) {
    return p < 0.5
        ? Color.lerp(a, b, p * 2)!
        : Color.lerp(b, c, (p - 0.5) * 2)!;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double t = animation.value;
    final double sunP = Curves.easeInOutCubic.transform(t);
    final double w = size.width;
    final double h = size.height;
    final double groundY = h * 0.76; // quai de Seine
    final double riverBottom = h * 0.84; // bas du fleuve / haut du tunnel

    // ---- Ciel : nuit -> aube -> jour ----
    final Color skyTop = _lerp3(
      const Color(0xFF070B2A),
      const Color(0xFF2E3A8C),
      const Color(0xFF5AA9E6),
      sunP,
    );
    final Color skyBottom = _lerp3(
      const Color(0xFF1E1650),
      const Color(0xFFFF7E5F),
      const Color(0xFFFFD9A0),
      sunP,
    );
    final Paint skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [skyTop, Color.lerp(skyTop, skyBottom, 0.6)!, skyBottom],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, w, groundY));
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), skyPaint);

    _drawStars(canvas, size, t, sunP);
    _drawSun(canvas, size, t, sunP, groundY);
    _drawClouds(canvas, size, t, sunP);

    final Color farColor =
    Color.lerp(const Color(0xFF1A1740), const Color(0xFF6B4E7A), sunP)!;
    final Color nearColor =
    Color.lerp(const Color(0xFF0A0A1F), const Color(0xFF2B2145), sunP)!;
    final Color monumentColor =
    Color.lerp(const Color(0xFF0D0B22), const Color(0xFF3A2B3F), sunP)!;

    final Color defenseColor =
    Color.lerp(const Color(0xFF211C55), const Color(0xFF9B6F8F), sunP)!;
    final Color sacreColor =
    Color.lerp(const Color(0xFF1D1A46), const Color(0xFFD7B9B5), sunP)!;
    final Color hillColor =
    Color.lerp(const Color(0xFF15123A), const Color(0xFF7C5A80), sunP)!;
    final Color louvreColor =
    Color.lerp(const Color(0xFF14123A), const Color(0xFF6E5078), sunP)!;
    final Color notreDameColor =
    Color.lerp(const Color(0xFF100E2C), const Color(0xFF4E3853), sunP)!;

    // La Défense + Sacré-Cœur
    _drawDefense(canvas, size, groundY, defenseColor, skyBottom, t, sunP);
    _drawSacreCoeur(canvas, size, groundY, sacreColor, hillColor, sunP);

    // Dôme des Invalides + horizon lointain (brume atmosphérique)
    _drawDome(canvas, size, groundY, farColor);
    _drawSkyline(canvas, size, groundY, 3, 0.035, 0.075, farColor, sunP, false);

    // Louvre + Notre-Dame
    _drawLouvre(canvas, size, groundY, louvreColor, sunP);
    _drawNotreDame(canvas, size, groundY, notreDameColor, sunP);

    // Arc de Triomphe + Tour Eiffel
    _drawArc(canvas, size, groundY, monumentColor);
    _drawEiffel(canvas, size, groundY, monumentColor, t, sunP);

    // Immeubles parisiens au premier plan
    _drawSkyline(canvas, size, groundY, 9, 0.02, 0.05, nearColor, sunP, true);

    _drawRiver(canvas, size, groundY, riverBottom, skyTop, skyBottom,
        nearColor, t, sunP);
    _drawBoat(canvas, size, groundY, riverBottom, t, sunP);
    _drawTunnel(canvas, size, riverBottom, t, sunP);
    _drawBirds(canvas, size, t);
    _drawDust(canvas, size, t, sunP);

    // Vignettage final pour un rendu cinématographique
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..shader = RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.45),
          ],
          stops: const [0.6, 1.0],
        ).createShader(Rect.fromLTWH(0, 0, w, h)),
    );
  }

  void _drawStars(Canvas canvas, Size size, double t, double sunP) {
    final double visible = (1 - sunP * 1.6).clamp(0.0, 1.0);
    if (visible <= 0) return;
    final Random rnd = Random(7);
    final Paint paint = Paint();
    for (int i = 0; i < 70; i++) {
      final double x = rnd.nextDouble() * size.width;
      final double y = rnd.nextDouble() * size.height * 0.55;
      final double r = 0.6 + rnd.nextDouble() * 1.4;
      final double twinkle = 0.5 + 0.5 * sin(t * 30 + i * 1.3);
      paint.color =
          Colors.white.withOpacity(visible * (0.35 + 0.65 * twinkle));
      canvas.drawCircle(Offset(x, y), r, paint);
    }
  }

  void _drawSun(
      Canvas canvas, Size size, double t, double sunP, double groundY) {
    final double r = size.width * 0.085;
    final double startY = groundY + r;
    final double endY = size.height * 0.40;
    final Offset center = Offset(
      size.width * 0.58,
      startY + (endY - startY) * sunP,
    );
    final Color sunColor = Color.lerp(
      const Color(0xFFFF7A3D),
      const Color(0xFFFFE08A),
      sunP,
    )!;

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, groundY));

    // Halo
    final double glowR = r * 4.6;
    canvas.drawCircle(
      center,
      glowR,
      Paint()
        ..shader = RadialGradient(
          colors: [
            sunColor.withOpacity(0.35 + 0.35 * sunP),
            sunColor.withOpacity(0.0),
          ],
        ).createShader(Rect.fromCircle(center: center, radius: glowR)),
    );

    // Rayons qui tournent lentement
    if (sunP > 0.15) {
      final double rayOpacity = ((sunP - 0.15) / 0.5).clamp(0.0, 1.0) * 0.14;
      final Paint ray = Paint()
        ..color = sunColor.withOpacity(rayOpacity)
        ..strokeWidth = 2.2
        ..strokeCap = StrokeCap.round;
      for (int k = 0; k < 14; k++) {
        final double ang = k * 2 * pi / 14 + t * 0.6;
        final Offset dir = Offset(cos(ang), sin(ang));
        canvas.drawLine(
          center + dir * (r * 1.25),
          center + dir * (r * (2.6 + (k.isEven ? 1.2 : 0.4))),
          ray,
        );
      }
    }

    canvas.drawCircle(center, r, Paint()..color = sunColor);
    canvas.restore();
  }

  void _drawClouds(Canvas canvas, Size size, double t, double sunP) {
    final Color c = Color.lerp(
      const Color(0xFF6C5BA8),
      const Color(0xFFFFC9A8),
      sunP,
    )!.withOpacity(0.38);
    final Paint paint = Paint()
      ..color = c
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    final List<List<double>> clouds = [
      [0.10, 0.30, 0.9],
      [0.55, 0.48, 1.2],
      [0.85, 0.57, 0.8],
    ];
    for (int i = 0; i < clouds.length; i++) {
      final double base = clouds[i][0];
      final double yy = size.height * clouds[i][1];
      final double scale = clouds[i][2];
      final double x = ((base + t * 0.12 * scale) % 1.3 - 0.15) * size.width;
      final double cw = size.width * 0.22 * scale;
      final double ch = size.height * 0.022 * scale;
      canvas.drawOval(
        Rect.fromCenter(center: Offset(x, yy), width: cw, height: ch),
        paint,
      );
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(x + cw * 0.22, yy - ch * 0.5),
          width: cw * 0.6,
          height: ch * 1.1,
        ),
        paint,
      );
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(x - cw * 0.25, yy + ch * 0.2),
          width: cw * 0.5,
          height: ch * 0.9,
        ),
        paint,
      );
    }
  }

  void _drawDefense(
      Canvas canvas,
      Size size,
      double groundY,
      Color color,
      Color haze,
      double t,
      double sunP,
      ) {
    final double w = size.width;
    final double h = size.height;
    final double plateauH = h * 0.19;
    final double yD = groundY - plateauH;
    final double x0 = w * 0.46;
    final double span = w * 0.30;

    double baseAt(double x) {
      final double r = ((x - x0) / span).clamp(0.0, 1.0);
      return groundY - plateauH * (r * r * (3 - 2 * r));
    }

    final Path hill = Path()..moveTo(x0, groundY);
    for (double x = x0; x <= w + 6; x += 6) {
      hill.lineTo(x, baseAt(x));
    }
    hill
      ..lineTo(w + 6, groundY)
      ..close();
    canvas.drawPath(
      hill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color, Color.lerp(color, haze, 0.55)!],
        ).createShader(Rect.fromLTWH(x0, yD, w - x0, plateauH)),
    );

    final Paint paint = Paint()..color = color;
    final Paint win = Paint();
    final Random rnd = Random(21);
    final double lit = (1 - sunP * 1.7).clamp(0.0, 1.0);

    double bx = w * 0.60;
    while (bx < w) {
      final double bw = w * (0.018 + rnd.nextDouble() * 0.022);
      final double bh = h * (0.008 + rnd.nextDouble() * 0.03);
      final double by = baseAt(bx + bw / 2);
      canvas.drawRect(Rect.fromLTWH(bx, by - bh, bw + 0.5, bh + 2), paint);
      bx += bw;
    }

    const List<List<double>> towers = [
      [0.700, 0.030, 0.085, 2],
      [0.735, 0.034, 0.150, 0],
      [0.778, 0.046, 0.105, 1],
      [0.985, 0.040, 0.125, 2],
    ];
    for (int i = 0; i < towers.length; i++) {
      final double tx = w * towers[i][0];
      final double tw = w * towers[i][1];
      final double th = h * towers[i][2];
      final int type = towers[i][3].toInt();
      final double base = baseAt(tx + tw / 2) + 2;

      final Path tower = Path();
      if (type == 0) {
        tower
          ..moveTo(tx, base)
          ..lineTo(tx, base - th * 0.86)
          ..lineTo(tx + tw / 2, base - th)
          ..lineTo(tx + tw, base - th * 0.86)
          ..lineTo(tx + tw, base)
          ..close();
      } else if (type == 1) {
        tower
          ..moveTo(tx, base)
          ..lineTo(tx, base - th * 0.8)
          ..lineTo(tx + tw, base - th)
          ..lineTo(tx + tw, base)
          ..close();
      } else {
        tower.addRect(Rect.fromLTWH(tx, base - th, tw, th));
      }
      canvas.drawPath(tower, paint);

      final int rows = max(1, (th / (h * 0.014)).floor() - 1);
      for (int r = 0; r < rows; r++) {
        for (int c = 0; c < 3; c++) {
          final bool on = rnd.nextDouble() > 0.5;
          if (on && lit > 0) {
            win.color = const Color(0xFFFFD27A).withOpacity(0.7 * lit);
            canvas.drawRect(
              Rect.fromLTWH(
                tx + tw * (0.16 + c * 0.28),
                base - th * 0.86 + r * (h * 0.014),
                tw * 0.14,
                h * 0.007,
              ),
              win,
            );
          }
        }
      }

      if (type != 2) {
        final double blink = sin(t * 60 + i * 2.0) > 0 ? 1.0 : 0.15;
        final double topY = type == 0 ? base - th : base - th * 0.9;
        canvas.drawCircle(
          Offset(tx + tw / 2, topY - 2),
          1.8,
          Paint()..color = const Color(0xFFFF4D4D).withOpacity(blink),
        );
      }
    }

    // La Grande Arche
    final double s = w * 0.19;
    final double acx = w * 0.885;
    final double archeBase = baseAt(acx) + 2;
    final Rect outer =
    Rect.fromLTWH(acx - s / 2, archeBase - s * 1.04, s, s * 1.04);
    final Rect inner = Rect.fromLTRB(
      acx - s * 0.27,
      outer.top + s * 0.13,
      acx + s * 0.27,
      archeBase + 4,
    );
    final Path arche = Path.combine(
      PathOperation.difference,
      Path()..addRect(outer),
      Path()..addRect(inner),
    );
    canvas.drawPath(
      arche,
      Paint()..color = Color.lerp(color, Colors.white, 0.08)!,
    );

    if (lit > 0) {
      final Paint lines = Paint()
        ..color = const Color(0xFFFFD27A).withOpacity(0.45 * lit)
        ..strokeWidth = 0.8;
      for (int k = 1; k < 9; k++) {
        final double y = outer.top + k * (outer.height / 9);
        if (y < inner.top) {
          canvas.drawLine(Offset(outer.left, y), Offset(outer.right, y), lines);
        } else {
          canvas.drawLine(
              Offset(outer.left, y), Offset(inner.left, y), lines);
          canvas.drawLine(
              Offset(inner.right, y), Offset(outer.right, y), lines);
        }
      }
    }
  }

  Path _domePath(double cx, double baseY, double width, double height) {
    final double hw = width / 2;
    return Path()
      ..moveTo(cx - hw, baseY)
      ..cubicTo(
        cx - hw * 1.15,
        baseY - height * 0.55,
        cx - hw * 0.35,
        baseY - height * 0.85,
        cx,
        baseY - height,
      )
      ..cubicTo(
        cx + hw * 0.35,
        baseY - height * 0.85,
        cx + hw * 1.15,
        baseY - height * 0.55,
        cx + hw,
        baseY,
      )
      ..close();
  }

  void _drawSacreCoeur(
      Canvas canvas,
      Size size,
      double groundY,
      Color color,
      Color hillColor,
      double sunP,
      ) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w * 0.625;
    final double hillH = h * 0.065;

    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(cx, groundY),
        width: w * 0.50,
        height: hillH * 2,
      ),
      Paint()..color = hillColor,
    );

    final double base = groundY - hillH + 2;
    final double bigW = w * 0.19;
    final Paint p = Paint()..color = color;

    final double facadeH = h * 0.026;
    final double drumW = bigW * 0.36;
    final double drumH = h * 0.018;

    final double towerX = cx + bigW * 0.54;
    final double towerW = bigW * 0.07;
    final double towerH = h * 0.065;
    canvas.drawRect(
      Rect.fromLTWH(towerX - towerW / 2, base - towerH, towerW, towerH),
      p,
    );
    canvas.drawPath(
      Path()
        ..moveTo(towerX - towerW * 0.7, base - towerH)
        ..lineTo(towerX, base - towerH - h * 0.012)
        ..lineTo(towerX + towerW * 0.7, base - towerH)
        ..close(),
      p,
    );

    canvas.drawRect(
      Rect.fromLTWH(cx - bigW / 2, base - facadeH, bigW, facadeH + 2),
      p,
    );

    final double drumTop = base - facadeH - drumH;
    canvas.drawRect(
      Rect.fromLTWH(cx - drumW / 2, drumTop, drumW, drumH + 1),
      p,
    );
    canvas.drawPath(_domePath(cx, drumTop, drumW * 1.04, h * 0.040), p);
    final double domeTop = drumTop - h * 0.040;
    canvas.drawRect(
      Rect.fromLTWH(
          cx - drumW * 0.06, domeTop - h * 0.010, drumW * 0.12, h * 0.011),
      p,
    );
    canvas.drawLine(
      Offset(cx, domeTop - h * 0.010),
      Offset(cx, domeTop - h * 0.018),
      Paint()
        ..color = color
        ..strokeWidth = 1.2
        ..strokeCap = StrokeCap.round,
    );

    for (final double f in [-0.36, 0.36]) {
      final double dx = cx + bigW * f;
      final double dw = bigW * 0.13;
      final double dTop = base - facadeH;
      canvas.drawRect(
        Rect.fromLTWH(dx - dw / 2, dTop - h * 0.012, dw, h * 0.013),
        p,
      );
      canvas.drawPath(
        _domePath(dx, dTop - h * 0.012, dw * 1.05, h * 0.022),
        p,
      );
    }

    for (final double f in [-0.47, 0.47]) {
      final double dx = cx + bigW * f;
      canvas.drawPath(
        _domePath(dx, base - facadeH, bigW * 0.07, h * 0.013),
        p,
      );
    }

    final double lit = (1 - sunP * 1.7).clamp(0.0, 1.0);
    if (lit > 0) {
      final Paint win = Paint()
        ..color = const Color(0xFFFFD27A).withOpacity(0.55 * lit);
      for (int i = 0; i < 9; i++) {
        final double wx = cx - bigW * 0.42 + i * bigW * 0.105;
        canvas.drawRect(
          Rect.fromLTWH(
              wx, base - facadeH * 0.7, bigW * 0.03, facadeH * 0.45),
          win,
        );
      }
    }
  }

  void _drawLouvre(
      Canvas canvas, Size size, double groundY, Color color, double sunP) {
    final double w = size.width;
    final double h = size.height;
    final double base = groundY - h * 0.050;
    final double x0 = w * 0.02;
    final double x1 = w * 0.70;
    final double fh = h * 0.036;
    final Paint p = Paint()..color = color;

    canvas.drawRect(Rect.fromLTRB(x0, base - fh, x1, groundY), p);

    final double rh = fh * 0.45;
    canvas.drawPath(
      Path()
        ..moveTo(x0 - 2, base - fh)
        ..lineTo(x0 + rh * 0.8, base - fh - rh)
        ..lineTo(x1 - rh * 0.8, base - fh - rh)
        ..lineTo(x1 + 2, base - fh)
        ..close(),
      p,
    );

    final double pw = w * 0.055;
    final double ph = fh * 1.9;
    for (final double f in [0.0, 0.30, 0.55, 0.96]) {
      final double px = x0 + (x1 - x0 - pw) * f;
      canvas.drawRect(Rect.fromLTWH(px, base - ph, pw, ph), p);
      canvas.drawPath(
        Path()
          ..moveTo(px - 2, base - ph)
          ..lineTo(px + pw * 0.14, base - ph - fh * 0.75)
          ..lineTo(px + pw * 0.86, base - ph - fh * 0.75)
          ..lineTo(px + pw + 2, base - ph)
          ..close(),
        p,
      );
      canvas.drawRect(
        Rect.fromLTWH(
            px + pw * 0.44, base - ph - fh * 1.05, pw * 0.12, fh * 0.32),
        p,
      );
    }

    final double lit = (1 - sunP * 1.7).clamp(0.0, 1.0);
    if (lit > 0) {
      final Paint win = Paint()
        ..color = const Color(0xFFFFD27A).withOpacity(0.55 * lit);
      for (double wx = x0 + 6; wx < x1 - 6; wx += 11) {
        canvas.drawRect(
            Rect.fromLTWH(wx, base - fh * 0.78, 3.2, fh * 0.34), win);
      }
    }

    // Pyramide de verre
    final double pcx = w * 0.655;
    final double pyW = w * 0.105;
    final double pyH = h * 0.040;
    final Path tri = Path()
      ..moveTo(pcx - pyW / 2, base + 1)
      ..lineTo(pcx, base - pyH)
      ..lineTo(pcx + pyW / 2, base + 1)
      ..close();

    if (lit > 0) {
      final Offset gc = Offset(pcx, base - pyH * 0.3);
      canvas.drawCircle(
        gc,
        pyW * 0.9,
        Paint()
          ..shader = RadialGradient(
            colors: [
              const Color(0xFFFFD27A).withOpacity(0.35 * lit),
              const Color(0xFFFFD27A).withOpacity(0.0),
            ],
          ).createShader(Rect.fromCircle(center: gc, radius: pyW * 0.9)),
      );
    }

    final Color glass = Color.lerp(
      const Color(0xFF55689F),
      const Color(0xFFD3EEFF),
      sunP,
    )!;
    canvas.drawPath(tri, Paint()..color = glass.withOpacity(0.92));

    final Paint grid = Paint()
      ..color = Colors.white.withOpacity(0.45)
      ..strokeWidth = 0.8;
    for (int i = 1; i < 4; i++) {
      final double f = i / 4;
      final double hw = pyW / 2 * (1 - f);
      final double y = base - pyH * f;
      canvas.drawLine(Offset(pcx - hw, y), Offset(pcx + hw, y), grid);
    }
    for (int k = 1; k < 4; k++) {
      canvas.drawLine(
        Offset(pcx, base - pyH),
        Offset(pcx - pyW / 2 + pyW * k / 4, base),
        grid,
      );
    }
  }

  void _drawNotreDame(
      Canvas canvas, Size size, double groundY, Color color, double sunP) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w * 0.072;
    final double bigW = w * 0.15;
    final double base = groundY - h * 0.040;
    final double tw = bigW * 0.28;
    final double th = h * 0.098;
    final double bodyH = h * 0.066;
    final Paint p = Paint()..color = color;

    canvas.drawRect(
      Rect.fromLTRB(cx - bigW / 2, base - bodyH, cx + bigW / 2, groundY),
      p,
    );

    final double sb = base - bodyH;
    final double sh = h * 0.085;
    canvas.drawPath(
      Path()
        ..moveTo(cx - bigW * 0.04, sb)
        ..lineTo(cx - bigW * 0.022, sb - sh * 0.45)
        ..lineTo(cx - bigW * 0.03, sb - sh * 0.5)
        ..lineTo(cx - bigW * 0.012, sb - sh * 0.72)
        ..lineTo(cx, sb - sh)
        ..lineTo(cx + bigW * 0.012, sb - sh * 0.72)
        ..lineTo(cx + bigW * 0.03, sb - sh * 0.5)
        ..lineTo(cx + bigW * 0.022, sb - sh * 0.45)
        ..lineTo(cx + bigW * 0.04, sb)
        ..close(),
      p,
    );

    final List<double> towerXs = [cx - bigW / 2, cx + bigW / 2 - tw];
    for (final double tx in towerXs) {
      canvas.drawRect(Rect.fromLTWH(tx, base - th, tw, th + 1), p);
      for (int k = 0; k < 3; k++) {
        canvas.drawRect(
          Rect.fromLTWH(
            tx + k * tw / 3 + tw * 0.03,
            base - th - h * 0.007,
            tw * 0.24,
            h * 0.008,
          ),
          p,
        );
      }
    }

    final double lit = (1 - sunP * 1.6).clamp(0.0, 1.0);

    for (final double tx in towerXs) {
      final RRect slit = RRect.fromRectAndRadius(
        Rect.fromLTWH(
            tx + tw * 0.38, base - th * 0.88, tw * 0.24, th * 0.30),
        const Radius.circular(2),
      );
      canvas.drawRRect(
        slit,
        Paint()
          ..color = Color.lerp(
            const Color(0xFFFFD27A),
            Color.lerp(color, Colors.white, 0.2)!,
            sunP,
          )!
              .withOpacity(0.45 + 0.4 * lit),
      );
    }

    final Offset rose = Offset(cx, base - bodyH * 0.62);
    final Color roseColor = Color.lerp(
      const Color(0xFFFFD27A),
      Color.lerp(color, Colors.white, 0.22)!,
      sunP,
    )!;
    canvas.drawCircle(
        rose, bigW * 0.075, Paint()..color = roseColor.withOpacity(0.9));
    canvas.drawCircle(
      rose,
      bigW * 0.075,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.8
        ..color = color,
    );

    final Color dark = Color.lerp(color, Colors.black, 0.5)!;
    for (final double f in [-0.26, 0.0, 0.26]) {
      final double ax = cx + bigW * f;
      final double aw = bigW * 0.14;
      final double ah = bodyH * 0.42;
      canvas.drawPath(
        Path()
          ..moveTo(ax - aw / 2, base)
          ..lineTo(ax - aw / 2, base - ah * 0.6)
          ..quadraticBezierTo(
              ax - aw * 0.1, base - ah * 0.95, ax, base - ah)
          ..quadraticBezierTo(
              ax + aw * 0.1, base - ah * 0.95, ax + aw / 2, base - ah * 0.6)
          ..lineTo(ax + aw / 2, base)
          ..close(),
        Paint()..color = dark,
      );
    }
  }

  void _drawDome(Canvas canvas, Size size, double groundY, Color color) {
    final Paint paint = Paint()..color = color;
    final double cx = size.width * 0.12;
    final double dw = size.width * 0.07;
    final double drumTop = groundY - size.height * 0.085;
    canvas.drawRect(
      Rect.fromLTWH(cx - dw * 0.5, drumTop, dw, size.height * 0.05),
      paint,
    );
    final Path dome = Path()
      ..moveTo(cx - dw / 2, drumTop)
      ..arcTo(
          Rect.fromLTWH(cx - dw / 2, drumTop - dw * 0.5, dw, dw), pi, pi, false)
      ..close();
    canvas.drawPath(dome, paint);
    canvas.drawLine(
      Offset(cx, drumTop - dw * 0.5),
      Offset(cx, drumTop - dw * 0.5 - size.height * 0.03),
      Paint()
        ..color = color
        ..strokeWidth = 1.6
        ..strokeCap = StrokeCap.round,
    );
  }

  void _drawSkyline(
      Canvas canvas,
      Size size,
      double groundY,
      int seed,
      double minH,
      double maxH,
      Color color,
      double sunP,
      bool windows,
      ) {
    final Random rnd = Random(seed);
    final Paint paint = Paint()..color = color;
    final Paint lightPaint = Paint();
    final double lit = (1 - sunP * 1.7).clamp(0.0, 1.0);
    double x = -size.width * 0.02;

    while (x < size.width) {
      final double bw = size.width * (0.05 + rnd.nextDouble() * 0.05);
      final double bh =
          size.height * (minH + rnd.nextDouble() * (maxH - minH));

      canvas.drawRect(Rect.fromLTWH(x, groundY - bh, bw + 1, bh), paint);

      final double rh = bh * 0.3;
      final Path roof = Path()
        ..moveTo(x - bw * 0.02, groundY - bh)
        ..lineTo(x + bw * 0.12, groundY - bh - rh)
        ..lineTo(x + bw * 0.88, groundY - bh - rh)
        ..lineTo(x + bw * 1.02, groundY - bh)
        ..close();
      canvas.drawPath(roof, paint);

      if (rnd.nextBool()) {
        canvas.drawRect(
          Rect.fromLTWH(
            x + bw * (0.25 + rnd.nextDouble() * 0.4),
            groundY - bh - rh - bh * 0.12,
            bw * 0.07,
            bh * 0.14,
          ),
          paint,
        );
      }

      if (windows) {
        for (int row = 0; row < 2; row++) {
          for (int col = 0; col < 3; col++) {
            final bool on = rnd.nextDouble() > 0.45;
            if (on && lit > 0) {
              lightPaint.color =
                  const Color(0xFFFFD27A).withOpacity(0.85 * lit);
              canvas.drawRect(
                Rect.fromLTWH(
                  x + bw * (0.14 + col * 0.28),
                  groundY - bh * (0.8 - row * 0.4),
                  bw * 0.12,
                  bh * 0.16,
                ),
                lightPaint,
              );
            }
          }
        }
      }

      x += bw;
    }
  }

  void _drawArc(Canvas canvas, Size size, double groundY, Color color) {
    final double aw = size.width * 0.22;
    final double ah = size.height * 0.17;
    final double x = size.width * 0.73;
    final double baseY = groundY - size.height * 0.005;
    final double y0 = baseY - ah;
    final double cx = x + aw / 2;

    final Path body = Path()
      ..addRect(Rect.fromLTWH(x + aw * 0.02, y0, aw * 0.96, ah * 0.14))
      ..addRect(
          Rect.fromLTWH(x - aw * 0.02, y0 + ah * 0.14, aw * 1.04, ah * 0.05))
      ..addRect(Rect.fromLTWH(x, y0 + ah * 0.19, aw, ah * 0.81));

    final Path arches = Path();

    final double archW = aw * 0.38;
    final double archTop = y0 + ah * 0.32;
    arches
      ..moveTo(cx - archW / 2, baseY + 2)
      ..lineTo(cx - archW / 2, archTop + archW / 2)
      ..arcTo(
          Rect.fromLTWH(cx - archW / 2, archTop, archW, archW), pi, pi, false)
      ..lineTo(cx + archW / 2, baseY + 2)
      ..close();

    final double sw = aw * 0.12;
    final double sTop = y0 + ah * 0.52;
    for (final double fx in [0.14, 0.86]) {
      final double scx = x + aw * fx;
      arches
        ..moveTo(scx - sw / 2, baseY + 2)
        ..lineTo(scx - sw / 2, sTop + sw / 2)
        ..arcTo(Rect.fromLTWH(scx - sw / 2, sTop, sw, sw), pi, pi, false)
        ..lineTo(scx + sw / 2, baseY + 2)
        ..close();
    }

    final Path monument = Path.combine(PathOperation.difference, body, arches);
    canvas.drawPath(monument, Paint()..color = color);
  }

  double _halfWidthAt(double frac, double bigH) {
    final double hw0 = bigH * 0.27;
    final double hw1 = bigH * 0.15;
    final double hw2 = bigH * 0.075;
    final double hw3 = bigH * 0.028;
    final double tip = bigH * 0.012;
    if (frac < 0.27) return hw0 + (hw1 - hw0) * (frac / 0.27);
    if (frac < 0.55) return hw1 + (hw2 - hw1) * ((frac - 0.27) / 0.28);
    if (frac < 0.8) return hw2 + (hw3 - hw2) * ((frac - 0.55) / 0.25);
    return hw3 + (tip - hw3) * ((frac - 0.8) / 0.2);
  }

  void _drawEiffel(
      Canvas canvas, Size size, double groundY, Color color, double t,
      double sunP) {
    final double bigH = size.height * 0.46;
    final double baseY = groundY - size.height * 0.01;
    final double cx = size.width * 0.34;

    final double hw0 = bigH * 0.27;
    final double hw1 = bigH * 0.15;
    final double hw2 = bigH * 0.075;
    final double hw3 = bigH * 0.028;
    final double leg = bigH * 0.075;

    final Path p = Path()
      ..moveTo(cx - hw0, baseY)
      ..quadraticBezierTo(
          cx - hw0 * 0.6, baseY - bigH * 0.14, cx - hw1, baseY - bigH * 0.27)
      ..lineTo(cx - hw1 - bigH * 0.015, baseY - bigH * 0.27)
      ..lineTo(cx - hw1 - bigH * 0.015, baseY - bigH * 0.295)
      ..lineTo(cx - hw1, baseY - bigH * 0.295)
      ..quadraticBezierTo(
          cx - hw1 * 0.55, baseY - bigH * 0.42, cx - hw2, baseY - bigH * 0.55)
      ..lineTo(cx - hw2 - bigH * 0.012, baseY - bigH * 0.55)
      ..lineTo(cx - hw2 - bigH * 0.012, baseY - bigH * 0.572)
      ..lineTo(cx - hw2, baseY - bigH * 0.572)
      ..quadraticBezierTo(
          cx - hw3 * 1.5, baseY - bigH * 0.69, cx - hw3, baseY - bigH * 0.80)
      ..lineTo(cx - bigH * 0.010, baseY - bigH * 0.80)
      ..lineTo(cx - bigH * 0.006, baseY - bigH * 0.93)
      ..lineTo(cx, baseY - bigH)
      ..lineTo(cx + bigH * 0.006, baseY - bigH * 0.93)
      ..lineTo(cx + bigH * 0.010, baseY - bigH * 0.80)
      ..lineTo(cx + hw3, baseY - bigH * 0.80)
      ..quadraticBezierTo(
          cx + hw3 * 1.5, baseY - bigH * 0.69, cx + hw2, baseY - bigH * 0.572)
      ..lineTo(cx + hw2 + bigH * 0.012, baseY - bigH * 0.572)
      ..lineTo(cx + hw2 + bigH * 0.012, baseY - bigH * 0.55)
      ..lineTo(cx + hw2, baseY - bigH * 0.55)
      ..quadraticBezierTo(
          cx + hw1 * 0.55, baseY - bigH * 0.42, cx + hw1, baseY - bigH * 0.295)
      ..lineTo(cx + hw1 + bigH * 0.015, baseY - bigH * 0.295)
      ..lineTo(cx + hw1 + bigH * 0.015, baseY - bigH * 0.27)
      ..lineTo(cx + hw1, baseY - bigH * 0.27)
      ..quadraticBezierTo(cx + hw0 * 0.6, baseY - bigH * 0.14, cx + hw0, baseY)
      ..lineTo(cx + hw0 - leg, baseY)
      ..quadraticBezierTo(cx, baseY - bigH * 0.36, cx - hw0 + leg, baseY)
      ..close();

    canvas.drawPath(p, Paint()..color = color);

    final Paint line = Paint()
      ..color = Color.lerp(color, Colors.white, 0.14)!
      ..strokeWidth = 1.2;
    canvas.drawLine(
      Offset(cx - hw1 - bigH * 0.015, baseY - bigH * 0.2825),
      Offset(cx + hw1 + bigH * 0.015, baseY - bigH * 0.2825),
      line,
    );
    canvas.drawLine(
      Offset(cx - hw2 - bigH * 0.012, baseY - bigH * 0.561),
      Offset(cx + hw2 + bigH * 0.012, baseY - bigH * 0.561),
      line,
    );

    final double lit = (1 - sunP * 1.4).clamp(0.0, 1.0);
    final Random rnd = Random(11);
    final Paint spark = Paint();
    for (int k = 0; k < 36; k++) {
      final double fy = 0.06 + rnd.nextDouble() * 0.8;
      final double hw = _halfWidthAt(fy, bigH);
      final double fx = (rnd.nextDouble() * 2 - 1) * 0.8;
      if (lit > 0) {
        final double twinkle = 0.5 + 0.5 * sin(t * 40 + k * 1.7);
        spark.color = const Color(0xFFFFD27A).withOpacity(lit * twinkle);
        canvas.drawCircle(
            Offset(cx + hw * fx, baseY - bigH * fy), 1.4, spark);
      }
    }

    final double beacon = 0.5 + 0.5 * sin(t * 30);
    canvas.drawCircle(
      Offset(cx, baseY - bigH),
      2.6,
      Paint()
        ..color = const Color(0xFFFFE08A).withOpacity(0.4 + 0.6 * beacon),
    );

    // Faisceaux du phare
    if (lit > 0) {
      final Offset tip = Offset(cx, baseY - bigH);
      final double len = size.width * 0.9;
      for (int k = 0; k < 2; k++) {
        final double ang = -pi / 2 + sin(t * 9 + k * pi) * 0.9;
        final Offset dir = Offset(cos(ang), sin(ang));
        final Offset end = tip + dir * len;
        final Offset perp = Offset(-dir.dy, dir.dx) * (len * 0.05);
        final Path beam = Path()
          ..moveTo(tip.dx, tip.dy)
          ..lineTo(end.dx + perp.dx, end.dy + perp.dy)
          ..lineTo(end.dx - perp.dx, end.dy - perp.dy)
          ..close();
        canvas.drawPath(
          beam,
          Paint()
            ..shader = ui.Gradient.linear(
              tip,
              end,
              [
                const Color(0xFFFFF1C2).withOpacity(0.28 * lit),
                const Color(0xFFFFF1C2).withOpacity(0.0),
              ],
            ),
        );
      }
    }
  }

  void _drawRiver(
      Canvas canvas,
      Size size,
      double groundY,
      double riverBottom,
      Color skyTop,
      Color skyBottom,
      Color quayColor,
      double t,
      double sunP,
      ) {
    final double w = size.width;
    final Rect water = Rect.fromLTRB(0, groundY, w, riverBottom);
    final Color waterTop = Color.lerp(skyBottom, Colors.black, 0.3)!;
    final Color waterBottom = Color.lerp(skyTop, Colors.black, 0.45)!;
    canvas.drawRect(
      water,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [waterTop, waterBottom],
        ).createShader(water),
    );

    // Reflets lumineux des monuments (éclairés la nuit)
    final double nightLight = (1 - sunP * 1.4).clamp(0.0, 1.0);
    if (nightLight > 0) {
      for (final double fx in [0.12, 0.34, 0.66, 0.73]) {
        final double rx = w * fx;
        final Rect streak = Rect.fromLTWH(rx - 10, groundY + 4, 20, (riverBottom - groundY) * 0.7);
        canvas.drawRect(
          streak,
          Paint()
            ..shader = LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFFFD27A).withOpacity(0.22 * nightLight),
                const Color(0xFFFFD27A).withOpacity(0.0),
              ],
            ).createShader(streak),
        );
      }
    }

    canvas.drawRect(
        Rect.fromLTWH(0, groundY, w, 3), Paint()..color = quayColor);

    final double rh = riverBottom - groundY;
    final Paint reflect = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    const int lines = 14;
    for (int i = 0; i < lines; i++) {
      final double yy = groundY + (i + 1) * rh / (lines + 2);
      final double lw =
          w * 0.2 * (1 - i / 20) * (0.6 + 0.4 * sin(t * 12 + i));
      reflect.color = const Color(0xFFFFE08A)
          .withOpacity((0.5 * sunP * (1 - i / lines)).clamp(0.0, 1.0));
      canvas.drawLine(
        Offset(w * 0.58 - lw / 2, yy),
        Offset(w * 0.58 + lw / 2, yy),
        reflect,
      );
    }
  }

  void _drawBoat(
      Canvas canvas,
      Size size,
      double groundY,
      double riverBottom,
      double t,
      double sunP,
      ) {
    final double w = size.width;
    final double rh = riverBottom - groundY;
    final double bl = w * 0.36;
    final double bh = rh * 0.62;
    final double wy = groundY + rh * 0.78 + sin(t * 40) * 0.8;
    final double x = -bl + (w + bl) * (0.10 + 0.78 * t);
    final double y0 = wy - bh * 0.30;
    final double night = (1 - sunP * 1.5).clamp(0.0, 1.0);

    canvas.save();
    canvas.clipRect(Rect.fromLTRB(0, groundY + 3, w, riverBottom));

    final Color hullColor =
    Color.lerp(const Color(0xFF8B93B8), const Color(0xFFF4F1EC), sunP)!;
    final Color glassColor =
    Color.lerp(const Color(0xFFFFD27A), const Color(0xFFBFE4F5), sunP)!;

    // Reflet sous la coque
    canvas.drawRect(
      Rect.fromLTRB(x + bl * 0.05, wy, x + bl * 0.9, wy + bh * 0.6),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            glassColor.withOpacity(0.35),
            glassColor.withOpacity(0.0),
          ],
        ).createShader(
            Rect.fromLTRB(x + bl * 0.05, wy, x + bl * 0.9, wy + bh * 0.6)),
    );

    // Projecteur de nuit
    if (night > 0) {
      final Offset start = Offset(x + bl * 0.88, y0 - bh * 0.42);
      final Offset end = Offset(x + bl + w * 0.35, y0 - bh * 0.05);
      final Offset dir = end - start;
      final Offset perp =
          Offset(-dir.dy, dir.dx) / dir.distance * (rh * 0.35);
      canvas.drawPath(
        Path()
          ..moveTo(start.dx, start.dy)
          ..lineTo(end.dx + perp.dx, end.dy + perp.dy)
          ..lineTo(end.dx - perp.dx, end.dy - perp.dy)
          ..close(),
        Paint()
          ..shader = ui.Gradient.linear(
            start,
            end,
            [
              const Color(0xFFFFF1C2).withOpacity(0.38 * night),
              const Color(0xFFFFF1C2).withOpacity(0.0),
            ],
          ),
      );
    }

    // Sillage
    final Paint wake = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..color = Colors.white.withOpacity(0.35);
    canvas.drawPath(
      Path()
        ..moveTo(x + bl * 0.04, wy)
        ..quadraticBezierTo(
            x - bl * 0.10, wy + rh * 0.05, x - bl * 0.30, wy + rh * 0.02),
      wake,
    );
    canvas.drawPath(
      Path()
        ..moveTo(x + bl * 0.06, wy + 3)
        ..quadraticBezierTo(
            x - bl * 0.12, wy + rh * 0.12, x - bl * 0.36, wy + rh * 0.09),
      wake..color = Colors.white.withOpacity(0.2),
    );
    canvas.drawPath(
      Path()
        ..moveTo(x + bl * 0.92, wy)
        ..quadraticBezierTo(
            x + bl * 1.02, wy - 2, x + bl * 1.07, wy + 1),
      wake..color = Colors.white.withOpacity(0.5),
    );

    // Coque
    final Path hull = Path()
      ..moveTo(x, y0)
      ..lineTo(x + bl * 0.93, y0)
      ..quadraticBezierTo(x + bl * 1.01, y0 + bh * 0.05, x + bl * 0.96, wy)
      ..lineTo(x + bl * 0.05, wy)
      ..close();
    canvas.drawPath(hull, Paint()..color = hullColor);
    canvas.drawRect(
      Rect.fromLTWH(x + bl * 0.03, y0 + bh * 0.12, bl * 0.9, 1.6),
      Paint()..color = const Color(0xFFD4002A).withOpacity(0.85),
    );

    // Cabine vitrée
    final RRect cabin = RRect.fromRectAndRadius(
      Rect.fromLTRB(x + bl * 0.08, y0 - bh * 0.58, x + bl * 0.82, y0),
      const Radius.circular(4),
    );
    canvas.drawRRect(cabin, Paint()..color = glassColor.withOpacity(0.95));

    final Paint mullion = Paint()
      ..color = hullColor.withOpacity(0.6)
      ..strokeWidth = 1;
    for (double mx = x + bl * 0.14; mx < x + bl * 0.82; mx += bl * 0.06) {
      canvas.drawLine(
          Offset(mx, y0 - bh * 0.58), Offset(mx, y0), mullion);
    }

    // Passagers
    final Random rnd = Random(3);
    final Paint head = Paint()
      ..color = const Color(0xFF2B2145).withOpacity(0.55);
    for (int i = 0; i < 9; i++) {
      final double hx = x + bl * (0.12 + rnd.nextDouble() * 0.66);
      canvas.drawCircle(
        Offset(hx, y0 - bh * (0.12 + rnd.nextDouble() * 0.1)),
        1.6,
        head,
      );
    }

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTRB(
            x + bl * 0.06, y0 - bh * 0.66, x + bl * 0.84, y0 - bh * 0.58),
        const Radius.circular(2),
      ),
      Paint()..color = Color.lerp(hullColor, Colors.black, 0.25)!,
    );

    // Mât et drapeaux tricolores
    final double poleX = x + bl * 0.04;
    canvas.drawLine(
      Offset(poleX, y0),
      Offset(poleX, y0 - bh * 0.55),
      Paint()
        ..color = hullColor
        ..strokeWidth = 1,
    );
    final double flagTop = y0 - bh * 0.55;
    const List<Color> flag = [
      Color(0xFF2744C7),
      Colors.white,
      Color(0xFFE4002B),
    ];
    for (int i = 0; i < 3; i++) {
      canvas.drawRect(
        Rect.fromLTWH(poleX + 1 + i * 2.6, flagTop, 2.6, 4.5),
        Paint()..color = flag[i],
      );
    }

    canvas.restore();
  }

  void _drawTunnel(
      Canvas canvas, Size size, double top, double t, double sunP) {
    final double w = size.width;
    final double h = size.height;
    final double bandH = h - top;
    final Rect band = Rect.fromLTWH(0, top, w, bandH);

    canvas.drawRect(
      band,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1A1830), Color(0xFF0A0A18)],
        ).createShader(band),
    );
    canvas.drawRect(
      Rect.fromLTWH(0, top, w, 2.5),
      Paint()
        ..color = Color.lerp(
          const Color(0xFF3A3560),
          const Color(0xFFB98C7A),
          sunP,
        )!,
    );

    final double laneH = (bandH - 6) / 2;

    _drawLane(canvas, size, top + 3, laneH, 1, (t * 2) % 1.0, t);
    canvas.drawRect(
      Rect.fromLTWH(0, top + 3 + laneH, w, 3),
      Paint()..color = const Color(0xFF2A2646),
    );
    _drawLane(canvas, size, top + 6 + laneH, laneH, -1, (t * 2 + 0.5) % 1.0, t);

    // Vignettage des bords du tunnel
    final double vw = w * 0.14;
    canvas.drawRect(
      Rect.fromLTWH(0, top, vw, bandH),
      Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.black.withOpacity(0.65),
            Colors.black.withOpacity(0.0),
          ],
        ).createShader(Rect.fromLTWH(0, top, vw, bandH)),
    );
    canvas.drawRect(
      Rect.fromLTWH(w - vw, top, vw, bandH),
      Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.65),
          ],
        ).createShader(Rect.fromLTWH(w - vw, top, vw, bandH)),
    );
  }

  void _drawLane(
      Canvas canvas,
      Size size,
      double laneTop,
      double laneH,
      int dir,
      double u,
      double t,
      ) {
    final double w = size.width;
    final Rect laneRect = Rect.fromLTWH(0, laneTop, w, laneH);

    canvas.save();
    canvas.clipRect(laneRect);
    if (dir < 0) {
      canvas.translate(w, 0);
      canvas.scale(-1, 1);
    }

    final double railB = laneTop + laneH * 0.92;
    final double gap = laneH * 0.15;
    final double railF = railB - gap;
    final double wireY = laneTop + laneH * 0.16;

    canvas.drawRect(
      laneRect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF12102A), Color(0xFF1E1A3A)],
        ).createShader(laneRect),
    );

    final Paint pillar = Paint()..color = const Color(0xFF0C0B1E);
    final Paint pillarEdge = Paint()..color = const Color(0xFF2C2850);
    for (double px = 20; px < w; px += 96) {
      canvas.drawRect(
          Rect.fromLTWH(px, laneTop, 7, laneH * 0.9), pillar);
      canvas.drawRect(
          Rect.fromLTWH(px, laneTop, 1, laneH * 0.9), pillarEdge);
    }

    // Plafonniers avec halo
    final Paint lamp = Paint()..color = const Color(0xFFFFE9B0);
    for (double lx = 10; lx < w; lx += 48) {
      final Offset gc = Offset(lx + 8, laneTop + 4);
      canvas.drawCircle(
        gc,
        24,
        Paint()
          ..shader = RadialGradient(
            colors: [
              const Color(0xFFFFE9B0).withOpacity(0.28),
              const Color(0xFFFFE9B0).withOpacity(0.0),
            ],
          ).createShader(Rect.fromCircle(center: gc, radius: 24)),
      );
      canvas.drawRect(Rect.fromLTWH(lx, laneTop + 3, 16, 2.5), lamp);
    }

    canvas.drawLine(
      Offset(0, wireY),
      Offset(w, wireY),
      Paint()
        ..color = const Color(0xFF6A6890)
        ..strokeWidth = 1,
    );

    canvas.drawRect(
      Rect.fromLTRB(0, railF - 1, w, laneTop + laneH),
      Paint()..color = const Color(0xFF262236),
    );
    final Random gr = Random(5);
    final Paint dot = Paint()..color = const Color(0xFF4A4562);
    for (int i = 0; i < 46; i++) {
      final double gx = gr.nextDouble() * w;
      final double gy = railB +
          4 +
          gr.nextDouble() * max(0.0, laneTop + laneH - railB - 4);
      canvas.drawCircle(Offset(gx, gy), 0.9, dot);
    }

    final Paint sleeper = Paint()..color = const Color(0xFF3C3550);
    final Paint sleeperTop = Paint()..color = const Color(0xFF4D456A);
    for (double sx = 4; sx < w; sx += 15) {
      canvas.drawRect(
          Rect.fromLTRB(sx, railF - 2, sx + 6, railB + 3), sleeper);
      canvas.drawRect(
          Rect.fromLTRB(sx, railF - 2, sx + 6, railF - 0.5), sleeperTop);
    }

    canvas.drawLine(
      Offset(0, railF),
      Offset(w, railF),
      Paint()
        ..color = const Color(0xFF8A8FA8)
        ..strokeWidth = 1.6,
    );

    // Métro
    final double cw = w * 0.27;
    const double carGap = 3;
    const int cars = 4;
    final double trainLen = cars * cw + (cars - 1) * carGap;
    final double head = u * (w + trainLen);
    final double trainH = laneH * 0.58;
    final double trainBottom = railB - gap * 0.35;
    final double trainTop = trainBottom - trainH;

    // Faisceau du phare de la rame
    final double bx = head;
    final double by = trainBottom - trainH * 0.25;
    canvas.drawPath(
      Path()
        ..moveTo(bx, by - 2)
        ..lineTo(bx + w * 0.55, by - laneH * 0.30)
        ..lineTo(bx + w * 0.55, by + laneH * 0.20)
        ..lineTo(bx, by + 2)
        ..close(),
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(bx, by),
          Offset(bx + w * 0.55, by),
          [
            Colors.white.withOpacity(0.28),
            Colors.white.withOpacity(0.0),
          ],
        ),
    );

    for (int c = 0; c < cars; c++) {
      final double xr = head - c * (cw + carGap);
      final double xl = xr - cw;
      if (xr < -10 || xl > w + 10) continue;
      _drawCar(
        canvas,
        xl,
        trainTop,
        cw,
        trainH,
        c == 0,
        c == cars - 1,
        c == 1 || c == 2,
        wireY,
        t,
      );
    }

    canvas.drawLine(
      Offset(0, railB),
      Offset(w, railB),
      Paint()
        ..color = const Color(0xFFB5BAD0)
        ..strokeWidth = 2.4,
    );
    canvas.drawLine(
      Offset(0, railB - 1),
      Offset(w, railB - 1),
      Paint()
        ..color = const Color(0xFFE4E7F5)
        ..strokeWidth = 0.8,
    );
    canvas.drawLine(
      Offset(0, railB + 1.6),
      Offset(w, railB + 1.6),
      Paint()
        ..color = const Color(0xFF55506E)
        ..strokeWidth = 1.2,
    );

    canvas.restore();
  }

  void _drawCar(
      Canvas canvas,
      double x,
      double y,
      double cw,
      double ch,
      bool front,
      bool tail,
      bool panto,
      double wireY,
      double t,
      ) {
    final RRect body = RRect.fromRectAndCorners(
      Rect.fromLTWH(x, y, cw, ch),
      topLeft: Radius.circular(tail ? 5 : 3),
      topRight: Radius.circular(front ? ch * 0.45 : 3),
      bottomLeft: Radius.circular(tail ? 3 : 2),
      bottomRight: Radius.circular(front ? 6 : 2),
    );
    canvas.drawRRect(
      body,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE6EBF1),
            Color(0xFFB4BDC8),
            Color(0xFF8E98A6),
          ],
          stops: [0.0, 0.6, 1.0],
        ).createShader(body.outerRect),
    );

    canvas.drawRect(Rect.fromLTWH(x + 2, y, cw - 4, ch * 0.07),
        Paint()..color = const Color(0xFF5B6575));
    canvas.drawRect(Rect.fromLTWH(x, y + ch * 0.72, cw, ch * 0.07),
        Paint()..color = const Color(0xFFD4002A));

    final Paint door = Paint()..color = const Color(0xFF7D8896);
    final Paint doorGlass = Paint()
      ..color = const Color(0xFFFFE6A8).withOpacity(0.9);
    for (final double f in [0.27, 0.66]) {
      canvas.drawRect(
          Rect.fromLTWH(x + cw * f, y + ch * 0.12, cw * 0.08, ch * 0.74),
          door);
      canvas.drawRect(
          Rect.fromLTWH(x + cw * f + cw * 0.012, y + ch * 0.17,
              cw * 0.056, ch * 0.5),
          doorGlass);
    }

    final Paint win = Paint()
      ..color = const Color(0xFFFFE6A8).withOpacity(0.95);
    for (final double f in [0.04, 0.13, 0.37, 0.46, 0.55, 0.76, 0.85]) {
      canvas.drawRect(
          Rect.fromLTWH(x + cw * f, y + ch * 0.14, cw * 0.08, ch * 0.20), win);
      canvas.drawRect(
          Rect.fromLTWH(x + cw * f, y + ch * 0.42, cw * 0.08, ch * 0.22), win);
    }

    final Paint bogie = Paint()..color = const Color(0xFF1E1C2C);
    for (final double f in [0.08, 0.76]) {
      final double bx = x + cw * f;
      canvas.drawRect(
          Rect.fromLTWH(bx, y + ch - 1, cw * 0.16, ch * 0.08), bogie);
      for (final double wf in [0.03, 0.13]) {
        canvas.drawCircle(
            Offset(bx + cw * wf, y + ch + ch * 0.02), ch * 0.07, bogie);
        canvas.drawCircle(
          Offset(bx + cw * wf, y + ch + ch * 0.02),
          ch * 0.03,
          Paint()..color = const Color(0xFF6B6784),
        );
      }
    }

    if (panto) {
      final double px = x + cw * 0.5;
      final Paint pg = Paint()
        ..color = const Color(0xFF3A3750)
        ..strokeWidth = 1.3
        ..strokeCap = StrokeCap.round;
      canvas.drawLine(
          Offset(px - 8, y), Offset(px, (y + wireY) / 2 + 1), pg);
      canvas.drawLine(
          Offset(px + 8, y), Offset(px, (y + wireY) / 2 + 1), pg);
      canvas.drawLine(
          Offset(px, (y + wireY) / 2 + 1), Offset(px, wireY + 1), pg);
      canvas.drawLine(
          Offset(px - 10, wireY + 1), Offset(px + 10, wireY + 1), pg);
      if (sin(t * 120 + x * 0.1) > 0.9) {
        canvas.drawCircle(Offset(px + 4, wireY), 1.6,
            Paint()..color = const Color(0xFFFFF1A8));
        canvas.drawCircle(Offset(px - 3, wireY - 1), 1.0,
            Paint()..color = Colors.white);
      }
    }

    if (front) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
              x + cw - ch * 0.46, y + ch * 0.14, ch * 0.4, ch * 0.38),
          const Radius.circular(4),
        ),
        Paint()..color = const Color(0xFF1B2540),
      );
      final Offset hl = Offset(x + cw - 3, y + ch * 0.78);
      canvas.drawCircle(
        hl,
        14,
        Paint()
          ..shader = RadialGradient(
            colors: [
              Colors.white.withOpacity(0.55),
              Colors.white.withOpacity(0.0),
            ],
          ).createShader(Rect.fromCircle(center: hl, radius: 14)),
      );
      canvas.drawCircle(hl, 2.4, Paint()..color = Colors.white);
    }
    if (tail) {
      canvas.drawCircle(
        Offset(x + 3, y + ch * 0.78),
        2.0,
        Paint()..color = const Color(0xFFFF3B3B),
      );
    }
  }

  void _drawBirds(Canvas canvas, Size size, double t) {
    final double appear = ((t - 0.4) / 0.2).clamp(0.0, 1.0);
    if (appear <= 0) return;
    final Paint paint = Paint()
      ..color = const Color(0xFF2B2145).withOpacity(0.8 * appear)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 5; i++) {
      final double x =
          size.width * (((t * 0.9 + i * 0.13) % 1.2) - 0.1);
      final double y = size.height * (0.30 + i * 0.035) + sin(t * 8 + i) * 6;
      final double flap = sin(t * 60 + i) * 2.5;
      final Path bird = Path()
        ..moveTo(x - 6, y - flap)
        ..quadraticBezierTo(x - 3, y - 4 + flap, x, y)
        ..quadraticBezierTo(x + 3, y - 4 + flap, x + 6, y - flap);
      canvas.drawPath(bird, paint);
    }
  }

  // Poussière lumineuse flottant dans l'air du matin
  void _drawDust(Canvas canvas, Size size, double t, double sunP) {
    final Random rnd = Random(99);
    final Paint paint = Paint();
    final Color tint = Color.lerp(
      const Color(0xFFFFFFFF),
      const Color(0xFFFFE3B0),
      sunP,
    )!;
    for (int i = 0; i < 28; i++) {
      final double x0 = rnd.nextDouble();
      final double y0 = rnd.nextDouble();
      final double speed = 0.04 + rnd.nextDouble() * 0.06;
      final double y = (y0 - t * speed) % 1.0;
      final double x = x0 + 0.02 * sin(t * 6 + i);
      final double r = 0.6 + rnd.nextDouble() * 1.2;
      final double o = 0.08 + 0.12 * (0.5 + 0.5 * sin(t * 10 + i * 2.1));
      paint.color = tint.withOpacity(o);
      canvas.drawCircle(Offset(x * size.width, y * size.height), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParisIntroPainter oldDelegate) => true;
}