import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';

import 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> predefinedRules = {
    'Skip Two Turns': 'The next player skips two turns.',
    'Discard Same Color':
        'You can discard all cards of the same color in one turn.',
    'Take 15 Cards': 'You must draw 15 cards from the deck.',
    'Reverse Skip':
        'The turn order is reversed, and the next player is skipped.',
    'Stack Draws': 'You can stack draw cards until the next player draws.',
    'All Players Draw 5': 'All players must draw 5 cards.',
    'Discard Same Number':
        'You can discard all cards with the same number at once.',
    'Swap Hands': 'You can swap hands with any player of your choice.',
    'Free Pass': 'You get a free pass and skip your turn.',
    'Wild Draw Skip': 'You can play a wild draw card and skip the next player.',
    'Discard or Draw': 'You either discard one card or draw one card.',
    'Silent Round': 'No talking is allowed for the rest of the round.',
    'Shuffle but Escape': 'Shuffle the deck but skip your turn.',
    'Trade Hands': 'Trade hands with the player next to you.',
    'No Special Cards': 'Special cards cannot be played until the next round.',
    'Ultimate Uno': 'All players must play with open cards for one round.'
  };

  List<MapEntry<String, String>> randomizedRules = [];
  bool isGridView = false;

  @override
  void initState() {
    super.initState();
    loadInitialRules();
  }

  void loadInitialRules() async {
    var box = Hive.box(Config.kHiveBox);
    List<MapEntry<String, String>> customRules = [];

    for (var rule in box.values) {
      if (rule is Map &&
          rule.containsKey('title') &&
          rule.containsKey('description')) {
        customRules.add(MapEntry(rule['title'], rule['description']));
      }
    }

    setState(() {
      randomizedRules = [...predefinedRules.entries, ...customRules];
      randomizedRules.shuffle();
      randomizedRules = randomizedRules.take(16).toList();
    });
  }

  void randomizeRules() async {
    var box = Hive.box(Config.kHiveBox);
    List<MapEntry<String, String>> customRules = [];

    for (var rule in box.values) {
      if (rule is Map &&
          rule.containsKey('title') &&
          rule.containsKey('description')) {
        customRules.add(MapEntry(rule['title'], rule['description']));
      }
    }

    List<MapEntry<String, String>> allRules = [
      ...predefinedRules.entries,
      ...customRules
    ];
    allRules.shuffle();

    setState(() {
      randomizedRules = allRules.take(16).toList();
    });
  }

  void toggleViewMode() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uno Dare Randomizer'),
        actions: [
          IconButton(
            onPressed: toggleViewMode,
            icon: isGridView
                ? const Icon(Icons.view_list)
                : const Icon(Icons.grid_view),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CustomRuleScreen()),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: isGridView ? buildGridView() : buildListView()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: randomizeRules,
              child: const Text('Randomize Rules'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: randomizedRules.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${index + 1}: ${randomizedRules[index].key}'),
          subtitle: Text(randomizedRules[index].value),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: randomizedRules.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${index + 1}: ${randomizedRules[index].key}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  randomizedRules[index].value,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
