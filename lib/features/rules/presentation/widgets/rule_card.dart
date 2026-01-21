import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../deck/deck.dart';
import '../../rules.dart';

class RuleCard extends StatefulWidget {
  final RuleEntity rule;
  final int index;
  final bool isPlayed;
  final VoidCallback onTap;

  const RuleCard({
    super.key,
    required this.rule,
    required this.index,
    required this.onTap,
    required this.isPlayed,
  });

  @override
  State<RuleCard> createState() => _RuleCardState();
}

class _RuleCardState extends State<RuleCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late RuleDisplay _ruleDisplay;
  late AnimationController _playedController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Generate random values when card is created
    _ruleDisplay = RuleDisplayHelper.processRule(widget.rule);

    _playedController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _playedController, curve: Curves.easeInOut),
    );

    if (widget.isPlayed) {
      _playedController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(RuleCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPlayed != widget.isPlayed) {
      if (widget.isPlayed) {
        _playedController.forward();
      } else {
        _playedController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _playedController.dispose();
    super.dispose();
  }

  // Playful color palette for different rule levels
  Color _getCardColor() {
    final colors = [
      const Color(0xFFFF6B9D), // Pink
      const Color(0xFF4ECDC4), // Teal
      const Color(0xFFFFA07A), // Coral
      const Color(0xFF95E1D3), // Mint
      const Color(0xFFFFC947), // Yellow
      const Color(0xFF9B59B6), // Purple
      const Color(0xFF3498DB), // Blue
      const Color(0xFFE74C3C), // Red
    ];
    return colors[widget.index % colors.length];
  }

  void _rerollValues() =>
      setState(() => _ruleDisplay = RuleDisplayHelper.processRule(widget.rule));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = _getCardColor();
    final hasRerollFlag = widget.rule.flags.contains('tap-to-reroll');

    return ScaleTransition(
      scale: _scaleAnimation,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          onDoubleTap: hasRerollFlag && _ruleDisplay.canReroll
              ? _rerollValues
              : null,
          onLongPress: () {
            context.read<DeckCubit>().toggleRulePlayed(widget.rule.id);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.identity()
              ..translateByDouble(0.0, _isHovered ? -8.0 : 0.0, 0.0, 1.0)
              ..rotateZ(_isHovered ? -0.02 : 0.0),
            child: Stack(
              children: [
                // * Main Card
                Container(
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: cardColor.withAlpha(
                          _isHovered
                              ? (0.4 * 255).round()
                              : (0.25 * 255).round(),
                        ),
                        blurRadius: _isHovered ? 20 : 12,
                        offset: Offset(0, _isHovered ? 12 : 6),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      // * Decorative circle pattern
                      Positioned(
                        top: -20,
                        right: -20,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacitySafe(0.15),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -30,
                        left: -30,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacitySafe(0.1),
                          ),
                        ),
                      ),

                      // * Rule number badge
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacitySafe(0.9),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacitySafe(0.1),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            '#${widget.index + 1}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: cardColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),

                      // * Reroll indicator
                      if (hasRerollFlag && _ruleDisplay.canReroll)
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacitySafe(0.9),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacitySafe(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.casino,
                              size: 16,
                              color: cardColor,
                            ),
                          ),
                        ),

                      // * Rule title  (with processed random values)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            _ruleDisplay.processedTitle,
                            // widget.rule.title,
                            textAlign: TextAlign.center,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              height: 1.2,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacitySafe(0.2),
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // * Playful corner accent
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                          ),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.white.withOpacitySafe(0.0),
                                  Colors.white.withOpacitySafe(0.2),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Played overlay
                if (widget.isPlayed)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacitySafe(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacitySafe(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(Icons.check, color: cardColor, size: 48),
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
