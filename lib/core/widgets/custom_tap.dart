import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../styles.dart';
import '../utils/size_config.dart';

class CustomTap extends StatelessWidget {
  final String text;
  final int flex;
  final bool isSelected;
  VoidCallback? onTap;
  CustomTap(
      {required this.text,
      this.flex = 1,
      required this.isSelected,
      this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.defaultSize! * 20,
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? kPrimaryColor : const Color(0xFFE0E0E0),
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              text,
              style: isSelected
                  ? Styles.TapText
                  : Styles.TapText.copyWith(
                      color: Colors.blueAccent,
                    ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
    );
  }
}
