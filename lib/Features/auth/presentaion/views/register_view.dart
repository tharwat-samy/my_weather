import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/Features/auth/presentaion/widgets/register_view_body.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomGradientBackGround(
        child: RegisterViewBody(),
      ),
    );
  }
}
