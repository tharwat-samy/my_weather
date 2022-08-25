
import 'package:flutter/material.dart';

import '../../../../constants.dart';
class CustomSettingsButton extends StatelessWidget {
  const CustomSettingsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.white,
      child: Center(
        child: Icon(
          Icons.settings_outlined,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
