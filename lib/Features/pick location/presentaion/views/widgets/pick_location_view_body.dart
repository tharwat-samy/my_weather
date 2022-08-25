import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myweather/Features/pick%20location/presentaion/manger/pick_location_cubit/pick_location_cubit.dart';
import 'package:myweather/Features/pick%20location/presentaion/views/widgets/custom_user_choices.dart';
import 'package:myweather/core/widgets/custom_loading_indicator.dart';

import '../../../../../core/widgets/error_bar.dart';
import '../../../../../core/widgets/space_box.dart';
import '../../../../../styles.dart';
import 'choices_builder.dart';

class PickLocationViewBody extends StatelessWidget {
  const PickLocationViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
            ChoicesBuilder(),
          ],
        ),
      ),
    );
  }
}
