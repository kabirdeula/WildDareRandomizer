import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../deck.dart';

class DeckManagementScreen extends StatelessWidget {
  const DeckManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Decks')),
      body: BlocBuilder<DeckCubit, DeckState>(
        builder: (context, state) {
          if (state is DeckLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DeckLoaded) {
            final decks = state.decks;

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: decks.length,
              itemBuilder: (context, index) {
                final deck = decks[index];
                final isDefault = deck.id == 'all_rules';

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.colorScheme.primaryContainer,
                      child: Text(
                        '${deck.ruleIds.length}',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      deck.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${deck.ruleIds.length} rules • Updated ${_formatDate(deck.updatedAt)}',
                    ),
                    trailing: isDefault
                        ? const Chip(label: Text('Default'))
                        : PopupMenuButton<String>(
                            onSelected: (value) async {
                              if (value == 'edit') {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      DeckBuilderDialog(existingDeck: deck),
                                );
                              } else if (value == 'delete') {
                                final confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Delete Deck'),
                                    content: Text(
                                      'Are you sure you want to delete "${deck.name}"?',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                      FilledButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirmed == true && context.mounted) {
                                  await context.read<DeckCubit>().deleteDeck(
                                    deck.id,
                                  );
                                }
                              }
                            },
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, size: 20),
                                    SizedBox(width: 8),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, size: 20),
                                    SizedBox(width: 8),
                                    Text('Delete'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    onTap: () {
                      context.read<DeckCubit>().selectDeck(deck.id);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('Error loading decks'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const DeckBuilderDialog(),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('New Deck'),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 7) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else {
      return 'just now';
    }
  }
}
