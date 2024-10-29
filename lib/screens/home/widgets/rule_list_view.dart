import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/screens/home/home_mixin.dart';

class RuleListView extends StatelessWidget with HomeMixin {
  RuleListView({super.key, required List<RuleModel> rules}) {
    this.rules = rules;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rules.length.clamp(0, 16),
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: getRuleColor(index),
          title: Text('${index + 1}: ${rules[index].title}'),
          subtitle: Text(rules[index].description),
        );
      },
    );
  }
}
