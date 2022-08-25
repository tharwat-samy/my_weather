import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myweather/Features/auth/presentaion/views/register_view.dart';
import 'package:myweather/Features/home/presentation/views/home_view.dart';
import 'package:myweather/constants.dart';
import 'package:myweather/core/widgets/custom_general_button.dart';
import 'package:myweather/core/widgets/custom_text_field.dart';
import 'package:myweather/core/widgets/space_box.dart';
import 'package:myweather/styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceBox(
            height: 7,
          ),
          Text(
            'Welcome back',
            style: Styles.bodyText6,
          ),
          const SpaceBox(
            height: .5,
          ),
          Text(
            'Login now',
            style: Styles.bodyText4.copyWith(
              color: Colors.grey.withOpacity(.7),
            ),
          ),
          const SpaceBox(
            height: 7,
          ),
          CustomTextFormField(
            title: 'Email',
          ),
          const SpaceBox(
            height: 2,
          ),
          CustomTextFormField(
            title: 'Password',
          ),
          const SpaceBox(
            height: 1,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => RegisterView(),
                transition: Transition.rightToLeft,
                duration: kTransionDuration,
              );
            },
            child: Text(
              'Don\'t have an account? register now',
              style: Styles.bodyText1,
            ),
          ),
          Spacer(),
          CustomButton(
            onTap: () {
              Get.to(() => HomeView(),
                  transition: Transition.fade, duration: kTransionDuration);
            },
            text: 'Login',
            textColor: kPrimaryColor,
            backGroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
