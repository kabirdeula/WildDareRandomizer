import 'package:flutter/material.dart';
import 'package:wild_dare_randomizer/data/models/model.dart';
import 'package:wild_dare_randomizer/screens/home/home_mixin.dart';

class RuleGridView extends StatelessWidget with HomeMixin {
  RuleGridView({super.key, required List<RuleModel> rules}) {
    this.rules = rules;
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = getCrossAxisCount(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: rules.length.clamp(0, 16),
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          color: Colors.white54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${index + 1}: ${rules[index].title}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  rules[index].description,
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
