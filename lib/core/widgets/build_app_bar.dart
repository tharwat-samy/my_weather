import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../styles.dart';

AppBar buildAppBar(text, context , [color]) {
  return AppBar(
    centerTitle: true,
    backgroundColor:color ?? Colors.white,
    title: Text(
      text,
      style: Styles.bodyText3,
    ),
    elevation: 0,
    leading: PlatformIconButton(
      icon: Icon(
        PlatformIcons(context).back,
        color: Colors.black,
      ),
    ),
  );
}
