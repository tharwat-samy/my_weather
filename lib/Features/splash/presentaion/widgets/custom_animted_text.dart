import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:myweather/Features/home/presentation/views/home_view.dart';
import 'package:myweather/Features/pick%20location/presentaion/manger/pick_location_cubit/pick_location_cubit.dart';
import 'package:myweather/Features/pick%20location/presentaion/views/pick_location_view.dart';
import 'package:myweather/core/singleton/shared_prefrence_singleton.dart';
import 'package:myweather/core/utils/firebase_service.dart';

import '../../../../constants.dart';
import '../../../../styles.dart';
import '../../../auth/presentaion/views/login_view.dart';
import '../../../home/presentation/manger/weather_cubit/weather_cubit.dart';

class AnimtedSplashViewText extends StatefulWidget {
  const AnimtedSplashViewText({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimtedSplashViewText> createState() => _AnimtedSplashViewTextState();
}

class _AnimtedSplashViewTextState extends State<AnimtedSplashViewText>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _slideAnimation;
  late AnimationController _slideanimationController;

  @override
  void initState() {
    super.initState();

    initSlideAnimation();
    goToNextView();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Text(
        'Know your Weather Any where',
        style: Styles.bodyText2.copyWith(
          color: Colors.grey.withOpacity(.6),
        ),
      ),
    );
  }

  void initSlideAnimation() {
    _slideanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero).animate(
      CurvedAnimation(parent: _slideanimationController, curve: Curves.linear),
    );

    _slideanimationController.forward();
  }

  void goToNextView() {
    Future.delayed(kDuration, () {
      if (FirebaseService().isLoggedIn) {
        bloc.BlocProvider.of<WeatherCubit>(context).getWeather(
          cityName: Prefs.prefs.getString(
            kCityName,
          ),
        );
        Get.off(
          () => const HomeView(),
          transition: Transition.fade,
        );
      } else {
        Get.off(
          () => const LoginView(),
          transition: Transition.fade,
        );
      }
    });
  }
}
