import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myweather/Features/auth/presentaion/views/login_view.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/widgets/space_box.dart';
import 'package:myweather/styles.dart';

import 'custom_animted_text.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'My Weather',
              style: Styles.bodyText6,
            ),
            const SpaceBox(
              height: 1,
            ),
            const AnimtedSplashViewText()
          ],
        ),
      ),
    );
  }
}
