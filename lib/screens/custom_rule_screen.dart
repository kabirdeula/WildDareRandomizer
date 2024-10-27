import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wild_dare_randomizer/app/app.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class CustomRuleScreen extends StatefulWidget {
  const CustomRuleScreen({super.key});

  @override
  State<CustomRuleScreen> createState() => _CustomRuleScreenState();
}

class _CustomRuleScreenState extends State<CustomRuleScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final box = Hive.box(Config.kHiveBox);

  void addCustomRule() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      final newRule = {
        'title': titleController.text,
        'description': descriptionController.text,
      };

      // Clear the box if it contains invalid data (optional, for testing)
      // You might want to remove this after testing.
      // if (box.isNotEmpty) box.clear();

      box.add(newRule);
      titleController.clear();
      descriptionController.clear();

      SnackbarUtil.showSnackbar(context, 'Rule added');

      setState(() {});
    }
  }

  void deleteRule(int index) {
    box.deleteAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Custom Rule')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Rule Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration:
                      const InputDecoration(labelText: 'Rule Description'),
                ),
                ElevatedButton(
                  onPressed: addCustomRule,
                  child: const Text('Add Rule'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: box.listenable(),
              builder: (context, Box box, _) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final rule = box.getAt(index);
                    if (rule is Map &&
                        rule.containsKey('title') &&
                        rule.containsKey('description')) {
                      // Ensure the rule is a Map
                      return ListTile(
                        title: Text(rule['title'] ??
                            'No Title'), // Use null-aware operator
                        subtitle: Text(rule['description'] ??
                            'No Description'), // Use null-aware operator
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => deleteRule(index),
                        ),
                      );
                    } else {
                      return const ListTile(
                        title: Text('Invalid Rule'),
                      );
                    }
                  },
                  itemCount: box.length,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
