import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';

import 'screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<RuleModel> randomizedRules = [];
  bool isGridView = false;

  @override
  void initState() {
    super.initState();
    loadInitialRules();
  }

  void loadInitialRules() async {
    List<RuleModel> predefinedRules = await loadRulesFromJson();

    var box = Hive.box(Config.kHiveBox);
    List<RuleModel> customRules = [];

    for (var rule in box.values) {
      if (rule is Map &&
          rule.containsKey('title') &&
          rule.containsKey('description')) {
        customRules.add(
          RuleModel(title: rule['title'], description: rule['description']),
        );
      }
    }

    setState(() {
      randomizedRules = [...predefinedRules, ...customRules];
      randomizedRules.shuffle();
      randomizedRules = randomizedRules.take(16).toList();
    });
  }

  Future<List<RuleModel>> loadRulesFromJson() async {
    final String response = await rootBundle.loadString('assets/rules.json');
    final List<dynamic> data = json.decode(response);

    return data.map((json) => RuleModel.fromJson(json)).toList();
  }

  void randomizeRules() async {
    var box = Hive.box(Config.kHiveBox);
    List<RuleModel> customRules = [];

    for (var rule in box.values) {
      if (rule is Map &&
          rule.containsKey('title') &&
          rule.containsKey('description')) {
        customRules.add(
          RuleModel(title: rule['title'], description: rule['description']),
        );
      }
    }

    List<RuleModel> allRules = [...await loadRulesFromJson(), ...customRules];
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
          title: Text('${index + 1}: ${randomizedRules[index].title}'),
          subtitle: Text(randomizedRules[index].description),
        );
      },
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
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
                  '${index + 1}: ${randomizedRules[index].title}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  randomizedRules[index].description,
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
