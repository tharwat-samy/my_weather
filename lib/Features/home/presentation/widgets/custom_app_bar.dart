import 'package:flutter/material.dart';

import '../../../../styles.dart';
class CustomappBar extends StatelessWidget {
  const CustomappBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Alexandria',
          style: Styles.bodyText4,
        )
      ],
    );
  }
}