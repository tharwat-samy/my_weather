import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myweather/Features/pick%20location/presentaion/manger/pick_location_cubit/pick_location_cubit.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';

import '../../../../core/widgets/error_bar.dart';
import 'widgets/pick_location_view_body.dart';

class PickLocationView extends StatelessWidget {
  const PickLocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PickLocationCubit, PickLocationState>(
        listener: (context, state) {
          if (state is PickLocationSuccess) {
             

              if (state is PickLocationFailure) {
                   
              }
        }},
        builder: (context, state) {
          return CustomGradientBackGround(
            child: PickLocationViewBody(),
          );
        },
      ),
    );
  }
}
