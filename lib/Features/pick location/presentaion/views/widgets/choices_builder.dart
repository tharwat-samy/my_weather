import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:myweather/Features/home/presentation/manger/weather_cubit/weather_cubit.dart';
import 'package:myweather/Features/home/presentation/views/home_view.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';
import 'package:myweather/core/utils/size_config.dart';
import 'package:myweather/core/widgets/custom_lottie_indicator.dart';
import 'package:myweather/core/widgets/space_box.dart';

import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../../../../core/widgets/error_bar.dart';
import '../../manger/pick_location_cubit/pick_location_cubit.dart';
import 'custom_user_choices.dart';

class ChoicesBuilder extends StatelessWidget {
  const ChoicesBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bloc.BlocConsumer<PickLocationCubit, PickLocationState>(
      listener: (context, state) {
        if (state is PickLocationSuccess) {
          bloc.BlocProvider.of<WeatherCubit>(context).getWeather();
          Get.to(
            () => HomeView(),
            transition: Transition.fade,
            duration: kTransionDuration,
          );
        }
        if (state is PickLocationFailure) {
          errorBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is PickLocationLoading) {
          return Column(
            children: const [
              SpaceBox(
                height: 5,
              ),
              Hero(
                tag: 'loading',
                child: CustomLottieIndicator(),
              ),
            ],
          );
        } else {
          return const LocationChoices();
        }
      },
    );
  }
}
