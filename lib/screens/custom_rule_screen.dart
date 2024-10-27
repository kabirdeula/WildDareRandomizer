import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/providers/provider.dart';
import 'package:wild_dare_randomizer/utils/util.dart';

class CustomRuleScreen extends ConsumerStatefulWidget {
  const CustomRuleScreen({super.key});

  @override
  ConsumerState<CustomRuleScreen> createState() => _CustomRuleScreenState();
}

class _CustomRuleScreenState extends ConsumerState<CustomRuleScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addCustomRule() async {
    if (ValidationUtils.isValidRuleTitle(titleController.text) &&
        ValidationUtils.isValidRuleDescription(descriptionController.text)) {
      final newRule = RuleModel(
        title: titleController.text,
        description: descriptionController.text,
      );

      await ref.read(ruleRepositoryProvider).addRule(newRule);
      if (!mounted) return;
      ref.invalidate(rulesProvider);

      titleController.clear();
      descriptionController.clear();

      SnackbarUtil.showSnackbar(context, 'Rule added');
    }
  }

  void deleteCustomRule(int index) async {
    await ref.read(ruleRepositoryProvider).deleteRule(index);
    ref.invalidate(rulesProvider);
  }

  void editCustomRule(int index, RuleModel rule) async {
    await ref.read(ruleRepositoryProvider).updateRule(index, rule);
    ref.invalidate(rulesProvider);
  }

  @override
  Widget build(BuildContext context) {
    final asyncRules = ref.watch(rulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Rules'),
      ),
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
            child: asyncRules.when(
              data: (rules) => ListView.builder(
                itemCount: rules.length,
                itemBuilder: (context, index) {
                  final rule = rules[index];
                  return ListTile(
                    title: Text(rule.title),
                    subtitle: Text(rule.description),
                    trailing: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            titleController.text = rule.title;
                            descriptionController.text = rule.description;
                          },
                          icon: const Icon(Icons.edit),
                        )
                      ],
                    ),
                  );
                },
              ),
              error: (error, state) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
    
  }
}
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:wild_dare_randomizer/app/app.dart';
// import 'package:wild_dare_randomizer/utils/util.dart';

// class CustomRuleScreen extends StatefulWidget {
//   const CustomRuleScreen({super.key});

//   @override
//   State<CustomRuleScreen> createState() => _CustomRuleScreenState();
// }

// class _CustomRuleScreenState extends State<CustomRuleScreen> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   final box = Hive.box(Config.kHiveBox);

//   void addCustomRule() {
//     if (titleController.text.isNotEmpty &&
//         descriptionController.text.isNotEmpty) {
//       final newRule = {
//         'title': titleController.text,
//         'description': descriptionController.text,
//       };

//       box.add(newRule);
//       titleController.clear();
//       descriptionController.clear();

//       SnackbarUtil.showSnackbar(context, 'Rule added');

//       setState(() {});
//     }
//   }

//   void deleteRule(int index) {
//     box.deleteAt(index);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add Custom Rule')),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: titleController,
//                   decoration: const InputDecoration(labelText: 'Rule Title'),
//                 ),
//                 TextField(
//                   controller: descriptionController,
//                   decoration:
//                       const InputDecoration(labelText: 'Rule Description'),
//                 ),
//                 ElevatedButton(
//                   onPressed: addCustomRule,
//                   child: const Text('Add Rule'),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ValueListenableBuilder(
//               valueListenable: box.listenable(),
//               builder: (context, Box box, _) {
//                 return ListView.builder(
//                   itemBuilder: (context, index) {
//                     final rule = box.getAt(index);
//                     if (rule is Map &&
//                         rule.containsKey('title') &&
//                         rule.containsKey('description')) {
//                       // Ensure the rule is a Map
//                       return ListTile(
//                         title: Text(rule['title'] ??
//                             'No Title'), // Use null-aware operator
//                         subtitle: Text(rule['description'] ??
//                             'No Description'), // Use null-aware operator
//                         trailing: IconButton(
//                           icon: const Icon(Icons.delete),
//                           onPressed: () => deleteRule(index),
//                         ),
//                       );
//                     } else {
//                       return const ListTile(
//                         title: Text('Invalid Rule'),
//                       );
//                     }
//                   },
//                   itemCount: box.length,
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
