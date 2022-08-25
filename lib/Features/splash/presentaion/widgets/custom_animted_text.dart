import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../styles.dart';
import '../../../auth/presentaion/views/login_view.dart';

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
      Get.to(
        () => LoginView(),
        transition: Transition.fade,
      );
    });
  }
}
