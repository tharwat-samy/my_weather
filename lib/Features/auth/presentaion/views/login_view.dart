import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myweather/Features/auth/presentaion/widgets/login_view_body.dart';
import 'package:myweather/core/widgets/custom_gradient_background.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomGradientBackGround(
          child: LoginViewBody(),
        ));
  }
}
