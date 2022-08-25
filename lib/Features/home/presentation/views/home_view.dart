import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/Features/home/presentation/widgets/home_view_body.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: HomeViewBody(),
    );
  }
}
