import 'package:flutter/material.dart';
import 'package:myweather/Features/home/domain/models/weather_model/weather_model.dart';
import 'package:myweather/Features/home/presentation/widgets/weather_list.dart';

import '../../../../core/utils/size_config.dart';
import 'custom_home_curve.dart';
import 'custom_settings_button.dart';

class HomeVIewBodyFooter extends StatelessWidget {
  const HomeVIewBodyFooter({
    Key? key, required this.weatherModel,
  }) : super(key: key);
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
