import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottieIndicator extends StatelessWidget {
  const CustomLottieIndicator({Key? key}) : super(key: key);
 final lottieAnimation =
      'https://assets10.lottiefiles.com/packages/lf20_r2nu21mo.json';
  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.network(lottieAnimation));
  }
}
