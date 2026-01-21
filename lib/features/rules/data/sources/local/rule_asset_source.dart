import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../../core/core.dart';
import '../../../rules.dart';

class RuleAssetSource {
  List<String> fileName = ["RuleAssetSource"];

  Future<List<RuleEntity>> loadRules() async {
    final jsonString = await rootBundle.loadString(AssetPaths.systemRules);
    final decoded = json.decode(jsonString) as Map<String, dynamic>;
    final assetFile = RuleAssetFile.fromJson(decoded);

    return assetFile.rules;
  }
}
