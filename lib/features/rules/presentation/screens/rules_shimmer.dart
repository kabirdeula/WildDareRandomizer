import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../core/core.dart';
import '../../rules.dart';

class RulesShimmer extends StatelessWidget {
  const RulesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppConstants.appName),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF8F9FA), Color(0xFFE9ECEF)],
          ),
        ),
        child: Column(
          children: [
            const ShimmerProgressHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: dynamicCrossAxisCount(context),
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 16,
                  itemBuilder: (_, _) {
                    return const ShimmerRuleCard();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerProgressHeader extends StatelessWidget {
  const ShimmerProgressHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacitySafe(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const AppShimmer(
        child: Column(
          children: [
            Row(
              children: [
                ShimmerBox(width: 60, height: 60, borderRadius: 30),
                SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(width: 200, height: 20),
                      SizedBox(height: 8),
                      ShimmerBox(width: 120, height: 16),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),

            ShimmerBox(width: double.infinity, height: 44),
          ],
        ),
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class ShimmerRuleCard extends StatelessWidget {
  const ShimmerRuleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
