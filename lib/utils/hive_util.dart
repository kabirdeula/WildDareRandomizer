import 'package:hive_flutter/hive_flutter.dart';

class HiveUtil {
  static Future<Box> openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }
}
