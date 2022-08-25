import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';

import 'widgets/pick_location_view_body.dart';

class PickLocationView extends StatelessWidget {
  const PickLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomGradientBackGround(
        child: PickLocationViewBody(),
      ),
    );
  }
}
