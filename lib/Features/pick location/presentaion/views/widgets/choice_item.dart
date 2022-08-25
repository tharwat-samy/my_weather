import 'package:flutter/material.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../../../styles.dart';

class ChoiceItem extends StatelessWidget {
  ChoiceItem({Key? key, required this.text, @required this.onTap})
      : super(key: key);

  final String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffCCCCCC),
          ),
        ),
        height: SizeConfig.defaultSize * 12,
        width: SizeConfig.defaultSize * 12,
        child: Center(
          child: Text(
            text,
            style: Styles.bodyText2,
            textAlign: TextAlign.right,
          ),
        ),
      ),
    );
  }
}
