import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../rules/rules.dart';
import '../../deck.dart';

class DeckBuilderDialog extends StatefulWidget {
  final DeckEntity? existingDeck;

  const DeckBuilderDialog({super.key, this.existingDeck});

  @override
  State<DeckBuilderDialog> createState() => _DeckBuilderDialogState();
}

class _DeckBuilderDialogState extends State<DeckBuilderDialog> {
  late TextEditingController _nameController;
  late Set<String> _selectedRuleIds;
  String _searchQuery = '';
  String? _selectedLevel;
  String? _selectedTag;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.existingDeck?.name ?? '',
    );
    _selectedRuleIds = widget.existingDeck?.ruleIds.toSet() ?? {};
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  List<RuleEntity> _getFilteredRules(List<RuleEntity> allRules) {
    return allRules.where((rule) {
      final matchesSearch =
          _searchQuery.isEmpty ||
          rule.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          rule.description.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesLevel =
          _selectedLevel == null || rule.level == _selectedLevel;

      final matchesTag =
          _selectedTag == null || rule.tags.contains(_selectedTag);

      return matchesSearch && matchesLevel && matchesTag;
    }).toList();
  }

  Set<String> _getAllTags(List<RuleEntity> rules) {
    final tags = <String>{};
    for (var rule in rules) {
      tags.addAll(rule.tags);
    }
    return tags;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<DeckCubit, DeckState>(
      builder: (context, state) {
        if (state is! DeckLoaded) {
          return const Center(child: CircularProgressIndicator());
        }

        final filteredRules = _getFilteredRules(state.allRules);
        final allTags = _getAllTags(state.allRules);
        final allLevels = state.allRules.map((r) => r.level).toSet().toList();

        return Dialog(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800, maxHeight: 700),
            child: Column(
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.existingDeck == null
                                  ? 'Create Deck'
                                  : 'Edit Deck',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Deck Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Selected: ${_selectedRuleIds.length} rules (minimum 16)',
                        style: TextStyle(
                          color: _selectedRuleIds.length < 16
                              ? theme.colorScheme.error
                              : theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Filters
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Search rules',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() => _searchQuery = value);
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Filter by Level',
                                border: OutlineInputBorder(),
                              ),
                              value: _selectedLevel,
                              items: [
                                const DropdownMenuItem(
                                  value: null,
                                  child: Text('All Levels'),
                                ),
                                ...allLevels.map((level) {
                                  return DropdownMenuItem(
                                    value: level,
                                    child: Text(level),
                                  );
                                }),
                              ],
                              onChanged: (value) {
                                setState(() => _selectedLevel = value);
                              },
                            ),
                          ),
                          const SizedBox(width: 12),

                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Filter by Tag',
                                border: OutlineInputBorder(),
                              ),
                              value: _selectedTag,
                              items: [
                                const DropdownMenuItem(
                                  value: null,
                                  child: Text('All Tags'),
                                ),
                                ...allTags.map((tag) {
                                  return DropdownMenuItem(
                                    value: tag,
                                    child: Text(tag),
                                  );
                                }),
                              ],
                              onChanged: (value) {
                                setState(() => _selectedTag = value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Rules list
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredRules.length,
                    itemBuilder: (context, index) {
                      final rule = filteredRules[index];
                      final isSelected = _selectedRuleIds.contains(rule.id);

                      return CheckboxListTile(
                        title: Text(rule.title),
                        subtitle: Text(
                          rule.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            if (value == true) {
                              _selectedRuleIds.add(rule.id);
                            } else {
                              _selectedRuleIds.remove(rule.id);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),

                // Actions
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton(
                          onPressed: _selectedRuleIds.length >= 16
                              ? () async {
                                  try {
                                    final cubit = context.read<DeckCubit>();
                                    if (widget.existingDeck == null) {
                                      await cubit.createDeck(
                                        _nameController.text.trim(),
                                        _selectedRuleIds.toList(),
                                      );
                                    } else {
                                      await cubit.updateDeck(
                                        widget.existingDeck!.id,
                                        _nameController.text.trim(),
                                        _selectedRuleIds.toList(),
                                      );
                                    }
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  } catch (e) {
                                    if (context.mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(e.toString())),
                                      );
                                    }
                                  }
                                }
                              : null,
                          child: Text(
                            widget.existingDeck == null ? 'Create' : 'Update',
                          ),
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
}
