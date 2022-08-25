import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/Features/pick%20location/presentaion/views/widgets/custom_user_choices.dart';

import '../../../../../core/widgets/space_box.dart';
import '../../../../../styles.dart';

class PickLocationViewBody extends StatelessWidget {
  const PickLocationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceBox(
            height: 7,
          ),
          Text(
            'Pick your Location',
            style: Styles.bodyText5,
          ),
          const SpaceBox(
            height: 10,
          ),
          LocationChoices(),
        ],
      ),
    );
  }
}
