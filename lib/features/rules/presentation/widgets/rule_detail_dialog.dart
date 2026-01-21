import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../rules.dart';

class RuleDetailDialog extends StatefulWidget {
  final RuleEntity rule;
  final int index;

  const RuleDetailDialog({super.key, required this.rule, required this.index});

  @override
  State<RuleDetailDialog> createState() => _RuleDetailDialogState();
}

class _RuleDetailDialogState extends State<RuleDetailDialog> {
  late RuleDisplay _ruleDisplay;

  @override
  void initState() {
    super.initState();
    _ruleDisplay = RuleDisplayHelper.processRule(widget.rule);
  }

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

  void _rerollValues() {
    setState(() {
      _ruleDisplay = RuleDisplayHelper.processRule(widget.rule);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cardColor = _getCardColor();
    final hasRerollFlag = widget.rule.flags.contains('tap-to-reroll');

    return Dialog(
      backgroundColor: Colors.transparent,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: ModalRoute.of(context)!.animation!,
          curve: Curves.easeOutBack,
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: cardColor.withOpacitySafe(0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // * Header with color accent
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  children: [
                    // * Rule number badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacitySafe(0.9),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacitySafe(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        'Rule #${widget.index + 1}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: cardColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),

                    // * Reroll button
                    if (hasRerollFlag && _ruleDisplay.canReroll)
                      IconButton(
                        onPressed: _rerollValues,
                        icon: const Icon(Icons.casino),
                        color: Colors.white,
                        tooltip: 'Reroll random values',
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacitySafe(0.2),
                        ),
                      ),
                    const SizedBox(height: 20),

                    // * Title with random values
                    Text(
                      _ruleDisplay.processedTitle,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium?.copyWith(
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
                  ],
                ),
              ),

              // * Content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // * Show generated values if any
                      if (_ruleDisplay.generatedValues.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: cardColor.withOpacitySafe(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: cardColor,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Random values: ${_ruleDisplay.generatedValues.entries.map((e) => '${e.key}=${e.value}').join(', ')}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],

                      // * Description section
                      _SectionLabel(label: 'Description', color: cardColor),
                      const SizedBox(height: 12),
                      Text(
                        _ruleDisplay.processedDescription,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[800],
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // * Clarification section
                      if (_ruleDisplay.processedClarification != null &&
                          _ruleDisplay.processedClarification!.isNotEmpty) ...[
                        _SectionLabel(label: 'Clarification', color: cardColor),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: cardColor.withOpacitySafe(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: cardColor.withOpacitySafe(0.3),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            _ruleDisplay.processedClarification!,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[800],
                              height: 1.6,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              // Close button
              Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cardColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  final Color color;

  const _SectionLabel({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: 1,
            textBaseline: TextBaseline.alphabetic,
          ),
        ),
      ],
    );
  }
}
