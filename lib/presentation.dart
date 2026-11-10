import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'profil.dart' hide BubbleTheme, localizedSlides, localizedUi, ArcDeTriomphePainter;

class PresentationScreen extends StatefulWidget {
  final String languageCode;
  const PresentationScreen({super.key, this.languageCode = 'fr'});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen>
    with TickerProviderStateMixin {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  late String _currentLanguage;

  late final AnimationController _entrance; // apparition en cascade
  late final AnimationController _ambient; // animations en boucle (orbites, reflets)
  late final AnimationController _pulse; // pulsation du bouton

  static const Color _coral = Color(0xFFFF5252);
  static const Color _teal = Color(0xFF00BFA5);

  static const Map<String, String> _skipLabels = {
    'fr': 'Passer',
    'en': 'Skip',
    'ar': 'تخطي',
  };

  @override
  void initState() {
    super.initState();
    _currentLanguage = widget.languageCode;

    _entrance = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();
    _ambient = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    _entrance.dispose();
    _ambient.dispose();
    _pulse.dispose();
    super.dispose();
  }

  IconData _getSlideIcon(String? iconType) {
    switch (iconType) {
      case 'compass':
        return Icons.explore_rounded;
      case 'landscape':
        return Icons.landscape_rounded;
      case 'stars':
        return Icons.auto_awesome_rounded;
      case 'explore':
        return Icons.travel_explore_rounded;
      default:
        return Icons.location_on_rounded;
    }
  }

  Color _slideColor(String? iconType) {
    switch (iconType) {
      case 'compass':
        return _coral;
      case 'landscape':
        return _teal;
      case 'stars':
        return BubbleTheme.accentGold;
      case 'explore':
        return BubbleTheme.primaryGradientStart;
      default:
        return _coral;
    }
  }

  void _cycleLanguage() {
    HapticFeedback.selectionClick();
    setState(() {
      if (_currentLanguage == 'fr') {
        _currentLanguage = 'en';
      } else if (_currentLanguage == 'en') {
        _currentLanguage = 'ar';
      } else {
        _currentLanguage = 'fr';
      }
    });
  }

  void _goNext(int count) {
    if (_currentIndex >= count - 1) {
      _finishOnboarding();
    } else {
      HapticFeedback.selectionClick();
      _controller.nextPage(
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _skip(int count) {
    HapticFeedback.selectionClick();
    _controller.animateToPage(
      count - 1,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }

  void _finishOnboarding() async {
    HapticFeedback.mediumImpact();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('has_seen_onboarding', true);

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(languageCode: _currentLanguage),
      ),
    );
  }

  Widget _stagger(double start, double end, Widget child) {
    return AnimatedBuilder(
      animation: _entrance,
      child: child,
      builder: (context, ch) {
        final double p = Curves.easeOutCubic.transform(
          ((_entrance.value - start) / (end - start)).clamp(0.0, 1.0).toDouble(),
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
    final slides =
        localizedSlides[_currentLanguage] ?? localizedSlides['fr'] ?? [];
    final uiText = localizedUi[_currentLanguage] ?? localizedUi['fr'] ?? {};
    final bool isRtl = _currentLanguage == 'ar';

    final String nextLabel = uiText['next'] ?? 'Continuer';
    final String finishLabel = uiText['finish'] ?? 'Créer mon profil';
    final String countryLabel = uiText['country'] ?? 'France';
    final String skipLabel =
        uiText['skip'] ?? _skipLabels[_currentLanguage] ?? 'Passer';

    final int count = slides.length;
    final int safeIndex =
    count == 0 ? 0 : _currentIndex.clamp(0, count - 1).toInt();
    final Color accent = count == 0
        ? _coral
        : _slideColor('${slides[safeIndex]['icon'] ?? ''}');
    final bool isLast = count > 0 && safeIndex == count - 1;

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: BubbleTheme.background,
        body: SafeArea(
          child: Column(
            children: [
              _stagger(
                0.0,
                0.5,
                _buildTopBar(
                  countryLabel: countryLabel,
                  skipLabel: skipLabel,
                  count: count,
                  showSkip: !isLast,
                ),
              ),
              Expanded(
                child: _stagger(
                  0.1,
                  0.8,
                  PageView.builder(
                    controller: _controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: count,
                    onPageChanged: (index) {
                      HapticFeedback.selectionClick();
                      setState(() => _currentIndex = index);
                    },
                    itemBuilder: (context, index) =>
                        _buildPage(slides[index], index, isRtl),
                  ),
                ),
              ),
              _stagger(
                0.35,
                1.0,
                TweenAnimationBuilder<Color?>(
                  tween: ColorTween(end: accent),
                  duration: const Duration(milliseconds: 500),
                  builder: (context, c, _) => _buildBottom(
                    count: count,
                    accent: c ?? accent,
                    label: isLast ? finishLabel : nextLabel,
                    isLast: isLast,
                    isRtl: isRtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  BARRE DU HAUT : langue, pays, passer
  // ---------------------------------------------------------------------
  Widget _buildTopBar({
    required String countryLabel,
    required String skipLabel,
    required int count,
    required bool showSkip,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 6),
      child: SizedBox(
        height: 44,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: GestureDetector(
                onTap: _cycleLanguage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 14, sigmaY: 14),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.language_rounded,
                            color: BubbleTheme.accentGold,
                            size: 16,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _currentLanguage == 'fr'
                                ? '🇫🇷 FR'
                                : _currentLanguage == 'en'
                                ? '🇬🇧 EN'
                                : '🇸🇦 AR',
                            style: const TextStyle(
                              color: BubbleTheme.textLight,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20,
                    height: 16,
                    child: CustomPaint(
                      painter:
                      ArcDeTriomphePainter(color: BubbleTheme.accentGold),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    countryLabel,
                    style: const TextStyle(
                      color: BubbleTheme.textLight,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AnimatedOpacity(
                opacity: showSkip ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: IgnorePointer(
                  ignoring: !showSkip,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => _skip(count),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 10),
                      child: Text(
                        skipLabel,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------
  //  UNE PAGE : illustration orbitale + carte
  // ---------------------------------------------------------------------
  Widget _buildPage(Map<String, dynamic> slide, int index, bool isRtl) {
    final String iconType = '${slide['icon'] ?? ''}';
    final Color color = _slideColor(iconType);
    final IconData icon = _getSlideIcon(iconType);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        double page = _currentIndex.toDouble();
        if (_controller.hasClients && _controller.position.haveDimensions) {
          page = _controller.page ?? page;
        }
        final double d = (page - index).clamp(-1.0, 1.0).toDouble();
        final double a = d.abs();
        final double dir = isRtl ? -1.0 : 1.0;

        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: (1 - a * 1.2).clamp(0.0, 1.0).toDouble(),
                  child: Transform.translate(
                    offset: Offset(-d * 80 * dir, 0),
                    child: Transform.scale(
                      scale: 1 - a * 0.25,
                      child: _PresHero(
                        animation: _ambient,
                        color: color,
                        icon: icon,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Opacity(
                  opacity: (1 - a * 1.5).clamp(0.0, 1.0).toDouble(),
                  child: Transform.translate(
                    offset: Offset(-d * 24 * dir, 0),
                    child: _buildCard(
                      tag: '${slide['tag'] ?? ''}',
                      title: '${slide['title'] ?? ''}',
                      highlight: '${slide['highlight'] ?? ''}',
                      description: '${slide['description'] ?? ''}',
                      color: color,
                      isRtl: isRtl,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCard({
    required String tag,
    required String title,
    required String highlight,
    required String description,
    required Color color,
    required bool isRtl,
  }) {
    return AnimatedBuilder(
      animation: _ambient,
      builder: (context, _) {
        final double shimmer = (_ambient.value * 3) % 1.0;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.30),
                color.withOpacity(0.08),
                const Color(0xFF17132B).withOpacity(0.88),
              ],
            ),
            border: Border.all(color: color.withOpacity(0.55), width: 1.4),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.28),
                blurRadius: 34,
                spreadRadius: -4,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(
              children: [
                // Reflet lumineux qui balaie la carte
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-2.0 + 4.0 * shimmer, -0.4),
                          end: Alignment(-1.0 + 4.0 * shimmer, 0.4),
                          colors: [
                            Colors.white.withOpacity(0.0),
                            color.withOpacity(0.16),
                            Colors.white.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // Liseré lumineux sur le bord de départ
                PositionedDirectional(
                  start: 0,
                  top: 30,
                  bottom: 30,
                  width: 4,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadiusDirectional.horizontal(
                        end: Radius.circular(4),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [color, BubbleTheme.primaryGradientEnd],
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
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.16),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: color.withOpacity(0.4)),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Colors.white.withOpacity(0.95),
                            letterSpacing: isRtl ? 0 : 1.6,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (rect) => LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.9),
                            color.withOpacity(0.95),
                          ],
                          stops: const [0.0, 0.6, 1.0],
                        ).createShader(rect),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w800,
                            height: 1.25,
                            letterSpacing: isRtl ? 0 : -0.3,
                            shadows: [
                              Shadow(
                                color: color.withOpacity(0.45),
                                blurRadius: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.auto_awesome_rounded,
                            color: BubbleTheme.accentGold,
                            size: 15,
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              highlight,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: BubbleTheme.accentGold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.auto_awesome_rounded,
                            color: BubbleTheme.accentGold,
                            size: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: 56,
                        height: 3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          gradient: LinearGradient(
                            colors: [color, BubbleTheme.primaryGradientEnd],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.6),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.5,
                          color: Colors.white.withOpacity(0.68),
                          height: 1.65,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------
  //  BAS : indicateurs + bouton
  // ---------------------------------------------------------------------
  Widget _buildBottom({
    required int count,
    required Color accent,
    required String label,
    required bool isLast,
    required bool isRtl,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 26),
      child: AnimatedBuilder(
        animation: Listenable.merge([_pulse, _ambient]),
        builder: (context, _) {
          final double pulse = Curves.easeInOut.transform(_pulse.value);
          final double shimmer = (_ambient.value * 5) % 1.0;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(count, (index) {
                  final bool active = _currentIndex == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOutCubic,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 32 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      gradient: active
                          ? LinearGradient(
                        colors: [accent, BubbleTheme.primaryGradientEnd],
                      )
                          : null,
                      color: active ? null : Colors.white.withOpacity(0.16),
                      boxShadow: active
                          ? [
                        BoxShadow(
                          color: accent.withOpacity(0.6),
                          blurRadius: 10,
                        ),
                      ]
                          : const [],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: BubbleTheme.primaryGradientEnd
                          .withOpacity(0.28 + 0.26 * pulse),
                      blurRadius: 22 + 12 * pulse,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Material(
                    color: Colors.transparent,
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            BubbleTheme.primaryGradientStart,
                            accent,
                            BubbleTheme.primaryGradientEnd,
                          ],
                          stops: const [0.0, 0.55, 1.0],
                        ),
                      ),
                      child: InkWell(
                        onTap: () => _goNext(count),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: IgnorePointer(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin:
                                      Alignment(-2.0 + 4.0 * shimmer, -0.5),
                                      end:
                                      Alignment(-1.0 + 4.0 * shimmer, 0.5),
                                      colors: [
                                        Colors.white.withOpacity(0.0),
                                        Colors.white.withOpacity(0.32),
                                        Colors.white.withOpacity(0.0),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: Text(
                                      label,
                                      key: ValueKey<String>(label),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: isRtl ? 0 : 0.4,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Transform.translate(
                                    offset: Offset(
                                      isLast
                                          ? 0
                                          : (isRtl ? -1 : 1) * 4 * pulse,
                                      0,
                                    ),
                                    child: Icon(
                                      isLast
                                          ? Icons.person_add_alt_1_rounded
                                          : (isRtl
                                          ? Icons.arrow_back_rounded
                                          : Icons.arrow_forward_rounded),
                                      color: Colors.white,
                                      size: 20,
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
          );
        },
      ),
    );
  }
}

// ===========================================================================
//  ILLUSTRATION ORBITALE (icône centrale + anneaux animés)
// ===========================================================================

class _PresHero extends StatelessWidget {
  final Animation<double> animation;
  final Color color;
  final IconData icon;

  const _PresHero({
    required this.animation,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          final double a = animation.value * 2 * pi;
          return Stack(
            alignment: Alignment.center,
            children: [
              // Halo doux
              Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      color.withOpacity(0.26 + 0.08 * sin(a * 5)),
                      color.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
              CustomPaint(
                size: const Size(180, 180),
                painter: _PresHeroPainter(angle: a, color: color),
              ),
              Transform.translate(
                offset: Offset(0, sin(a * 7) * 4),
                child: Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color,
                        Color.lerp(color, BubbleTheme.primaryGradientEnd, 0.6)!,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.55),
                        blurRadius: 34,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              center: const Alignment(-0.45, -0.55),
                              radius: 0.9,
                              colors: [
                                Colors.white.withOpacity(0.38),
                                Colors.white.withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Icon(icon, color: Colors.white, size: 42),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PresHeroPainter extends CustomPainter {
  final double angle;
  final Color color;

  _PresHeroPainter({required this.angle, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset c = size.center(Offset.zero);
    final double rOuter = size.width / 2 - 6;
    final double rInner = rOuter - 24;

    void ring(double r, Color arc, double rotation, double width) {
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
          ..strokeWidth = width
          ..strokeCap = StrokeCap.round
          ..shader = SweepGradient(
            colors: [
              arc.withOpacity(0.0),
              arc,
              arc.withOpacity(0.0),
            ],
            transform: GradientRotation(rotation),
          ).createShader(rect),
      );
    }

    // Anneau extérieur + 3 satellites
    ring(rOuter, color, angle * 2, 2.6);
    for (int k = 0; k < 3; k++) {
      final double ang = angle * 2 + k * 2 * pi / 3;
      final Offset pos = c + Offset(cos(ang), sin(ang)) * rOuter;
      final Color dot = k == 0 ? BubbleTheme.accentGold : color;
      canvas.drawCircle(pos, 7, Paint()..color = dot.withOpacity(0.25));
      canvas.drawCircle(pos, 3, Paint()..color = dot);
    }

    // Anneau intérieur (sens inverse) + 2 satellites
    ring(rInner, BubbleTheme.primaryGradientEnd, -angle * 3, 2.0);
    for (int k = 0; k < 2; k++) {
      final double ang = -angle * 3 + k * pi;
      final Offset pos = c + Offset(cos(ang), sin(ang)) * rInner;
      canvas.drawCircle(
        pos,
        5,
        Paint()..color = BubbleTheme.primaryGradientEnd.withOpacity(0.25),
      );
      canvas.drawCircle(
        pos,
        2.2,
        Paint()..color = BubbleTheme.primaryGradientEnd,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _PresHeroPainter old) =>
      old.angle != angle || old.color != color;
}