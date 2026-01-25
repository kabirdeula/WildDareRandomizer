import 'package:flutter/material.dart';

int dynamicCrossAxisCount(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  return (screenWidth < 600)
      ? 2
      : (screenWidth < 900)
      ? 3
      : (screenWidth < 1200)
      ? 4
      : 6;
}
