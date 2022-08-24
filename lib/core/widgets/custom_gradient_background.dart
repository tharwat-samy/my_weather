import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/utils/size_config.dart';

class CustomGradientBackGround extends StatelessWidget {
  const CustomGradientBackGround({Key? key, required this.child, this.gradient})
      : super(key: key);

  final Widget child;
  final Gradient? gradient;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        gradient: kLinearGradient,
      ),
      child: child,
    );
  }
}
