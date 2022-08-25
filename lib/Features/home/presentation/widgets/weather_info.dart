import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myweather/Features/home/domain/models/weather_model/weather_model.dart';
import 'package:myweather/core/utils/size_config.dart';

import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class WeatherInfo extends StatelessWidget {
  WeatherInfo({Key? key, required this.Weather}) : super(key: key);

  final WeatherModel Weather;
  @override
  Widget build(BuildContext context) {
    print(Weather.current!.condition!.icon!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          'https:' '${Weather.current!.condition!.icon!}',
          height: SizeConfig.defaultSize * 20,
        ),
        Text(
          '${Weather.current?.tempC!.toInt()}°',
          style: Styles.bodyText6.copyWith(
            fontSize: 46,
            fontWeight: FontWeight.w500,
          ),
        ),
        SpaceBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${Weather.forecast?.forecastday![0].day!.mintempC!.ceil()}°',
              style: Styles.bodyText3,
            ),
            SizedBox(
              width: SizeConfig.defaultSize * 20,
              child: AutoSizeText(
                '${Weather.current!.condition!.text}',
                textAlign: TextAlign.center,
                style: Styles.bodyText5,
                maxLines: 2,
              ),
            ),
            Text(
              '${Weather.forecast?.forecastday![0].day!.maxtempC!.ceil()}°',
              style: Styles.bodyText3,
            ),
          ],
        ),
      ],
    );
  }
}
