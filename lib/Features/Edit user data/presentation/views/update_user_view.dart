import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';

import '../widgets/update_user_view_body.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGradientBackGround(
        child: UpdateUserViewBody(),
      ),
    );
  }
}
