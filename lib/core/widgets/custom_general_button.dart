import 'package:flutter/material.dart';

import '../../styles.dart';
import '../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backGroundColor;
  final Color? textColor;
  final BoxDecoration? decoration;
  final double? high;
  final double? width;
  final double? borderRadius;
  final Widget? child;
  const CustomButton(
      {Key? key,
      required this.text,
      this.onTap,
      this.backGroundColor,
      this.borderRadius,
      this.textColor,
      this.decoration,
      this.high,
      this.width,
      this.child})
      : super(key: key);

  get kPrimaryColor => null;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: high ?? SizeConfig.defaultSize * 5.5,
        width: width == null ? double.infinity : width,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.buttonText.copyWith(color: textColor, fontSize: 13),
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
