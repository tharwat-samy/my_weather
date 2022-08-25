import 'package:flutter/material.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';

import '../../../../styles.dart';

class CustomappBar extends StatelessWidget {
  const CustomappBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Prefs.prefs.getString(kCityName) ?? 'Alexandria',
          style: Styles.bodyText5,
        )
      ],
    );
  }
}
