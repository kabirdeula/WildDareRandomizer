import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../../../deck/deck.dart';
import '../../rules.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int? _previousSeed;
  Timer? _debounceTimer;
  bool _isShuffling = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  // FIXED: Debounced shuffle to prevent spam
  void _handleShuffle() {
    // Prevent multiple shuffles during animation
    if (_isShuffling) return;

    // Cancel previous debounce timer if exists
    _debounceTimer?.cancel();

    // Set debounce timer
    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() => _isShuffling = true);
        context.read<DeckCubit>().shuffleDeck();

        // Reset shuffling flag after animation completes
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (mounted) {
            setState(() => _isShuffling = false);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeckCubit, DeckState>(
      listener: (context, state) {
        if (state is DeckLoaded) {
          // Trigger animation when shuffle seed changes
          if (_previousSeed != null &&
              _previousSeed != state.currentDeck.shuffleSeed) {
            _controller.forward(from: 0.0);
          }
          _previousSeed = state.currentDeck.shuffleSeed;
        }
      },
      builder: (context, state) {
        if (state is DeckLoading) {
          return const RulesShimmer();
        } else if (state is DeckLoaded) {
          final rules = state.displayedRules;
          final playedCount = state.playedRuleIds.length;
          final totalCount = rules.length.clamp(0, 16);

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(AppConstants.appName),
              actions: [
                // Deck selector button
                BlocBuilder<DeckCubit, DeckState>(
                  builder: (context, deckState) {
                    if (deckState is DeckLoaded) {
                      return PopupMenuButton<String>(
                        icon: const Icon(Icons.layers),
                        tooltip: 'Select Deck',
                        onSelected: (value) {
                          if (value == 'manage') {
                            context.push(AppRoute.deckManagement.path);
                            return;
                          }
                          context.read<DeckCubit>().selectDeck(value);
                        },
                        itemBuilder: (context) {
                          return [
                            ...deckState.decks.map((deck) {
                              return PopupMenuItem<String>(
                                value: deck.id,
                                child: Row(
                                  children: [
                                    if (deck.id == deckState.currentDeck.id)
                                      const Icon(Icons.check, size: 20)
                                    else
                                      const SizedBox(width: 20),
                                    const SizedBox(width: 8),
                                    Expanded(child: Text(deck.name)),
                                    Text(
                                      '${deck.ruleIds.length}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              );
                            }),
                            const PopupMenuDivider(),
                            const PopupMenuItem<String>(
                              value: 'manage',
                              child: Row(
                                children: [
                                  Icon(Icons.settings, size: 20),
                                  SizedBox(width: 8),
                                  Text('Manage Decks'),
                                ],
                              ),
                            ),
                          ];
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
                ),
              ),
              child: Column(
                children: [
                  // Progress header
                  _ProgressHeader(
                    playedCount: playedCount,
                    totalCount: totalCount,
                    sessionStarted: state.sessionStarted,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: GridView.builder(
                        key: ValueKey(state.currentDeck.shuffleSeed),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: dynamicCrossAxisCount(context),
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: totalCount,
                        itemBuilder: (context, index) {
                          final rule = rules[index];
                          final isPlayed = state.playedRuleIds.contains(
                            rule.id,
                          );

                          return _AnimatedRuleCard(
                            key: ValueKey(rule.id),
                            rule: rule,
                            index: index,
                            isPlayed: isPlayed,
                            animationController: _controller,
                            animationIndex: index,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    RuleDetailDialog(rule: rule, index: index),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Reset button
                if (playedCount > 0)
                  FloatingActionButton(
                    heroTag: 'reset',
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Reset Progress'),
                          content: const Text(
                            'Are you sure you want to reset all played rules?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: const Text('Cancel'),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: const Text('Reset'),
                            ),
                          ],
                        ),
                      );

                      if (confirmed == true && context.mounted) {
                        context.read<DeckCubit>().resetPlayedRules();
                      }
                    },
                    backgroundColor: Colors.orange,
                    child: const Icon(Icons.refresh),
                  ),

                if (playedCount > 0) const SizedBox(height: 12),
                // FIXED: Shuffle button with debouncing and visual feedback
                FloatingActionButton.extended(
                  heroTag: 'shuffle',
                  onPressed: _isShuffling ? null : _handleShuffle,
                  icon: _isShuffling
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          ),
                        )
                      : const Icon(Icons.shuffle),
                  label: Text(_isShuffling ? 'Shuffling...' : 'Shuffle'),
                  backgroundColor: _isShuffling
                      ? const Color(0xFF9B59B6).withOpacitySafe(0.7)
                      : const Color(0xFF9B59B6),
                ),
              ],
            ),
          );
        } else if (state is DeckFailure) {
          return ErrorScreen(error: state.error, onRetry: () {});
        } else {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(AppConstants.appName),
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  final int playedCount;
  final int totalCount;
  final DateTime sessionStarted;

  const _ProgressHeader({
    required this.playedCount,
    required this.totalCount,
    required this.sessionStarted,
  });

  String _getSessionDuration() {
    final duration = DateTime.now().difference(sessionStarted);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m';
    } else {
      return 'Just started';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = totalCount > 0 ? playedCount / totalCount : 0.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacitySafe(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Progress circle
              SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress >= 1.0
                            ? Colors.green
                            : const Color(0xFF9B59B6),
                      ),
                    ),
                    Center(
                      child: Text(
                        '$playedCount',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$playedCount of $totalCount rules played',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Session: ${_getSessionDuration()}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Completion badge
              if (progress >= 1.0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Complete!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          // Instruction hint
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF9B59B6).withOpacitySafe(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Color(0xFF9B59B6),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Tap to view details • Long press to mark as played',
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedRuleCard extends StatelessWidget {
  final RuleEntity rule;
  final int index;
  final bool isPlayed;
  final AnimationController animationController;
  final int animationIndex;
  final VoidCallback onTap;

  const _AnimatedRuleCard({
    super.key,
    required this.rule,
    required this.index,
    required this.isPlayed,
    required this.animationController,
    required this.animationIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Staggered animation delay
    final delay = animationIndex * 0.05;

    final slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: animationController,
            curve: Interval(
              delay.clamp(0.0, 0.8),
              (delay + 0.2).clamp(0.2, 1.0),
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          delay.clamp(0.0, 0.8),
          (delay + 0.2).clamp(0.2, 1.0),
          curve: Curves.easeIn,
        ),
      ),
    );

    final rotateAnimation = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(
          delay.clamp(0.0, 0.8),
          (delay + 0.2).clamp(0.2, 1.0),
          curve: Curves.easeOut,
        ),
      ),
    );

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(rotateAnimation.value),
              alignment: Alignment.center,
              child: child,
            ),
          ),
        );
      },
      child: RuleCard(
        rule: rule,
        index: index,
        isPlayed: isPlayed,
        onTap: onTap,
      ),
    );
  }
}
