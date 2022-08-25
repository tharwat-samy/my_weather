import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:myweather/Features/home/presentation/manger/weather_cubit/weather_cubit.dart';
import 'package:myweather/Features/home/presentation/widgets/home_view_body.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';
import 'package:myweather/core/widgets/custom_lottie_indicator.dart';
import 'package:myweather/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: CustomGradientBackGround(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherSuccess) {
              return HomeViewBody(
                weatherModel: state.weatherModel,
              );
            } else if (state is WeatherFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                  style: Styles.bodyText3,
                ),
              );
            } else {
              return Hero(
                tag: 'loading',
                child: CustomLottieIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
