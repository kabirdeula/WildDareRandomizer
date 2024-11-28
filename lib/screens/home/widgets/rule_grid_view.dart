import 'package:flip_card/flip_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        crossAxisSpacing: kIsWeb ? 4 : 10.w,
        mainAxisSpacing: kIsWeb ? 4 : 10.h,
      ),
      itemCount: rules.length.clamp(0, 16),
      itemBuilder: (context, index) {
        return FlipCard(
          front: buildRuleCard(
            context: context,
            content: '${index + 1}: ${rules[index].title}',
            color: getRuleColor(rules[index].level),
            style: Theme.of(context).textTheme.displaySmall,
            maxFontSize: kIsWeb ? 34 : 40.sp,
            minFontSize: kIsWeb ? 30 : 24.sp,
          ),
          back: buildRuleCard(
            isScrollable: true,
            context: context,
            content: rules[index].description,
            color: getRuleColor(rules[index].level),
            style: Theme.of(context).textTheme.headlineLarge,
            maxFontSize: kIsWeb ? 48 : 40.sp,
            minFontSize: kIsWeb ? 34 : 24.sp,
          ),
        );
      },
    );
  }
}
