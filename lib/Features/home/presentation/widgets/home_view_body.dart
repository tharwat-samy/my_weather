import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/utils/size_config.dart';

import 'custom_home_curve.dart';
import 'custom_settings_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SizedBox(
          height: SizeConfig.defaultSize * 31,
          width: SizeConfig.screenWidth,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: CustomCurve(),
                ),
              ),
              Positioned(
                right: SizeConfig.screenWidth! * .15,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(999),
                  child: CustomSettingsButton(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
