import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../core/widgets/custom_general_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/space_box.dart';
import '../../../../styles.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({Key? key}) : super(key: key);

  get kPrimaryColor => null;

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
            'Become a Member',
            style: Styles.bodyText6,
          ),
          const SpaceBox(
            height: .5,
          ),
          Text(
            'Create an Account',
            style: Styles.bodyText4.copyWith(
              color: Colors.grey.withOpacity(.7),
            ),
          ),
          const SpaceBox(
            height: 7,
          ),
          CustomTextFormField(
            title: 'User name',
          ),
          const SpaceBox(
            height: 2,
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
          Spacer(),
          CustomButton(
            text: 'Regster',
            backGroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
