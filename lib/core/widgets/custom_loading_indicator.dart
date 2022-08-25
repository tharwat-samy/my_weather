import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator();
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      size: 25,
      itemBuilder: (BuildContext context, int index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: kPrimaryColor,
          ),
        );
      },
    );
  }
}
