import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';

class RuleListView extends StatelessWidget {
  final List<RuleModel> rules;

  const RuleListView({super.key, required this.rules});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rules.length.clamp(0, 16),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${index + 1}: ${rules[index].title}'),
          subtitle: Text(rules[index].description),
        );
      },
    );
  }
}
