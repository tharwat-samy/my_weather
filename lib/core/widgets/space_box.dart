import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/size_config.dart';

class SpaceBox extends StatelessWidget {
  const SpaceBox({Key? key, this.height, this.width}) : super(key: key);

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize * (height ?? 0),
      width: SizeConfig.defaultSize * (width ?? 0),
    );
  }
}
