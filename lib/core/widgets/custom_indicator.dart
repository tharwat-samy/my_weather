import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class CustomIdicator extends StatelessWidget {
  const CustomIdicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xffA7A7A7),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: LinearProgressIndicator(
          minHeight: SizeConfig.defaultSize * 1.3,
          color: Color(0xff58CB2D),
          backgroundColor: Color(0xffF4F4F4),
          value: .7,
        ),
      ),
    );
  }
}
