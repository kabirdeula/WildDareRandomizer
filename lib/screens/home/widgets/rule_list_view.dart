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
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            color: getRuleColor(index),
          ),
          child: ListTile(
            title: Text('${index + 1}: ${rules[index].title}'),
            subtitle: Text(rules[index].description),
          ),
        );
      },
    );
  }
}
