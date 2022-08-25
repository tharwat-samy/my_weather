import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../styles.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Moday',
            style: Styles.bodyText2.copyWith(
              color: kPrimaryColor,
            ),
          ),
          Text(
            '27°',
            style: Styles.bodyText2.copyWith(
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
