import 'package:flutter/material.dart';
import 'package:instagram_colon/extensions/string/remove_all.dart';

extension AsHtmlColoToColor on String {
  Color htmlColorToColor() => Color(
        int.parse(
          removeAll(['0x', '#']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}
