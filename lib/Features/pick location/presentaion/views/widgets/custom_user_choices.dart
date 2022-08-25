import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/widgets/custom_general_button.dart';
import 'package:myweather/core/widgets/custom_text_field.dart';
import 'package:myweather/core/widgets/error_bar.dart';
import 'package:myweather/core/widgets/space_box.dart';
import 'package:myweather/styles.dart';

import '../../../../../core/utils/size_config.dart';
import 'choice_item.dart';

class LocationChoices extends StatefulWidget {
  const LocationChoices({Key? key}) : super(key: key);

  @override
  State<LocationChoices> createState() => _LocationChoicesState();
}

class _LocationChoicesState extends State<LocationChoices>
    with TickerProviderStateMixin {
  late Animation _fadeAnimation;
  late AnimationController _FadeanimationController;

  late Animation<Offset> _slideAnimation;
  late AnimationController _slideanimationController;

  @override
  void initState() {
    initSlideAnimation();
    initFadeAnimation();
    super.initState();
  }

  bool isFirstChild = true;
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 250),
      crossFadeState:
          isFirstChild ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            title: 'Enter a City Name',
            onSubmitted: (value) {
              if (value?.isNotEmpty ?? false) {}
            },
          ),
        const   SpaceBox(
            height: 2,
          ),
          CustomButton(
            onTap: () {},
            text: 'Confirm',
            textColor: kPrimaryColor,
            backGroundColor: Colors.white,
          ),
        const   SpaceBox(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isFirstChild = !isFirstChild;
              });
            },
            child: Text(
              'back to Choices',
              style: Styles.bodyText2,
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
      firstChild: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _slideAnimation]),
        builder: (context, _) => SlideTransition(
          position: _slideAnimation,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChoiceItem(
                  onTap: () {
                    setState(() {
                      isFirstChild = false;
                    });
                  },
                  text: 'Manually',
                ),
                ChoiceItem(
                  onTap: () async {
                    await determineLocation(context);
                  },
                  text: 'Automatically',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }















  void initFadeAnimation() {
    _FadeanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _fadeAnimation = Tween<double>(begin: .2, end: 1).animate(
      CurvedAnimation(parent: _FadeanimationController, curve: Curves.linear),
    );

    _FadeanimationController.forward();
  }

  void initSlideAnimation() {
    _slideanimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero).animate(
      CurvedAnimation(parent: _slideanimationController, curve: Curves.linear),
    );

    _slideanimationController.forward();
  }

  Future<void> determineLocation(context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (serviceEnabled) {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        errorBar(context, message: 'Location Permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        errorBar(context, message: 'Location Permissions are denied forever');
      } else {
        print(await Geolocator.getCurrentPosition());
      }
    } else {
      errorBar(context, message: 'Location Services are disabled');
    }
  }
}
