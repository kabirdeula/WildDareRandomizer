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
        final tileColor = _getTileColor(index);
        return ListTile(
          tileColor: tileColor,
          title: Text('${index + 1}: ${rules[index].title}'),
          subtitle: Text(rules[index].description),
        );
      },
    );
  }

  Color _getTileColor(int index) {
    switch (index % 4) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.yellow;
      default:
        return Colors.purple;
    }
  }
}
