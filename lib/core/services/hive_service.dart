import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/rules/rules.dart';
import '../core.dart';

abstract final class HiveService {
  static final List<String> fileName = ["HiveService"];
  static Future<void> init() async {
    if (kIsWeb) {
      await Hive.initFlutter();
    } else {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(appDocumentDir.path);
    }

    // * Register Adapters
    Hive.registerAdapter(RuleEntityAdapter());
    Hive.registerAdapter(RandomValueAdapter());

    log.d(
      "Initialized Hive for ${kIsWeb ? 'Web' : 'Mobile'} and registered adapters.",
      tags: fileName,
    );
  }

  static Future<void> clearAllData() async {
    await clearBox<RuleEntity>(boxName: ruleEntityKey.name);
  }

  static Future<Box<T>> openBox<T>({required String boxName}) async {
    try {
      if (!Hive.isBoxOpen(boxName)) {
        log.d("Opening box: $boxName", tags: fileName);
        return await Hive.openBox<T>(boxName);
      }

      return Hive.box<T>(boxName);
    } catch (e) {
      log.e("Failed to open box: $boxName\n$e", tags: fileName);
      throw HiveError(e.toString());
    }
  }

  static Future<void> clearBox<T>({required String boxName}) async {
    final box = await openBox<T>(boxName: boxName);
    await box.clear();
  }

  static Future<void> closeAll() async => await Hive.close();

  // static Future<void> registerBox<T>({required HiveBoxKey<T> boxKey}) async {
  //   final box = await openBox<T>(boxName: boxKey.name);
  //   log.d("Registered Hive Box: ${boxKey.name}", tags: fileName);
  // }
}

class HiveBoxKey<T> {
  final String name;

  const HiveBoxKey({required this.name});
}

abstract final class HiveBoxes {
  static const String ruleEntity = 'RuleEntity';
}

const ruleEntityKey = HiveBoxKey<RuleEntity>(name: HiveBoxes.ruleEntity);
