import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myweather/Features/Edit%20user%20data/presentation/views/update_user_view.dart';

import '../../../../constants.dart';

class CustomSettingsButton extends StatelessWidget {
  const CustomSettingsButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => UpdateUserView(),
          transition: Transition.fade,
          duration: kTransionDuration,
        );
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Center(
          child: Icon(
            Icons.settings_outlined,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
