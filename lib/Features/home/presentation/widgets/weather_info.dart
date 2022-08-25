import 'package:flutter/material.dart';

import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '27',
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
              '25',
              style: Styles.bodyText3,
            ),
            Text(
              'cloudy',
              style: Styles.bodyText5,
            ),
            Text(
              '25',
              style: Styles.bodyText3,
            ),
          ],
        ),
      ],
    );
  }
}
