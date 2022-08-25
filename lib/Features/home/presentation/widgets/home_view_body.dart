import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/Features/home/presentation/widgets/weather_list.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/utils/size_config.dart';
import 'package:myweather/styles.dart';

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
                right: SizeConfig.screenWidth * .15,
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(999),
                  child: CustomSettingsButton(),
                ),
              ),
              Positioned(
                left: 24,
                right: 24,
                bottom: 16,
                child: SizedBox(
                  height: SizeConfig.defaultSize * 25,
                  child: WeatherList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
